<?php
/**
* 盛付通支付V4.1.1.1.1
*/

class Api extends Think
{

        protected $key='958732mlcl521lin';
        public	$sender = array(  
		'senderId'=>  '353425'//商户号
		);
		public	$service = array(
		'serviceCode'=>'B2CPayment',
		'version'=>  'V4.1.1.1.1',
		);
		public	$header = array(
		'service'=>'',
		'charset'=>  'UTF-8',
		'traceNo'=>'',//网关跟踪号, 保证唯一
		'sender'=>'',
		'sendTime'=>''
		);
		public 	$extension = array(
		'ext1'=>'',
		'ext2'=>''
		);
		public	$signature = array(
			'signType'=>'MD5',//签名方式, (商户根据实际情况自行更改)
			'signMsg'=>''
		);
        public $c_request = array(
								'header'=>"",//商户订单号(商户根据实际情况自行更改), 需保证唯一
								'orderNo'=>"",//订单金额(商户根据实际情况自行更改), 最小单位(元)
								'orderAmount'=>"",//提交订单时间
								'orderTime'=>'',//订单过期时间
								'expireTime'=>'',
								'currency'=>'CNY',
								'payType'=>"",
								'payChannel'=>"",
								'instCode'=>"",
								'cardValue'=>'',
								'language'=>'zh-CN',//页面通知地址(商户根据实际情况自行更改)
								'pageUrl'=>"",//后台通知地址(商户根据实际情况自行更改)
								'notifyUrl'=>"",
								'terminalType'=>'',
								'productId'=>'',
								'productName'=>'',//商品名称 （必须）
								'productNum'=>'',
								'unitPrice'=>'',
								'productDesc'=>'',
								'productUrl'=>'',
								'sellerId'=>'',
								'buyerName'=>"" ,
								'buyerId'=>"",
								'buyerContact'=>"",
								'buyerIp'=>"",
								'payeeId'=>'',
								'depositId'=>'',
								'depositIdType'=>'',
								'payerId'=>'',
								'cardPayInfo'=>'',
								'payerMobileNo'=>'',
								'payerAuthTicket'=>'',
								'extension'=>"",
								'signature'=>"",//以下根据商户自身需求按照文档描述自行添加
							);
        	public 	$f_request= array(//分账请求数据
			        'header'=>'',
			        'paymentOrderNo'=>'',
			        'sharingReqNo'=>'',
			        'notifyURL'=>"",//参考：orderPay包中收单请求notifySFT.php异步通知回调实现
			        'items'=>'',
			        'extension'=>'',
			        'signature'=>'',
			    );
        	public 	$p_request = array(
					'header'=>'',
					'order'=>'',
					'payer'=>'',
					'payee'=>'',
					'payment'=>'',
					'tokenId'=>'',
					'sessionId'=>'',
					'extension'=>'',
					'signature'=>''
				);
     public function __construct()
     {	
     	header("content-type:text/html;charset=utf-8");
		//设置默认时区
		date_default_timezone_set('UTC');
		//设置连接, 读超时时间, 商户根据实际情况自行更改
		ini_set('connection_timeout', 10);
		ini_set('default_socket_timeout', 10);
     	# code...
     }
     public function setsender($value=array())
     {
     	$this->sender['senderId']=$value['id'];
     	$this->key=$value['key'];
     }   
     /**
      * 获取创建订单数据
      * */

