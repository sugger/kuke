<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/15
 * Time: 15:23
 */

namespace api\controllers;

use Yii;
use yii\web\Controller;
use api\models\Order;
use api\models\User;
use yii\base\ErrorException;
class PayController extends Controller
{
    /**
     * @param $order_sn
     * @param null $pid
     * @param null $sign
     * @return array
     * 检查订单信息
     */
    public $enableCsrfValidation=false;
    public function actionCheckOrder($order_sn,$pid=null,$sign=null){
        return ['status'=>1];
    }

    /**
     * @param $paytype
     */
    public function actionNotify($paytype){
        $payMap=Yii::$app->params['payType'];
        if (!isset($payMap[$paytype]))
            die('paytype Undefined');
        $paytype=$payMap[$paytype];
        $check=$paytype['apiClass']::callback();

        if ($check['status']){
            /**数据验证成功**/
            $after = $this->BeginPay($check['order']);
            PublicController::Log( '游戏状态:' . ($after?'OK':'NO') ,$check['log'],'payNotify');
            die($after?$check['success']:'fail');
        }else{
            /**数据验证失败**/
            PublicController::Log('验证失败',$check['log'],'payNotify');
            die('fail');
        }
    }
    /**
     * @param $order \api\models\Order
     * @param $really_money
     * @param $successtime
     * 通知验证成功后的操作
     */
    private function BeginPay($order)
    {

        /**先更新付款状态**/
        if ( $order->pay_status != Order::STATUS_PAY_YES) return false;
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
                /**充值平台币**/
                case Order::TYPE_PTB:
                    $user->money += $order->game_money;
                    if (!$user->save(false))
                        throw new ErrorException('平台币充值失败', 3);//订单不存在
                    break;
                /*充值到混服预付费**/
                case Order::TYPE_PAY_BALANCE:

                    break;
                /*充值到游戏**/
                default:
                    if (!self::GamePay($order))
                        throw new ErrorException('游戏充值失败', 4);//订单不存在
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


    /**
     * @param $order \api\models\Order;
     * 游戏充值 入口
     */
    public static function GamePay($order)
    {

        if ($order->pay_status != 1 or $order->pay_time == 0) return false;

        $game = $order->getGame();
        $server = $order->getServer();
        if (!$game || !$server) return false;
        /**调用接口，获取游戏URL*/
        $gameconf = json_decode($game->game_conf, true);
        $info['appid'] = $server->cp_gameid ? $server->cp_gameid : $gameconf['game_id'];
        $info['serverid'] = $server->cp_sid ? $server->cp_sid : $server->serverid;
        $info['url'] = $gameconf['game_payurl'];
        $info['key'] = $gameconf['game_paykey'];
        $info['payto'] = $game->payto;
        $info['gid'] = $order->gameid;
        unset($gameconf);
        $apitag = "api\\models\\game\\" . ucfirst($game->game_api);
        $gameapi = $apitag::GamePay($info, $order);
        $log = "URL:{$gameapi['url']}\tPargam:{$gameapi['pargam']}\tResponse:{$gameapi['response']}\tMsg:{$gameapi['msg']}\r\n";
        PublicController::Log('游戏接口访问日志', $log, $gameapi['status'] ? 'GameApiAssect' : 'GameApiError');
        return $gameapi['status'];
    }

}