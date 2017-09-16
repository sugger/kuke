<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-partner',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'partner\controllers',
    'bootstrap' => ['log'],
    'modules' => [],
    /* 默认路由 */
    'defaultRoute' => 'index',
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-partner',
        ],
        'user' => [
            'identityClass' => 'partner\models\PartnerUser',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-partner', 'httpOnly' => true],
            'loginUrl' => ['public/login']
        ],
        'session' => [
            // this is the name of the session cookie used for login on the partner
            'name' => 'advanced-partner',
        ],
        /* 数据库RBAC权限控制 */
        'authManager' => [
            'class' => 'common\core\rbac\DbManager',
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
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],

        /**
         * 这里要注意了，由于我使用的是模板自带的jQuery和bootstrap，所以这里就先清空系统的jQuery和bootstrap
         * 基本上所有的插件都是使用了yii\web\JqueryAsset，
         * 为了模板全局的js/css放在其他插件的前面，这里我设置了yii\web\JqueryAsset依赖backend\assets\AppAsset
         */
        'assetManager'=>[
            'bundles'=>[
                'yii\web\JqueryAsset' => [
                    'sourcePath' => null,
                    'js' => [],
                    'depends' => [
                        'backend\assets\AppAsset'
                    ]
                ],
                'yii\bootstrap\BootstrapAsset' => [
                    'css' => []
                ],
            ],

        ],
    ],
    /**
     * 该属性允许你用一个数组定义多个 别名 代替 Yii::setAlias()
     */
    'aliases' => [],
    /**
     * 通过配置文件附加行为，全局
     */
    'as rbac' => [
        'class' => 'backend\behaviors\RbacBehavior',
        'allowActions' => [
            'login/login','login/logout','public*','debug/*','gii/*', // 不需要权限检测
        ]
    ],
    'params' => $params,
];
