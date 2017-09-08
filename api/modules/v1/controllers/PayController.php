<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:18
 */

namespace api\modules\v1\controllers;

use api\models\Game;
use api\models\GameRole;
use api\models\Order;
use api\models\Server;
use api\models\User;
use Yii;
use yii\base\ErrorException;
use yii\web\Controller;
use yii\web\HttpException;

class PayController extends Controller
{
    public $enableCsrfValidation=false;
    static $message=[
        200 => 'OK',
    ];

    /**
     * 统一下单地址
     */
    public function actionUnifiedorder(){
            if (! Yii::$app->request->isPost) return json_encode(['status'=>0,'msg'=>'角色名查询失败，请更新角色信息后重试']);
            $ordermodel=new Order();
            $request=Yii::$app->request;
            $postData=$request->post();
            $postKey=['order_sn','username','money','gameid','sid','rolename','rebate_id','pay_type','pay_source'];
            $tmp=[];
            /**去除多余数据**/
            foreach ($postData as $key =>$value ) {
                if (in_array($key,$postKey)){
                    $tmp[$key]= htmlspecialchars(trim($value));
                }
            }
            $postData=$tmp;
            unset($tmp);
            /**验证订单号是否可以使用**/
            if (!$postData['order_sn']||!$postData['username']||!$postData['money']||!$postData['pay_type'])
                return json_encode(['status'=>0,'msg'=>'参数不全']);
            $order=Order::findOne(['order_sn'=>$postData['order_sn']]);

            if (!empty($order) && $order->pay_status == Order::STATUS_PAY_YES )
                return json_encode(['status'=>0,'msg'=>'该订单已被使用']);
            if ($order)
                return json_encode(['status'=>0,'msg'=>'已经下单']);
            /**验证充值用户**/
            $user=User::findByUsername($postData['username']);
            if (!$user ||  $user->status == User::STATUS_DELETED ) //用户不存在或者已被禁用
                return json_encode(['status'=>0,'msg'=>'用户不存在或者已被禁用']);
            $postData['uid']=$user->uid;
            /**验证代金券 并计算应付金额 到账金额**/
            $postData['payables']=$postData['money'];//代金券预留 应付款，和到账金额默认成订单金额
            $postData['game_money']=$postData['money'];//代金券预留 应付款，和到账金额默认成订单金额
            /**如果是充值到游戏 则验证充值游戏区服和角色的正确性 并写入角色名和充值付款标题**/

            if ( !in_array($postData['pay_type'],['PlatCoin']) ){
                if (!$postData['gameid'] || !$postData['sid']) return json_encode(['status'=>0,'msg'=>'游戏和区服ID不能为空']);
                $game=Game::findOne(['id'=>$postData['gameid']]);
                if (!$game)
                    return json_encode(['status'=>0,'msg'=>'游戏不存在']);
                if ($game->isopen != Game::OPEN_YES)
                    return json_encode(['status'=>0,'msg'=>'游戏已关闭']);
                $server=Server::findOne(['sid'=>$postData['sid']]);
                if (!$server)
                    return json_encode(['status'=>0,'msg'=>'游戏区服不存在']);
                if ($server->isstop == Server::STOP_YES )
                    return json_encode(['status'=>0,'msg'=>'游戏区服已关闭']);
                $postData['title']= $game->name.'-'.$server->servername  ;
                $role=GameRole::findOne(['uid'=>$user->uid,'gid'=>$game->id,'sid'=>$server->sid,'role'=>$postData['rolename']]);
                if (!$role) return json_encode(['status'=>0,'msg'=>'角色名查询失败，请更新角色信息后重试']);
            }


            $postData['create_time']=time();
            $postData['channel']=$user->tuid;
            $ordermodel->loadDefaultValues();
            /*加载并验证**/
            if(!$ordermodel->load(['Order'=>$postData]))
                return json_encode(['status'=>0,'msg'=>'数据载入失败！']);
            if (!$ordermodel->writepaytype() )
                return json_encode(['status'=>0,'msg'=>'支付渠道更新失败，请稍后再试！']);
            if ( $ordermodel ->save()){

                return json_encode(['status'=>200,'msg'=>'下单成功，请及时付款','data'=>
                    [
                        'uid'=>$ordermodel->uid,
                        'order_sn'=>$ordermodel->order_sn,
                        'username'=>$ordermodel->username,
                        'money'=>$ordermodel->money,
                        'payables'=>$ordermodel->money,
                        'rolename'=>$ordermodel->rolename,
                        'productName'=>$ordermodel->title,
                        'create_time'=>$ordermodel->create_time,
                        'pay_status'=>$ordermodel->pay_status==Order::STATUS_PAY_YES?'已付款':'等待付款'
                    ]
                ]);
            }else{
                return json_encode(['status'=>0,'msg'=>'数据库写入失败','data'=>$ordermodel->getErrors()]);
            }

    }