    function parse_cRequest($arr=array()) {
        foreach($arr as $key=> $value) {
            $this->c_request[$key] = $value;
        }
        $this->header['service']=$this->service;
        $this->header['sender']=$this->sender;
        $this->header['traceNo']=date('YmdHis') . uniqid();
        $this->header['sendTime']=date('YmdHis');
		$this->c_request['header']=$this->header;
		$this->c_request['signature']=$this->signature;
		//$this->c_request['extension']=$this->extension;
		$this->c_request = array_slice($this->c_request, 0,34);
		$this->c_request['signature']['signMsg'] =strtoupper(md5($this->sign_msg($this->c_request).$this->key));//strtoupper(md5($this->sign_msg($this->c_request).$this->key)) ;
		//echo $this->sign_msg($this->c_request).$this->key ."<br>";
        return $this->c_request;
    }
     /**
      * 获取分账请求数据
      * */
    function parse_fRequest($data,$partner,$really=true) {
		$sharingReqItem=$really?array(//分账规则
			        array(
			            "sharingNo"=>$partner['uid']."_".$data['orderid'],
			            "sharingAmount"=>"0",//金额填写后，比例可不用填写，两者都填时，比例会被忽略
			            "sharingRate"=>$partner['ratio']/100,
			            "payeeId"=>$partner['bank_account'],//分账帐号
			            "payeeIdType"=>$partner['bank_type'],//1: 商户号，2:通行证
			            "payeeName"=>"",//会员名称
			            "isCheckPayeeName"=>""//0或者空:不校验1：校验,会员名称不能为空
			        )
				):array(//分账规则
				        array(
				            "sharingNo"=>$partner['uid']."_".$data['orderid'],
				            "sharingAmount"=>number_format($data['pay_really_money']*($partner['ratio']/100),2) ,//金额填写后，比例可不用填写，两者都填时，比例会被忽略
				            "sharingRate"=>"0",
				            "payeeId"=>$partner['bank_account'],//分账帐号
				            "payeeIdType"=>$partner['bank_type'],//1: 商户号，2:通行证
				            "payeeName"=>"",//会员名称
				            "isCheckPayeeName"=>""//0或者空:不校验1：校验,会员名称不能为空
				        )
				    );
	if ($data['gid']==84) {
		$sharingReqItem=array(//分账规则
				        array(
				            "sharingNo"=>$partner['uid']."_".$data['orderid'],
				            "sharingAmount"=>number_format($data['pay_really_money']*0.7,2) ,//金额填写后，比例可不用填写，两者都填时，比例会被忽略
				            "sharingRate"=>"0",
				            "payeeId"=>$partner['bank_account'],//分账帐号
				            "payeeIdType"=>$partner['bank_type'],//1: 商户号，2:通行证
				            "payeeName"=>"",//会员名称
				            "isCheckPayeeName"=>""//0或者空:不校验1：校验,会员名称不能为空
				        )
				    );
	}
        $this->header['service']= array('serviceCode'=>"SHARING_REQ",'version'=>"4.0");
        $this->header['sender']=$this->sender;
        $this->header['traceNo']=date('YmdHis') . uniqid();
        $this->header['sendTime']=date('YmdHis');
		$this->f_request['header']=$this->header;
		$this->f_request['items']=$sharingReqItem;
		$this->f_request['notifyURL']=$data['notifyURL'];
		$this->f_request['paymentOrderNo']=$data['orderid'];//支付订单号
		$this->f_request['sharingReqNo']='fz_'.$data['orderid'];//分账请求号
		$this->f_request['extension']=$this->extension;
		$this->f_request['signature']=$this->signature;
		$this->f_request['signature']['signMsg'] =strtoupper(md5($this->fsign_msg($this->f_request).$this->key));//strtoupper(md5($this->sign_msg($this->c_request).$this->key)) ;
		//echo $this->sign_msg($this->c_request).$this->key ."<br>";
		
        return $this->f_request;
    }
     /**
      * 获取支付数据
      * */
    function parse_pRequest($arr,$paytype) {
        $this->header['service']=$this->service;
        $this->header['sender']=$this->sender;
        $this->header['traceNo']=date('YmdHis') . uniqid();
        $this->header['sendTime']=date('YmdHis');
		$this->p_request['header']=$this->header;
		$order=array(
			'transNo'=>$arr->transNo,
			//订单金额(商户根据实际情况自行更改), 最小单位(元)
			'orderAmoumt'=> $arr->orderAmount,
			'orderType'=>  $arr->orderType
			);
		$payer = array(
			'ptId'=>'',
			'ptIdType'=>array(),
			'sdId'=>'',
			'memberId'=>'',
			'accountId'=>'',
			'accountType'=>'',
			'payableAmount'=>'',
			'payableFee'=>''
		);
		$payee = array(
			'ptId'=>'',
			'sdId'=>'',
			'memberId'=>'',
			'accountId'=>'',
			'accountType'=>'',
			'receivableAmount'=>'',
			'receivableFee'=>''
		);
		$this->p_request['order']=$order;
		$this->p_request['payer']=$payer;
		$this->p_request['payee']=$payee;
		$this->p_request['payment']=$this->make_payment($paytype);
		$this->p_request['tokenId']=$arr->tokenId;//$arr['tokenId'];
		$this->p_request['sessionId']=$arr->sessionId;//$arr['sessionId'];
		$this->p_request['extension']=$this->extension;
		$this->p_request['signature']=$this->signature;
		$this->p_request['signature']['signMsg'] =strtoupper(md5($this->sign_msg($this->c_request).$this->key)) ;//$this->sign_msg($this->p_request).$this->key;
		//echo $this->sign_msg($this->c_request).$this->key ."<br>";
        return $this->p_request;
    }
   

 
     public function send($arr=array())
     {
     	header("content-type:text/html;charset=utf-8");
		//设置默认时区
		date_default_timezone_set('UTC');
		//设置连接, 读超时时间, 商户根据实际情况自行更改
		ini_set('connection_timeout', 10);
		ini_set('default_socket_timeout', 10);
     	if (isset($arr['items'])) {
     		$type=1;//分账
     	}elseif (isset($arr['tokenId'])) {
     		$type=2;//支付
     	}else{
     		$type=0;//收单、下单
     	}
     	$soapClient=$this->getwsdl($type);
     	switch ($type) {
     		case '0':
     		
     			$return=$soapClient->__soapCall('receiveB2COrder', array(array('arg0'=>$arr)));//收单、下单
     			
     			if (is_object($return)) {
					$responseArray = get_object_vars($return);
					return $responseArray['return'];
					// echo '商户订单号 : ' . $responseArray['return']->orderNo . '</br>';
					// echo '网关支付令牌 : ' . $responseArray['return']->tokenId . '</br>';
					// echo '网关支付标识 : ' . $responseArray['return']->sessionId . '</br>';
					// echo '网关订单号 : ' . $responseArray['return']->transNo . '</br>';
					// echo '网关订单状态 : ' . $responseArray['return']->transStatus . '</br>';
				}
     			break;
     		case '1':
     			$return=$soapClient->__soapCall('sharing', array(array('arg0'=>$arr)),array('location' =>'https://cardpay.shengpay.com/web-acquire-channel/services/sharing'));//分账
     			return $return;
     			break;
     		case '2':
     			$return=$soapClient->__soapCall('processB2CPay', array(array('arg0'=>$arr)));//支付
     				if (is_object($return)) {
						$responseArray = get_object_vars($return);
		                return $responseArray;
		//				echo '网关订单号 : ' . $orderNo. '</br>';
		//				echo '商户订单号 : ' . $transNo . '</br>';
		//				echo '网关订单状态 : ' . $responseArray['return']->transStatus . '</br>';
		//				echo '网关订单支付状态 : ' . $responseArray['return']->paymentStatus . '</br>';
		//				echo '错误返回码 : ' . $responseArray['return']->returnInfo->errorCode . '</br>';
		//				echo '错误描述 : ' . $responseArray['return']->returnInfo->errorMsg . '</br>';
					}
     			break;
     	}
     }



