<?php


class shengpay{

	private $payHost;
	private $debug=false;
	private $key='958732mlcl521lin';
    private $myid = '353425';
	private $params=array(
		'Name'=>'B2CPayment',
		'Version'=>'V4.1.1.1.1',
		'Charset'=>'UTF-8',
		'MsgSender'=>'353425',
		'SendTime'=>'',
		'OrderNo'=>'',
		'OrderAmount'=>'',
		'OrderTime'=>'',
		'PayType'=>'',
        'PayChannel'=> '',
		'InstCode'=>'',
		'PageUrl'=>'',
		'BackUrl'=>'',
		'NotifyUrl'=>'',
        'SharingInfo' =>'',
        'SharingNotifyUrl' =>'',
		'ProductName'=>'',
		'BuyerContact'=>'',
		'BuyerIp'=>'',
		'Ext1'=>'',
		'Ext2'=>'',
		'SignType'=>'MD5',
		'SignMsg'=>'',
	);
    
    private $query_params = array(
        'ServiceCode'=>'QUERY_ORDER_REQUEST',
        'Version'=>'V4.3.1.1.1',
        'Charset'=>'UTF-8',
        'SenderId'=>'353425',
        'SendTime'=>'',
        'MerchantNo'=>'353425',
        'OrderNo'=>'',
        'TransNo'=>'',
        'Ext1'=>'',
        'SignType'=>'MD5',
        'SignMsg'=>'',
    );
    
    private $card_params = array(
        'Name'=>'B2CPayment',
        'Version'=>'V4.1.1.1.1',
        'Charset'=>'UTF-8',
        'TraceNo'=>'',
        'MsgSender'=>'353425',
        'SendTime'=>'',
        'OrderNo'=>'',
        'OrderAmount'=>'',
        'OrderTime'=>'',
        //'ExpireTime'=>'',
        //'Currency'=>'CNY',
        'PayType'=>'',
        'PayChannel'=>'',
        'InstCode'=>'',
        //'CardValue'=>'',
        //'Language'=>'zh-CN',
        'PageUrl'=>'',
        'BackUrl'=>'',//
        'NotifyUrl'=>'',
        
        'SharingInfo' =>'',
        'SharingNotifyUrl' =>'',
        //'ProductId'=>'',
        'ProductName'=>'',
        //'ProductNum'=>'',
        //'UnitPrice'=>'',
        //'ProductDesc'=>'',
        //'ProductUrl'=>'',
        //'SellerId'=>'',
        //'BuyerName'=>'',
        //'BuyerId'=>'',
        'BuyerContact'=>'',
        'BuyerIp'=>'',
        //'PayeeId'=>'',
        //'DepositId'=>'',
        //'DepositIdType'=>'',
        //'PayerId'=>'',
        'Ext1'=>'',
        'SignType'=>'MD5',
        //'Ext2'=>'',
        'SignMsg'=>'',
    );
    
    function curlPost( $url, $paramAry, $second=10 )
    {
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_TIMEOUT,$second);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($paramAry));
        curl_setopt($ch,CURLOPT_POST, 1);
        curl_setopt($ch,CURLOPT_HEADER, 0);
        $data = curl_exec($ch);
        $reStr = curl_errno($ch);
        curl_close($ch);
        if($reStr!=0)
        {
        	return false;
        }
        else
        {
        	return $data;
        }
    }
    
    
    function parseData($arr=array()) {
        foreach($arr as $key=> $value) {
            $this->params[$key] = $value;
        }
        
        $this->params['SignMsg'] = $this->sign_msg($this->params);
        // dump($this->params);
        // die;
        return $this->params;
    }
    
    function parse_query_data($arr=array()){
        foreach($arr as $key=> $value) {
            $this->query_params[$key] = $value;
        }
        $this->query_params['SignMsg'] = $this->sign_msg($this->query_params);
        return $this->query_params;
    }
    
    function parse_card_data($arr=array()) {
        foreach($arr as $key=> $value) {
            $this->card_params[$key] = $value;
        }
        $this->card_params['SignMsg'] = $this->sign_msg($this->card_params);
        return $this->card_params;
    }
    
    function query_order($order_id) {
        $data['SendTime'] = date('YmdHis');
        $data['OrderNo'] = $order_id;
        $params = $this->parse_query_data($data);
        $ret = $this->curlPost('http://mas.sdo.com/api-acquire-channel/services/queryOrderService?wsdl', $params);
        header('Content-Type: text/xml');
        echo($ret);die();
        
    }
    
    function sign_msg($arr=array()) {
		$origin='';
		foreach($arr as $key=>$value){
			if(!empty($value))
				$origin.=$value;
		}
        // echo($origin.$this->key);
		$SignMsg=strtoupper(md5($origin.$this->key));
        return $SignMsg;
    }
    
	function returnSign($postdata=array()){
		$params=array(
			'Name'=>'',
			'Version'=>'',
			'Charset'=>'',
			'TraceNo'=>'',
			'MsgSender'=>'',
			'SendTime'=>'',
			'InstCode'=>'',
			'OrderNo'=>'',
			'OrderAmount'=>'',
			'TransNo'=>'',
			'TransAmount'=>'',
			'TransStatus'=>'',
			'TransType'=>'',
			'TransTime'=>'',
			'MerchantNo'=>'',
			'ErrorCode'=>'',
			'ErrorMsg'=>'',
			'Ext1'=>'',
			'Ext2'=>'',
			'SignType'=>'MD5',
		);
		foreach($postdata as $key=>$value){
			if(isset($params[$key])){
				$params[$key]=$value;
			}
		}
		$TransStatus=(int)$postdata['TransStatus'];
		$SignMsg= $this->sign_msg($params);
		if($SignMsg==$postdata['SignMsg'] and $TransStatus==1){
			return true;
		}else{
			return false;
		}
	}
}


?>
