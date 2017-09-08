<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/5
 * Time: 13:02
 */

namespace api\models\pay;

use common\core\PayInterface;
use Yii;
define('AOP_SDK_WORK_DIR',Yii::$aliases['@runtime'].'/Alipay');
class Alipay implements PayInterface
{
    const BASE_DIR = __DIR__ . '/alipay';
    const SOURCE  = [
        'SYT'=>'官方收银台',
        'SMAPI'=>'API二维码'
    ];
    /**
     * 获取类型名称
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function paytype($order){
        $order->pay_source='SYT';
        return true;
    }
    /**
     * 获取类型名称
     * @param $order \api\models\Order;
     * @return mixed
     */
    public static function _init(){
        require_once self::BASE_DIR.'/pagepay/service/AlipayTradeService.php';
        require_once self::BASE_DIR.'/pagepay/buildermodel/AlipayTradePagePayContentBuilder.php';
    }
    public static function Pay($order=null)
    {
        require_once self::BASE_DIR . '/config.php';
        static::_init();
        //构造参数
        $payRequestBuilder = static::_model('AlipayTradePagePayContentBuilder');
        $payRequestBuilder->setBody($order->title);
        $payRequestBuilder->setSubject($order->title);
        $payRequestBuilder->setTotalAmount($order->payables);
        $payRequestBuilder->setOutTradeNo($order->order_sn);

        /**
         * pagePay 电脑网站支付请求
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @param $return_url 同步跳转地址，公网可以访问
         * @param $notify_url 异步通知地址，公网可以访问
         * @return $response 支付宝返回的信息
         */
        $return_url=$notify_url='http://www.kukewan.com';
        $response = self::Aop()->pagePay($payRequestBuilder,$return_url,$notify_url);
        //输出表单
        var_dump($response);
    }

    public static function Query($order)
    {
        //商户订单号，商户网站订单系统中唯一订单号
        $out_trade_no = $order->order_sn;
        //支付宝交易号
        $trade_no = $order->pay_sn ;
        require_once self::BASE_DIR . '/config.php';
        static::_init();
        //请二选一设置
        //构造参数
        $RequestBuilder = self::_model('AlipayTradeQueryContentBuilder');
        if ($out_trade_no){
            $RequestBuilder->setOutTradeNo($out_trade_no);
        }else{
            $RequestBuilder->setTradeNo($trade_no);
        }

        /**
         * alipay.trade.query (统一收单线下交易查询)
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @return $response 支付宝返回的信息
         */
        $response = self::Aop()->Query($RequestBuilder);
        var_dump($response);
        // TODO: Implement Query() method.
    }

    public static function Refund($order)
    {
        //商户订单号，商户网站订单系统中唯一订单号
        $out_trade_no = '';

        //支付宝交易号
        $trade_no = '';
        //请二选一设置

        //需要退款的金额，该金额不能大于订单金额，必填
        $refund_amount = '';

        //退款的原因说明
        $refund_reason = '';

        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        $out_request_no = '';

        //构造参数
        $RequestBuilder=self::_model('AlipayTradeRefundContentBuilder');
        $RequestBuilder->setOutTradeNo($out_trade_no);
        $RequestBuilder->setTradeNo($trade_no);
        $RequestBuilder->setRefundAmount($refund_amount);
        $RequestBuilder->setOutRequestNo($out_request_no);
        $RequestBuilder->setRefundReason($refund_reason);



        /**
         * alipay.trade.refund (统一收单交易退款接口)
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @return $response 支付宝返回的信息
         */
        $response = self::Aop()->Refund($RequestBuilder);
        var_dump($response);;
        // TODO: Implement Refund() method.
    }

    public static function Close($order)
    {
        //商户订单号，商户网站订单系统中唯一订单号
        $out_trade_no = trim($_POST['WIDTCout_trade_no']);

        //支付宝交易号
        $trade_no = trim($_POST['WIDTCtrade_no']);
        //请二选一设置

        //构造参数
        $RequestBuilder=self::_model('AlipayTradeCloseContentBuilder');
        $RequestBuilder->setOutTradeNo($out_trade_no);
        $RequestBuilder->setTradeNo($trade_no);

        /**
         * alipay.trade.close (统一收单交易关闭接口)
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @return $response 支付宝返回的信息
         */
        $response = self::Aop()->Close($RequestBuilder);
        var_dump($response);
        // TODO: Implement Close() method.
    }

    public static function refundQuery($order)
    {
        //商户订单号，商户网站订单系统中唯一订单号
        $out_trade_no = '';

        //支付宝交易号
        $trade_no = '';
        //请二选一设置

        //请求退款接口时，传入的退款请求号，如果在退款请求时未传入，则该值为创建交易时的外部交易号，必填
        $out_request_no = '';

        //构造参数
        $RequestBuilder=self::_model('AlipayTradeFastpayRefundQueryContentBuilder');
        $RequestBuilder->setOutTradeNo($out_trade_no);
        $RequestBuilder->setTradeNo($trade_no);
        $RequestBuilder->setOutRequestNo($out_request_no);
        /**
         * 退款查询   alipay.trade.fastpay.refund.query (统一收单交易退款查询)
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @return $response 支付宝返回的信息
         */
        $response =  self::Aop()->refundQuery($RequestBuilder);
        var_dump($response);
        // TODO: Implement refundQuery() method.
    }

    public static function check($arr)
    {
        $alipaySevice = self::Aop();
        $alipaySevice->writeLog(var_export($arr,true));
        $result = $alipaySevice->check($arr);
        if ($result && $_POST['trade_status'] == 'TRADE_SUCCESS' ){
            //商户订单号

            $out_trade_no = $_POST['out_trade_no'];

            //支付宝交易号

            $trade_no = $_POST['trade_no'];
            //收款金额

            $total_fee = $_POST['total_fee'];

            return [
                'order_sn'=>$out_trade_no,
                'pay_sn'=>$trade_no,
                'really_money'=>$total_fee
            ];
        }

        // TODO: Implement check() method.
    }
    public static function _model($model){
        require_once self::BASE_DIR . "/buildermodel/{$model}.php";
        return new $model();
    }
    public static function Aop(){
        require_once self::BASE_DIR . '/config.php';
        return new AlipayTradeService($config);
    }
}