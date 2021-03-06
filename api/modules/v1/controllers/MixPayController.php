<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/1
 * Time: 17:24
 */

namespace api\modules\v1\controllers;

use api\models\Game;
use api\models\Order;
use api\models\PartnerGame;
use api\models\PartnerServer;
use api\models\PartnerUser;
use api\models\Server;
use api\models\User;
use common\core\Controller;
use api\controllers\PublicController;
use Yii;

class MixPayController extends Controller
{
    public static $tr ;
    public static $errMsg ;//错误提示详情，在返回JSON.msg 的后面追加
    public $errorIndex = [
        1 => '验证PID失败',
        2 => '接口的验证',
        3 => '验证时间戳超时',
        4 => 'Sign签名错误',
        5 => '没有游戏运营权限',
        6 => '游戏已关闭',
        7 => '没有此游戏，或游戏已删除',
        8 => '区服编号不存在',
        9 => '区服已被禁止充值',
        10 => '区服不存在或已删除',
        11 => '未开服',
        12 => '用户名非法',
        13 => '充值用户不存在',
        14 => '充值用户没有创建角色',
        15 => '指定角色不存在',
        16 => '充值金额至少一元',
        17 => '付款比例错误',
        18 => '预付费不足',
        19 => '订单号不能为空',
        20 => '扣款失败',
        21 => '订单更新失败',
        22 => '游戏充值失败',
        23 => '订单写入失败',
        200 => 'OK',
    ];
    /**
     * @param \yii\base\Action $action
     * @param mixed $result
     * @return mixed
     * 记录日志 统一返回格式
     */
    public function afterAction($action, $result)
    {
        $errorid = 'error' . ucfirst($action->id);//根据控制器ID获取对应错误代码
        $code = $result;
        if (is_numeric($code)){
            $result = [];
            $result['code'] = $code;
            if (isset($this->$errorid)) {
                $error = $this->$errorid;
                if (isset($error[$code]))
                    $result['msg'] = $error[$code];
            }
            $result['flow'] = static::$errMsg;
            $result =  json_encode($result);
            PublicController::Log("预付费访问日志",Yii::$app->request->absoluteUrl ."\treturn:{$result}\t流程:".static::$errMsg , 'balanceLog');

        }
        return parent::afterAction($action, $result);
    }
    public function actionIndex($pid, $uid, $gid, $sid, $orderid, $money,$mid, $bank, $back='',$product_name='', $time, $sign,$rolename=null)
    {
        /**验证PID**/
        $pid = abs((int)$pid);
        $partner = PartnerUser::findMix($pid);
        if (empty($partner) || $partner->status == PartnerUser::STATUS_DISABLE || $partner->parentid != 0)
            return 1;
        /**手否具有访问该接口的验证**/
        $check = $partner->checkIpAndAccess(Yii::$app->request->getUserIP(), Yii::$app->request->pathInfo);
        if ($check['status'] == false) {
            $this->errorIndex[2] .= $check['msg'];
            return 2;
        };
        if (Yii::$app->request->getUserIP() !== '127.0.0.1') { //本地不验证签名和时间戳
            /**验证时间戳，前后不超过十分钟**/
            if (!is_numeric($time) || $time + 600 < time() || $time - 600 > time())
                return 3;
            /**验证sign**/
            if (md5($uid . $pid . $gid . $sid . $orderid . $money  . $time . $partner->pkey) !== $sign)
                return 4;
        }

        /**验证gid**/
        $partnerGame = PartnerGame::findOne(['partnerid' => $partner->id, 'gkey' => $gid]);

        if (empty($partnerGame))
            return 5;/*没有游戏运营权限*/
        if ($partnerGame->status == PartnerGame::STATUS_DISABLE)
            return 6;//游戏已关闭

        $game = Game::findOne($partnerGame->gid);/*本站游戏开关状态不在此验证，关闭混服游戏，需要更改PartnerGame，以便单独控制*/
        if (empty($game))
            return 7;/*没有此游戏，或游戏已删除*/
        $orderData['gameid']=$game->id;
        /*验证sid，先验证partnerServer数据，根据此数据找真正的(本站)区服sid，*/
        $partnerServer = PartnerServer::findOne(['gid' => $partnerGame->gid, 'pserverid' => $sid]);
        if (!$partnerServer)
            return 8;//区服编号不存在
        if ($partnerServer->status != PartnerServer::STATUS_ACTIVE)
            return 9;//区服已被禁止充值

        /**验证sid对应本站Server数据**/
        $server = Server::findOne($partnerServer->sid);
        if (empty($server))
            return 10;//区服不存在或已删除

        $test_accounts = explode(',', $partner->test_account);
        if ($server->start_time > time() && !in_array($uid, $test_accounts))
            return 11;//未开服
        $orderData['sid']=$server->sid;
        /**验证UID**/
        if (!preg_match('/^[0-9A-Za-z]{6,20}$/', $uid))
            return 12;//用户名非法
        $username=$partner->username .'_'. $uid;
        $user=User::findOne(['username'=>$username]);
        if (!$user)
            return 13;//充值用户不存在
        $orderData['uid']=$user->uid;
        $orderData['username']=$user->username;
        /**验证Rolename**/

        $roleData=ServerController::GameRole($user,$server);
        if (!$roleData)
            return 14;//充值用户没有创建角色
        $roleArr=array_column($roleData,'role');
        if ($rolename&&!in_array($rolename,$roleArr))
            return 15;//指定角色不存在
        $orderData['rolename']=$rolename?$rolename:implode(';',$roleArr);

        /**验证订单号是否存在，存在则直接跳过数据库数据创建**/
        if (!$orderid) return 19;//订单号不能为空
        $order=Order::findOne(['pay_sn'=>$orderid,'channel'=>$pid ]);
        if ($order){















        }
        $orderData['pay_sn']=$orderid;

        /**验证预付费余额是否充足**/

        $orderData['money']=$orderData['game_money']=sprintf("%0.2f",$money);
        if ($orderData['money']<1) return 16;//充值金额至少一元
        $rete=$partnerGame->rate?$partnerGame->rate:$partner->rate;
        if ($rete<0.1) return 17;//付款比例错误
        $orderData['payables']=$orderData['money']*$rete;
        if ($orderData['payables'] > $partner->money )
            return 18;//预付费不足
        /**开始写入数据库**/
        $orderData['order_sn']=$this->actionOrdersn();
        $orderData['rebate_id']=0;
        $orderData['type']=Order::TYPE_HF_BALANCE;
        $orderData['title']='预付款';
        $orderData['channel']=$partner->id;
        $orderData['create_time']=time();
        $orderData['pay_type']="balance";
        $orderData['pay_source']="balance";
        $orderData['remark']="下单";
        $order=new Order();
        $order->loadDefaultValues();
        if ($order->load(['Order'=>$orderData])&&$order->save()){
            static::$errMsg='下单';
            return $this->BeginGamePay($order,$partner,$partnerGame,$user);
        }
        return  23;//订单写入失败

    }
    public static function rollbackAndReturn($code,$order){
        self::$errMsg.='>还原数据到之前的状态(退款)>交易失败';
        $tr=static::$tr?static::$tr:Yii::$app->db->beginTransaction();
        $tr->rollBack();
        $order->remark .= self::$errMsg ;
        $order->remark =   mb_substr($order->remark,-1,100);
        $order->save();
        return $code;
    }

