<?php
if(!defined('YII2_PATH')) die;
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2017090508568142",

		//商户私钥
		'merchant_private_key' => "ASDSADSA",
		
		//异步通知地址
		'notify_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/notify_url.php",
		
		//同步跳转
		'return_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/return_url.php",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgRbSwL3NQ9BH+vjtuZEvtPAG//ilnvwNbCil5GPMSiy18VrGlm4PvV9AxJmQJsSV+Pny+SsomIjL2cPYaUwc+bHo75gdkp8XMdzYqDOb3lQDEkvSj5Y7vi7yNie0kB+83M2Lq/Mf4+YSCAjw4iZOuUnCM/A+cufimw3vQe137KsC7AKXMgkk202Jthzr0H89ZaC3fBRytNxa1gJ384woF3m04K8YAK6hrh1vazeBmwt+mvtAhK+Ziocb3zvoql8ryes7xojvF8MRWqv1HFrZNyz7LatPJ0m++lYWEGkL2a3e3zU/Gc/hBYYU/rF9dLwiVFTt030voYCaXOuXYR7aVwIDAQAB",
);