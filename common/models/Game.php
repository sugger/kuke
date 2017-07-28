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
|game_starttime|int(15)|否|
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
}