	public function CallBack($postdata, $pay)
	{
			$name = $_POST['Name'];
			$charset = $_POST['Charset'];
			$msgSender = $_POST['MsgSender'];
			$traceNo = $_POST['TraceNo'];
			$version = $_POST['Version'];
			$sendTime = $_POST['SendTime'];
			$orderAmount = $_POST['OrderAmount'];//订单号金额
			$orderNo = $_POST['OrderNo'];//商户订单号
			$instCode = $_POST['InstCode'];
			$paymentNo = $_POST['PaymentNo'];
			$transAmount = $_POST['TransAmount'];//实际支付金额
			$transNo = $_POST['TransNo'];//盛付通卡网关订单号
			$transStatus = $_POST['TransStatus'];//订单状态
			$transTime = $_POST['TransTime'];
			$transType = $_POST['TransType'];
			$payChannel = $_POST['PayChannel'];
			$merchantNo = $_POST['MerchantNo'];
			$payableFee = $_POST['PayableFee'];
			$receivableFee = $_POST['ReceivableFee'];
			$errorCode = $_POST['ErrorCode'];
			$errorMsg = $_POST['ErrorMsg'];
			$ext1 = $_POST['Ext1'];
			$ext2 = $_POST['Ext2'];
			$signType = $_POST['SignType'];
			$signMsg = $_POST['SignMsg'];
			//对于参数进行拼接后进行Md5验签
			$sign = $name.$version.$charset.$traceNo.$msgSender.$sendTime
					.$instCode.$orderNo.$orderAmount.$transNo.$transAmount
					.$transStatus.$transType.$transTime.$merchantNo.$errorCode.$errorMsg.$ext1
					.$ext2.$signType.$this->key;
			if(strtoupper(MD5($sign)) === strtoupper($signMsg)) {
				/**
				商户在此处按照自身需求进行业务处理
				如果签验通知，并且不希望再次收到回调通知, 请输出大写的"OK"
				**/
				return array(
						'orderid'=>$_POST['OrderNo'],
						'pay_real_money'=>$_POST['TransAmount'],
						'status'=>$_POST['TransStatus'],
						'money'=>$_POST['TransAmount']
					);
			}else{
				echo "交易信息被篡改";
            	die();
			}
	}

