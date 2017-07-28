<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/28
 * Time: 17:01
 */

namespace common\models;

/**
 * This is the model class for table "{{%config}}".
 *
 * @property string $id
 * @property integer $list
 * @property string $name

 */
class GameType extends \common\core\BaseActiveRecord
{
    public static function tableName()
    {
        return '{{%game_type}}';
    }
}