    public function actionOrdersn(){
        return date('YmdHis').'YFF'.str_pad(rand(0,9999),4,'0');
    }
    protected function BeginGamePay($order,$partner,$partnerGame,$user){
        //订单写入成功 ，开启事务，更改订单付款状态，修改成功后充值游戏，
        //游戏充值成功则提交数据库更改并更新partner的相关充值和用户积分数据，否则回滚数据
        //扣钱
        if (!static::$tr){
            static::$tr=Yii::$app->db->beginTransaction();
        }
        if ($order->pay_status!=Order::STATUS_PAY_YES){//订单未扣款先进行扣款
            static::$errMsg .= ">扣款";
            $partner->money -= $order->payables;
            if(!$partner->save()) {
                static::$errMsg .= ">扣款失败";
                return static::rollbackAndReturn(20,$order);
            }else{
                static::$errMsg .= ">扣款成功";
            }//扣款失败

            $order->pay_status=Order::STATUS_PAY_YES;
            $order->status=Order::STATUS_YES;
            $order->really_money=$order->payables;
            $order->pay_time=time();
            if (!$order->save()) {
                self::$errMsg .= "订单更新失败".json_encode($order->getErrors());
                return static::rollbackAndReturn(21,$order);//订单更新失败
            }
            $kk_status=true;
        }else{
            $kk_status=false;
            static::$errMsg .= ">已扣款";
        }

        /**保存成功，充值游戏**/
        static::$errMsg .= ">充值到游戏";
        if (! GameController::GamePay($order) ) {
            self::$errMsg .=">充值失败";
            return static::rollbackAndReturn(22,$order);//游戏充值失败
        }
        self::$errMsg .=">充值成功>交易完成;";

        if ($kk_status)
            $this->afterGamePay($order,$partner,$partnerGame,$user);
        $order->remark .= static::$errMsg;
        $order->remark = mb_substr("$order->remark",-100);
        $order->save();
        static::$tr->commit();

        return 200;
    }