	public function fCallBack($data=null)
	{		
			if (empty($data)) {
				$data = $_POST['SHARING_RESULT'];
			}
			
			if (!$data) die("error");
			$obj=json_decode($data);
			$serviceCode = $obj->header->service->serviceCode ;
			$version = $obj->header->service->version ;
			$charset = $obj->header->charset ;
			$traceNo = $obj->header->traceNo ;
			$senderId = $obj->header->sender->senderId ;
			$sendTime = $obj->header->sendTime ;
			$paymentOrderNo = $obj->paymentOrderNo ;//订单号金额
			$sharingReqNo = $obj->sharingReqNo ;//商户订单号
			$status = $obj->status ;
			$items=$obj->items[0];
			$sharingNo = $items->sharingNo ;
			$sharingAmount = $items->sharingAmount ;//实际支付金额
			$payeeIdType = $items->payeeIdType ;//盛付通卡网关订单号
			$payeeId = $items->payeeId ;//订单状态
			$items_status = $items->status ;
			$sdSharingNo = $items->sdSharingNo ;//盛付通分账凭证
			$ext1 = $obj->extension->ext1 ;
			$ext2 = $obj->extension->ext2 ;
			$signType = $obj->signature->signType ;
			$errorCode = $obj->returnInfo->errorCode ;
			$errorMsg = $obj->returnInfo->errorMsg ;
			//对于参数进行拼接后进行Md5验签
			$sign = $serviceCode.$version.$charset.$traceNo.$senderId.$sendTime
					.$paymentOrderNo.$sharingReqNo.$status.$sharingNo.$sharingAmount
					.$payeeIdType.$payeeId.$items_status.$sdSharingNo.$ext1.$ext2.$signType
					.$errorCode.$errorMsg.$this->key;
			$signMsg=$obj->signature->signMsg ;

			if(strtoupper(MD5($sign)) == strtoupper($signMsg)) {
				/**
				商户在此处按照自身需求进行业务处理
				如果签验通知，并且不希望再次收到回调通知, 请输出大写的"OK"
				**/
				return array(
						'status'=>$status,//分账状态
						'money'=>$items->sharingAmount,//分账金额
						'sharingReqNo'=>$sharingReqNo,//盛付通交易流水号
						'orderid'=>$obj->paymentOrderNo,//酷客玩订单号
						'my_order'=>''//混服下家订单号
					);
			}else{
				echo "交易信息被篡改";
            	die();
			}
	}

