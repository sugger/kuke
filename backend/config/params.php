<?php
return [
    'adminEmail' => 'admin@example.com',

    /* 后台中的配置参数 */
    'web' => [],
    /* 超级管理员的UID */
    'admin' => 1,

    /* 后台错误页面模板 */
    'action_error'     =>  '@backend/views/public/error.php', // 默认错误跳转对应的模板文件
    'action_success'   =>  '@backend/views/public/success.php', // 默认成功跳转对应的模板文件
    /* UEditor编辑器配置 */
    'ueditorConfig' => [
        /* 图片上传配置 */
        'imageRoot'            => Yii::getAlias("@backend/web/image/"), //图片path前缀
        //'imageRoot'            => Yii::getAlias("@base/web/storage"), //图片path前缀，服务器解析到/web/目录时，上传到这里
        'imageUrlPrefix'       => '/image/', //图片url前缀
        'imagePathFormat'      => '/image/{yyyy}{mm}/editor{time}{rand:6}',

        /* 文件上传配置 */
        'fileRoot'             => Yii::getAlias("@backend/web"), //文件path前缀
        //'fileRoot'             => Yii::getAlias("@base/web/storage"), //文件path前缀，服务器解析到/web/目录时，上传到这里
        'fileUrlPrefix'        => '', //文件url前缀
        'filePathFormat'       => '/file/{yyyy}{mm}/editor{rand:4}_{filename}',

        /* 上传视频配置 */
        'videoRoot'            => Yii::getAlias("@backend/web"),
        //'videoRoot'            => Yii::getAlias("@base/web/storage"), // 服务器解析到/web/目录时，上传到这里
        "videoUrlPrefix"       => '',
        'videoPathFormat'      => '/video/{yyyy}{mm}/editor{time}{rand:6}',

        /* 涂鸦图片上传配置项 */
        'scrawlRoot'           => Yii::getAlias("@backend/web"),
        //'scrawlRoot'           => Yii::getAlias("@base/web/storage"), // 服务器解析到/web/目录时，上传到这里
        "scrawlUrlPrefix"      => '',
        'scrawlPathFormat'     => '/image/{yyyy}{mm}/editor{time}{rand:6}',
    ],

    /* 后台系统配置 类型 和 分组 */
    'config_type'  => [
        0 => '数字',
        1 => '字符',
        2 => '文本',
        3 => '数组',
        4 => '枚举',
    ],
    'config_group' => [
        0 => '不分组',
        1 => '基本',
        2 => '内容',
        3 => '用户',
        4 => '系统',
    ],
    'config_gametype' => [
        0 => 'PC页游',
        1 => '手游APP',
        2 => 'H5游戏',
        3 => 'PC端游',
    ],
];
