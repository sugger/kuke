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
];
