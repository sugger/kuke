<?php
return [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'user.passwordResetTokenExpire' => 3600,
    'scoreRate' => 1,//获得1积分所需充值的人民币金额
    /* 上传文件 */
    'upload' => [
        'url'  => Yii::getAlias('/image/'),
        //'path' => Yii::getAlias('@base/web/storage/image/'), // 服务器解析到/web/目录时，上传到这里
        'path' => Yii::getAlias('@backend/web/image/'),
    ],
    'payType'=>[
        'alipay'=>['id'=>'alipay','apiClass'=>'\api\models\pay\Wftali','name'=>'支付宝扫码','rate'=>100,'type'=>'webApi'],
        'wxpay'=>['id'=>'wxpay','apiClass'=>'\api\models\pay\Wftwx','name'=>'微信扫码','rate'=>100,'type'=>'webApi'],
        //'wxpay'=>['id'=>'wxpay','apiClass'=>'\api\models\pay\Wftali','name'=>'微信扫码','rate'=>100,'type'=>'javaScript'],
        //'bank'=>['id'=>'bank','apiClass'=>'\api\models\pay\Alipay','name'=>'网银支付','rate'=>100,'type'=>'webServer'],
    ]
];