    /**
     * 对外付款接口
     */
    public function actionPay(){
        \api\models\pay\Alipay::Pay();
    }

    /**
     * 通知接口
     */
    public function actionNotify($type)
    {
        //todo 验证通知真实性
        //todo 为真记录日志
        $payPargam=Yii::$app->params['payType'];
        $secure=$payPargam[$type]['apiClass'];
        $check=$secure::check($_POST);
        if ($check){
            $successtime = time();
            $order = Order::findOne(['order_sn' => $check['order_sn']]);
            $order->pay_time = $successtime;
            $order->pay_sn = $check['pay_sn'];
            $order->really_money = $check['really_money'];
            $order->pay_status = Order::STATUS_PAY_YES;
            $after = $this->BeginPay($order, $order->really_money, $successtime);
            var_dump($after);
        }
        $pay_sn='135555111_123';
        $orderid = '135555111';
        $really_money = '9.8';

    }

    /**
     * @param $order \api\models\Order
     * @param $really_money
     * @param $successtime
     * 通知验证成功后的操作
     */
    private function BeginPay($order, $really_money, $successtime)
    {
        /**先更新付款状态**/
        if (!$order->pay_status != Order::STATUS_PAY_YES) return false;
        /**开启事务，方便充值出错回滚订单信息**/
        $tr = Yii::$app->db->beginTransaction();
        try {
            if (empty($order))
                throw new \Exception('订单不存在', 1);//订单不存在
            if ($order->status == 1)
                return true;
            //先修改订单状态，然后再发货

            $order->status = 1;
            $order->remark .= '>付款';
            if (!$order->save()) throw  new \Exception('订单状态保存失败', 2);
            $user = User::findByUsername($order->username);
            if (!$user) throw  new \Exception('用户不存在', 5);
            /**增加积分**/
            $user->score += $order->money * Yii::$app->params['scoreRate'];
            $user->score_all += $order->money * Yii::$app->params['scoreRate'];
            $user->total_money += $order->money;
            /*根据订单type发货*/

            switch ($order->type) {
                /**平台币**/
                case 'PlatCoin':
                    $user->money += $order->game_money;
                    if (!$user->save(false))
                        throw new ErrorException('平台币充值失败', 3);//订单不存在
                    break;
                /*充值到游戏**/
                case 'GamePay':
                    if (!GameController::GamePay($order))
                        throw new ErrorException('游戏充值失败', 4);//订单不存在
                    break;
                default:
                    break;
            }
            if ($user->isAttributeChanged('score') && !$user->save(false))
                PublicController::Log('用户状态保存失败api\\modules\\v1\\controllers\\PayController', "订单号：{$order->order_sn}", '_err');
            $order->remark .= '>到账';
            $order->save(false);
            $tr->commit();
            return true;
        } catch (\Exception $errorException) {
            $msg = $errorException->getMessage();
            PublicController::Log($msg . 'api\\modules\\v1\\controllers\\PayController', "订单号：{$order->order_sn}\t$msg", '_err');
            $tr->rollBack();
            return false;
        }
    }




}