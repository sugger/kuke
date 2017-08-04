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
    'bootstrap' => ['log'],
    'controllerNamespace' => 'api\controllers',
    'components' => [
        'request' => [
            'class' => 'common\core\Request',
//            'parsers' => [//启用 JSON 输入
//                'application/json' => 'yii\web\JsonParser',
//            ]
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-api', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the frontend
            'name' => 'advanced-api',
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

//        'urlManager' => [
////            'enablePrettyUrl' => env('API_PRETTY_URL', true),
//            'showScriptName' => false,
//            'enableStrictParsing' => false, // 是否启用严格解析，只有在rules中存在的才解析，开启容易出错
//            'rules' => [
//                [
//                    'class' => 'yii\rest\UrlRule',
//                    'controller' => ['index','v1/user','v2/index'],
//                    'pluralize' => false, //是否启用复数形式，注意index的复数indices，我认为开启后不直观
//                ]
//
//            ],
//        ],
    ],
    'params' => $params,
];
