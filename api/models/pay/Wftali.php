<?php
namespace api\models\pay;
use api\models\Order;

/**
 * 支付接口调测例子
 * ================================================================
 * index 进入口，方法中转
 * submitOrderInfo 提交订单信息
 * queryOrder 查询订单
 * 
 * ================================================================
 */
Class Wftali{
    //$url = 'http://192.168.1.185:9000/pay/gateway';

    private static $resHandler = null;
    private static $reqHandler = null;
    private static $pay = null;
    private static $cfg = null;
    const BASE_DIR = __DIR__ . '/wftpay';
    const SOURCE  = ['SYT'=>'官方收银台', 'WFTWX'=>'API二维码'];
    public static function paytype($order){
        $order->pay_source='WFTWX';
        return true;
    }
    /**
     * @param null $order \api\models\Order;
     * return from表单 json数据 javascript代码
     */
    public static function Pay($order=null)
    {
        $submitData=[
            'method'=>'submitOrderInfo',
            'out_trade_no'=>$order->order_sn,
            'body'=>$order->title,
            'attach'=>$order->title,
            'total_fee'=>intval($order->payables*100),
            'mch_create_ip'=>$order->ip,
        ];
        static::Request();
        return static::submitOrderInfo($submitData);
    }
    public static function init(){
        require self::BASE_DIR . '/Utils.class.php';
        require self::BASE_DIR . '/config/config.php';
        require self::BASE_DIR . '/class/RequestHandler.class.php';
        require self::BASE_DIR . '/class/ClientResponseHandler.class.php';
        require self::BASE_DIR . '/class/PayHttpClient.class.php';
    }
    public function create_order($arr){
        $_POST=array(
                'method'=>'submitOrderInfo',
                'out_trade_no'=>$arr['orderid'],
                'body'=>$arr['product_name'],
                'attach'=>$arr['product_name'],
                'total_fee'=>intval($arr['pay_money']*100),
                'mch_create_ip'=>$arr['pay_ip'],
            );
        $data=static::submitOrderInfo($arr);
        $return=array(
            'Code'=>$data['code_img_url']?1:'-30',
            'code_img_url'=>$data['code_img_url'],
            'code_url'=>$data['code_url'],
        );
        exit(json_encode($return));
    }
    public function BeginPay($arr){
        $_POST=array(
                'method'=>'submitOrderInfo',
                'out_trade_no'=>$arr['orderid'],
                'body'=>$arr['product_name'],
                'attach'=>$arr['product_name'],
                'total_fee'=>intval($arr['pay_money']*100),
                'mch_create_ip'=>$arr['pay_ip'],
            );

        exit( exit(json_encode(static::submitOrderInfo($arr))) );
    }
    public static function Request(){
        static::init();
        static::$resHandler = new \ClientResponseHandler();
        static::$reqHandler = new \RequestHandler();
        static::$pay = new \PayHttpClient();
        static::$cfg = new \Config();
        static::$reqHandler->setGateUrl(static::$cfg->C('url'));
        static::$reqHandler->setKey(static::$cfg->C('key'));
    }
    
    /**
     * 提交订单信息
     */
    public static function submitOrderInfo($submitData){
        static::$reqHandler->setReqParams($submitData,array('method'));
        static::$reqHandler->setParameter('service','pay.alipay.native');//接口类型
        static::$reqHandler->setParameter('mch_id',static::$cfg->C('mchId'));//必填项，商户号，由平台分配
        static::$reqHandler->setParameter('notify_url','http://' . $_SERVER['HTTP_HOST'] . '/Pay/notify/paytype/Wftali');
        // static::$reqHandler->setParameter('notify_url',static::$cfg->C('notify_url'));
        static::$reqHandler->setParameter('version',static::$cfg->C('version'));
        static::$reqHandler->setParameter('nonce_str',mt_rand(time(),time()+rand()));//随机字符串，必填项，不长于 32 位
        static::$reqHandler->createSign();//创建签名
        
        $data = \Utils::toXml(static::$reqHandler->getAllParameters());
        //var_dump($data);
        
        static::$pay->setReqContent(static::$reqHandler->getGateURL(),$data);
        if(static::$pay->call()){
            static::$resHandler->setContent(static::$pay->getResContent());
            static::$resHandler->setKey(static::$reqHandler->getKey());
            if(static::$resHandler->isTenpaySign()){
                //当返回状态与业务结果都为0时才返回支付二维码，其它结果请查看接口文档
                if(static::$resHandler->getParameter('status') == 0 && static::$resHandler->getParameter('result_code') == 0){
                    return [
                        'status'=>200,
                        'code_img_url'=>static::$resHandler->getParameter('code_img_url'),
                        'code_url'=>static::$resHandler->getParameter('code_url')
                    ];
                }else{
                    return array('status'=>500,'msg'=>'Error Code:'.static::$resHandler->getParameter('err_code').' Error Message:'.static::$resHandler->getParameter('err_msg'));
                }
            }
            return array('status'=>500,'msg'=>'Error Code:'.static::$resHandler->getParameter('status').' Error Message:'.static::$resHandler->getParameter('message'));
        }else{
            return array('status'=>500,'msg'=>'Response Code:'.static::$pay->getResponseCode().' Error Info:'.static::$pay->getErrInfo());
        }
    }

    /**
     * 查询订单
     */
    public static function queryOrder(){
        static::$reqHandler->setReqParams($_POST,array('method'));
        $reqParam = static::$reqHandler->getAllParameters();
        if(empty($reqParam['transaction_id']) && empty($reqParam['out_trade_no'])){
            echo json_encode(array('status'=>500,
                                   'msg'=>'请输入商户订单号或平台订单号!'));
            exit();
        }
        static::$reqHandler->setParameter('version',static::$cfg->C('version'));
        static::$reqHandler->setParameter('service','unified.trade.query');//接口类型
        static::$reqHandler->setParameter('mch_id',static::$cfg->C('mchId'));//必填项，商户号，由平台分配
        static::$reqHandler->setParameter('nonce_str',mt_rand(time(),time()+rand()));//随机字符串，必填项，不长于 32 位
        static::$reqHandler->createSign();//创建签名
        $data = \Utils::toXml(static::$reqHandler->getAllParameters());

        static::$pay->setReqContent(static::$reqHandler->getGateURL(),$data);
        if(static::$pay->call()){
            static::$resHandler->setContent(static::$pay->getResContent());
            static::$resHandler->setKey(static::$reqHandler->getKey());
            if(static::$resHandler->isTenpaySign()){
                $res = static::$resHandler->getAllParameters();
                \Utils::dataRecodes('查询订单',$res);
                //支付成功会输出更多参数，详情请查看文档中的7.1.4返回结果
                echo json_encode(array('status'=>200,'msg'=>'查询结果请查看result.txt文件！','data'=>$res));

                exit();
            }
            echo json_encode(array('status'=>500,'msg'=>'Error Code:'.static::$resHandler->getParameter('status').' Error Message:'.static::$resHandler->getParameter('message')));
        }else{
            echo json_encode(array('status'=>500,'msg'=>'Response Code:'.static::$pay->getResponseCode().' Error Info:'.static::$pay->getErrInfo()));
        }
    }
    
    /**
     * 提交退款
     */
    public static  function submitRefund(){
        static::$reqHandler->setReqParams($_POST,array('method'));
        $reqParam = static::$reqHandler->getAllParameters();
        if(empty($reqParam['transaction_id']) && empty($reqParam['out_trade_no'])){
            echo json_encode(array('status'=>500,
                                   'msg'=>'请输入商户订单号或平台订单号!'));
            exit();
        }
        static::$reqHandler->setParameter('version',static::$cfg->C('version'));
        static::$reqHandler->setParameter('service','unified.trade.refund');//接口类型
        static::$reqHandler->setParameter('mch_id',static::$cfg->C('mchId'));//必填项，商户号，由平台分配
        static::$reqHandler->setParameter('nonce_str',mt_rand(time(),time()+rand()));//随机字符串，必填项，不长于 32 位
        static::$reqHandler->setParameter('op_user_id',static::$cfg->C('mchId'));//必填项，操作员帐号,默认为商户号

        static::$reqHandler->createSign();//创建签名
        $data = Utils::toXml(static::$reqHandler->getAllParameters());//将提交参数转为xml，目前接口参数也只支持XML方式

        static::$pay->setReqContent(static::$reqHandler->getGateURL(),$data);
        if(static::$pay->call()){
            static::$resHandler->setContent(static::$pay->getResContent());
            static::$resHandler->setKey(static::$reqHandler->getKey());
            if(static::$resHandler->isTenpaySign()){
                //当返回状态与业务结果都为0时才返回，其它结果请查看接口文档
                if(static::$resHandler->getParameter('status') == 0 && static::$resHandler->getParameter('result_code') == 0){
                    /*$res = array('transaction_id'=>static::$resHandler->getParameter('transaction_id'),
                                 'out_trade_no'=>static::$resHandler->getParameter('out_trade_no'),
                                 'out_refund_no'=>static::$resHandler->getParameter('out_refund_no'),
                                 'refund_id'=>static::$resHandler->getParameter('refund_id'),
                                 'refund_channel'=>static::$resHandler->getParameter('refund_channel'),
                                 'refund_fee'=>static::$resHandler->getParameter('refund_fee'),
                                 'coupon_refund_fee'=>static::$resHandler->getParameter('coupon_refund_fee'));*/
                    $res = static::$resHandler->getAllParameters();
                    Utils::dataRecodes('提交退款',$res);
                    echo json_encode(array('status'=>200,'msg'=>'提交退款成功,请查看result.txt文件！','data'=>$res));
                    exit();
                }else{
                    echo json_encode(array('status'=>500,'msg'=>'Error Code:'.static::$resHandler->getParameter('err_code').' Error Message:'.static::$resHandler->getParameter('err_msg')));
                    exit();
                }
            }
            echo json_encode(array('status'=>500,'msg'=>'Error Code:'.static::$resHandler->getParameter('status').' Error Message:'.static::$resHandler->getParameter('message')));
        }else{
            echo json_encode(array('status'=>500,'msg'=>'Response Code:'.static::$pay->getResponseCode().' Error Info:'.static::$pay->getErrInfo()));
        }
    }



    /**
     * 异步通知回调方法
     */
    public static  function callback(){
        static::init();
        $xml = file_get_contents('php://input');
        $return['status']=false;
        $return['log']=['xml'=>$xml];
        //$res = Utils::parseXML($xml);
        static::$resHandler->setContent($xml);
        //var_dump(static::$resHandler->setContent($xml));
        static::$resHandler->setKey(static::$cfg->C('key'));
        if(static::$resHandler->isTenpaySign()){
            if(static::$resHandler->getParameter('status') == 0 && static::$resHandler->getParameter('result_code') == 0) {
                $return['order'] = Order::findOne(['order_sn' => static::$resHandler->getParameter('out_trade_no')]);
                if (empty($return['order'])) {//验证订单是否存在
                    $return['log']['error'] = '订单号不存在' . static::$resHandler->getParameter('out_trade_no');
                    return $return;
                }
                /**验证顶订单应付款项和实际款项是否一直**/
                $total_fee = static::$resHandler->getParameter('total_fee')  / 100;
                if ($total_fee != $return['order']->payables) {
                    //不一致
                    $return['log']['error'] = '订单号' . static::$resHandler->getParameter('out_trade_no') . '实际付款' . $total_fee . '应付款' . $return['order']->payables;
                    return $return;
                }
                /*支付完成时间，格式为yyyyMMddhhmmss，如2009年12月27日9点10分10秒表示为20091227091010。时区为GMT+8 beijing。该时间取自平台服务器*/
                $success_time=static::$resHandler->getParameter('time_end');

                $return['order']->pay_time = time();//todo 修改时间
                $return['order']->pay_sn = static::$resHandler->getParameter('transaction_id') ;
                $return['order']->really_money = $total_fee;
                $return['order']->pay_status = Order::STATUS_PAY_YES;
                $return['order']->save();
                $return['success']='success';
                $return['status']=true;
                return $return;
                //echo static::$resHandler->getParameter('status');
                //此处可以在添加相关处理业务，校验通知参数中的商户订单号out_trade_no和金额total_fee是否和商户业务系统的单号和金额是否一致，一致后方可更新数据库表中的记录。

                //echo static::$resHandler->getParameter('status');
                // 11;
                //校验单号和金额是否一致，更改订单状态等业务处理

            }else{
                die('未完成付款');
            }
        }else{
            die('交易被篡改');
        }
    }


}

