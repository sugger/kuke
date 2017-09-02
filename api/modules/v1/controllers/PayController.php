<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:18
 */

namespace api\modules\v1\controllers;

use api\models\Order;
use api\models\User;
use Yii;
use yii\base\ErrorException;
use yii\web\Controller;
use yii\web\HttpException;

class PayController extends Controller
{
    static $message=[
        200 => 'OK',
    ];
    /**
     * 统一下单地址
     */
    public function actionUnifiedorder(){
        try{

            if (! Yii::$app->request->isPost) throw new HttpException(200);

        }catch (HttpException $e){
            return ['Status'=>$e->statusCode,'Message'=>self::$message[$e->statusCode]];
        }


    }

    /**
     * 对外付款接口
     */
    public function actionPay(){

    }

    /**
     * 通知接口
     */
    public function actionNotify($type)
    {
        //todo 验证通知真实性
        //todo 为真记录日志

        $orderid = '135555111';
        $really_money = '9.8';
        $successtime = time();
        $order = Order::findOne(['order_sn' => $orderid]);
        $order->pay_time = $successtime;
        $order->pay_status = Order::STATUS_PAY_YES;
        $after = $this->BeginPay($order, $really_money, $successtime);
        var_dump($after);
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


    /**
     * 付款日志
     */
    protected function PayLog(){

    }

    /**
     * @param $order object
     * @param $classname object
     */

    protected function GamePay( $order , $classname){

    }

}