    /**
     * @param $order
     * @param $partner
     * @param $partnerGame \api\models\PartnerGame;
     * @param $user
     */
    protected function afterGamePay($order,$partner,$partnerGame,$user){

        $partner->totalmoney += $order->money;
        $partner->save(false);

        $partnerGame->totalmoney += $order->money;
        $partnerGame->save(false);

        $user->total_money += $order->money;
        $user->save(false);
    }
    public function actionPay(){
        $orderModel=new Order();
        if (Yii::$app->request->isPost){
            $postData=Yii::$app->request->post();
            if (isset($postData['Order']))
                $postData=$postData['Order'];
            $require=['order_sn','money','channel','pay_type','pay_source',];
            foreach ($require as  $value):
                if (empty($postData[$value])){
                    return 1;
                }
                $order[$value] = $postData[$value];
            endforeach;
            unset($postData,$require);
            /**判断付款类型是否支付**/
            $payType=Yii::$app->params['payType'];
            if (!isset($payType[$order['pay_type']])) return 2;
            if ($order['money'] < 1 ) return 3;
            /**订单号是否可以使用**/
            if (strlen($order['order_sn']) > 24  || strlen($order['order_sn']) < 6) return 4;
            $checkOrder=Order::findOne(['order_sn'=>$order['order_sn']]);
            if ($checkOrder) return PayController::_PayApi($checkOrder);

            if (!is_numeric($order['channel'])) {
                $partner=PartnerUser::findOne(['username'=>$order['channel']]);
                if (!$partner) return 6;
                $order['channel']=$partner->id;
            };
            /**载入模型**/

            $orderModel->loadDefaultValues();
            if (!$orderModel->load(['Order'=>$order]))
                return 7;
            $payPatams=$payType[$order['pay_type']];
            $payPatams['apiClass'] :: paytype($orderModel);
            $orderModel->create_time=time();
            $orderModel->payables=$orderModel->money;
            $orderModel->type=Order::TYPE_PAY_BALANCE;//充值到预付费
            $orderModel->gameid=0;
            $orderModel->title='预付费充值';
            $orderModel->sid=0;
            if (!$orderModel->save()):
                return 8;
            endif;
            return PayController::_PayApi($orderModel,$payPatams);

        }else{
            $orderModel->order_sn=$this->actionOrdersn();
            return $this->render('pay',['model'=>$orderModel,'paydata'=>'']);
        }
    }

}