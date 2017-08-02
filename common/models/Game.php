<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/28
 * Time: 10:58
 */

namespace common\models;

/**
 * This is the model class for table "{{%config}}".
 *
|字段|类型|空|默认
|------
|id|int(8)|否|
|game_starttime|datetime()|否|
|sort|int(8)|否|
|name|varchar(55)|否|
|short|char(3)|否|
|gametype|varchar(20)|否|
|gamestyle|smallint(5)|否|
|pic|tinytext|否|
|payto|int(5)|否|
|content|text|否|
|ishot|int(3)|否|0
|game_web|varchar(255)|否|
|game_bbs|varchar(255)|否|
|currency|char(20)|否|
|addtime|int(15)|否|
|game_hit|int(8)|否|1
|game_players|int(11)|否|
|qq|text|否|
|isdisplay|int(2)|否|
|isopen|int(2)|否|
|desc1|varchar(255)|否|
|game_api|varchar(60)|是|NULL
|game_conf|varchar(60)|是|NULL
|remarks|text|否|
|lander|varchar(254)|否|
|is_del|tinyint(2)|否|
 */
class Game extends \common\core\BaseActiveRecord
{
    public static function tableName()
    {
        return "{{%game}}";
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'game_api','payto'], 'required'],
            [[ 'isopen','isdisplay','sort', 'gametype', 'gamestyle', 'payto', 'sort', 'ishot','game_hit','game_players'], 'integer'],
            [['game_starttime','name', 'content','game_web','game_bbs','currency','qq','desc1','game_conf','remarks','lander'], 'string'],
            [['name'], 'string', 'max' => 40],
            [['desc1'], 'string', 'max' => 140],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'game_starttime' => '开始时间',
            'name' => '游戏名称',
            'short' => '简写',
            'sort'=>'排序值',
            'gametype' => '平台类型',
            'gamestyle' => '战斗类型',
            'pic' => '图片',
            'payto' => '充值比例',
            'content' => '游戏简介',
            'ishot' => '推荐状态',
            'game_web' => '游戏官网',
            'game_bbs' => '游戏论坛',
            'currency' => '游戏币单位',
            'addtime' => '添加时间',
            'game_hit' => '点击量',
            'game_players' => '玩家数量',
            'qq' => '客服QQ',
            'isdisplay' => '显示状态',
            'isopen' => '开启状态',
            'desc1' => '描述',
            'game_api' => '接口文件名',
            'game_conf' => '接口配置参数',
            'remarks' => '停服备注',
            'lander' => '微端地址',
            'is_del' => '删除',
        ];
    }
}