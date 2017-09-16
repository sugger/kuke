<?php
class Config{
    private $cfg = array(
        'url'=>'https://pay.swiftpass.cn/pay/gateway',	//支付请求url，无需更改
        'mchId'=>'103510075449',		//测试商户号，商户正式上线时需更改为自己的
        'key'=>'82354b0ad22674c2e2d86feec0702649',   //测试密钥，商户需更改为自己的
		'notify_url'=>' ',//测试通知url，此处默认为空格商户需更改为自己的，保证能被外网访问到（否则支付成功后收不到威富通服务器所发通知）
		
        'version'=>'2.0'		//版本号
       );
    
    public function C($cfgName){
        return $this->cfg[$cfgName];
    }
}
?>