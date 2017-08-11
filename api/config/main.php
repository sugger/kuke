<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-api',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log', 'v1'],

    'layout' => false,
    'controllerNamespace' => 'api\controllers',
    'modules' => [
        'v1' => [
            'class' => 'api\modules\v1\Modules',
            'defaultRoute' => 'Public/login'
//            'basePath'=>'@api/modules/v1'
        ],
    ],
    'components' => [
        'request' => [
            'class' => 'common\core\Request',
//            'parsers' => [//启用 JSON 输入
//                'application/json' => 'yii\web\JsonParser',
//            ]
        ],
        'user' => [
            'class' => 'yii\web\User',
            'identityClass' => 'api\models\User',
            'enableAutoLogin' => true,
            'enableSession' => false, //关闭session
            'loginUrl' => null, //登录跳转地址为空
            'identityCookie' => ['name' => '_identity-api', 'httpOnly' => true],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        'urlManager' => [
            'enablePrettyUrl' => true,//env('API_PRETTY_URL', true),
            'showScriptName' => false,
            'enableStrictParsing' => false, // 是否启用严格解析，只有在rules中存在的才解析，开启容易出错
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['v1/user', 'v1/article', 'v1/public', 'v1/game', 'v1/pay', 'v1/order'],
//                    'pluralize' => false, //是否启用复数形式，注意index的复数indices，我认为开启后不直观
                ]

            ],
        ],
    ],
    'params' => $params,
];