	 private function make_payment($value=array())
    {	
    	$ipItem = array(
			'key'=>'PAYER_IP',
			'value'=>get_client_ip(),
		);
		/* 游戏卡:卡号_密码_面值@@卡号_密码_面值, 多卡用@@分隔
		盛付通卡:卡号_密码@@卡号_密码, 多卡用@@分隔*/
		$cardItem = array(
			'key'=>'CARD_INFO',//'CARD_INFO',
			//'value'=>'2013091100005018_111111_10@@2013091100005019_111111_10',
			'value'=>'',
		);
		$paymentItems = array(
			$ipItem, $cardItem
		);
    	switch ($value['paytype']) {
    		case 'ap'://支付宝
    			$payment = array(
					//支付渠道, (商户根据实际情况自行更改), 具体代码含义详见文档
					'paymentType'=>'PT312',// 
					'instCode'=>'ALZF',
					'payChannel'=>'ap',
					'paymentItems'=>$paymentItems
				);
    			break;
    		case 'wp'://微信
    			$payment = array(
					//支付渠道, (商户根据实际情况自行更改), 具体代码含义详见文档
					'paymentType'=>'PT312',// 
					'instCode'=>'WXZF',
					'payChannel'=>'wp',
					'paymentItems'=>$paymentItems
				);
    			break;
    		default:
    			$payment = array(
					//支付渠道, (商户根据实际情况自行更改), 具体代码含义详见文档
					'paymentType'=>'PT312',// 
					'instCode'=>'WXZF',
					'payChannel'=>'wp',
					'paymentItems'=>$paymentItems
				);
    			break;
    	}
    	return $payment;
    }
	/**
     * 获取未加密的签名字符串
     * arr加密的数据
     * $split 分隔符
     * origin 原始加字符串
     * */
    private function sign_msg($arr=array(),$split='',$origin=''){

    	foreach ($arr as $key => $value) {
    		if (is_string($value)||is_numeric ($value)) {
    			 $origin.=self::isEmpty($value)?"":$value.$split;
    		}elseif (is_array($value)) {
    			$origin = $this->sign_msg($value,$split,$origin);

    		}
    	}
    	return $origin ;
    	
    }
    private function fsign_msg($arr=array(),$split='',$origin=''){

    	$signMessage="";
	    $signMessage.=$arr['header']['service']["serviceCode"];
	    $signMessage.=$arr['header']['service']["version"];
	    $signMessage.=$arr['header']["charset"];
	    $signMessage.=$arr['header']["traceNo"];
	    $signMessage.=$arr['header']['sender']["senderId"];
	    $signMessage.=$arr['header']["sendTime"];
	    $signMessage.=$arr["paymentOrderNo"];
	    $signMessage.=$arr["sharingReqNo"];
	    $signMessage.=$arr["notifyURL"];

	        $item=$arr['items'][0];
	        $signMessage.=$item["sharingNo"];
	        $signMessage.=$item["sharingAmount"];
	        $signMessage.=$item["sharingRate"];
	        $signMessage.=$item["payeeId"];
	        $signMessage.=$item["payeeIdType"];


	    $signMessage.=$arr['extension']["ext1"];
	    $signMessage.=$arr['extension']["ext2"];
	    $signMessage.=$arr['signature']["signType"];
	    return $signMessage;	    
	    //$reqTrans["signature"]["signMsg"]= strtoupper(md5($signMessage));
	    
    	
    }
     private function getwsdl($value='')
     {
		$options = array('trace'=>true,
				        'cache_wsdl'=>WSDL_CACHE_NONE,
				        'soap_version'=> SOAP_1_1);
		$url=array(
				"http://cardpay.shengpay.com/web-acquire-channel/services/receiveOrderService?wsdl",//收单、下单
				//"http://mastest.sdo.com/api-acquire-channel/services/sharing?wsdl",//测试分账
				"https://cardpay.shengpay.com/web-acquire-channel/services/sharing?wsdl",
				"http://cardpay.shengpay.com/web-acquire-channel/services/paymentService?wsdl"//支付

			);
		return new SoapClient($url[$value], $options);

     }
	static function isEmpty($var){
	    if(isset($var)&&$var!=""){
	        return false;
	    }else{
	        return true;
	    }
	}

}
?>