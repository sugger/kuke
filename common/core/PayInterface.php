<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/15
 * Time: 10:50
 */

namespace common\core;


interface PayInterface
{
    /**
     * 付款
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function Pay($order);
    /**
     * 查询
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function Query($order);
    /**
     * 退款
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function Refund($order);
    /**
     * 关闭
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function Close($order);
    /**
     * 退款查询
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function refundQuery($order);
    /**
     * 支付宝返回的信息验签
     * @return mixed
     */
    public static function check($arr);

}