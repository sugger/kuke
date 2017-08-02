<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/1
 * Time: 17:06
 */

namespace common\models;

/**
 * Class Server 区服模型
 * @package common\models
|字段|类型|空|默认
|**id**|int(11)|否|
|gid|smallint(6)|否|
|servername|varchar(50)|否|
|player_num|int(7)|否|
|start_time|int(13)|否|
|add_time|int(13)|否|
|up_time|int(13)|否|
|stop_notice|varchar(255)|否|
|is_display|tinyint(2)|否|
|status|tinyint(2)|否|
|content|varchar(255)|否|''
|server_img|int(11)|否|0
|isstop|tinyint(2)|否|
|sid|varchar(10)|否|
|cp_gameid|varchar(10)|否|
|cp_sid|int(11)|否|
 */
class Server extends \common\core\BaseActiveRecord
{
    public static function tableName()
    {
        return "{{%server}}";
    }
    public function rules()
    {
        return [
            [['id','gid','player_num', 'start_time', 'add_time', 'up_time', 'is_display', 'status','server_img','isstop'], 'integer'],
            [['servername','stop_notice', 'content','sid','cp_gameid','	cp_sid'], 'safe'],
            [['servername'], 'string', 'max' => 50],
            [['gid','sid'], 'unique'],
        ];
    }
    public function attributeLabels()
    {
        return [
            'id'=>'编号',
            'gid'=>'所属游戏',
            'servername'=>'名称',
            'player_num'=>'玩家数量',
            'start_time'=>'开服时间',
            'add_time'=>'添加时间',
            'up_time'=>'更新时间',
            'stop_notice'=>'停服通知',
            'is_display'=>'显示状态',
            'status'=>'推荐状态',
            'content'=>'简介',
            'server_img'=>'图片ID',
            'isstop'=>'是否停服',
            'sid'=>'本站区服',
            'cp_gameid'=>'cp游戏ID',
            'cp_sid'=>'cp区服ID',
            'is_del'=>'删除',
        ];
    }
}