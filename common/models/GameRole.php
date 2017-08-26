<?php

namespace common\models;

/**
 * This is the model class for table "{{%game_role}}".
 *
 * @property integer $id
 * @property integer $uid
 * @property integer $sid
 * @property integer $gid
 * @property string $role
 * @property integer $level
 * @property string $create_time
 * @property string $up_time
 * @property string $extend
 * @property string $from_social
 */
class GameRole extends \common\core\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%game_role}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uid', 'sid', 'gid', 'role', 'level', 'create_time', 'extend', 'from_social'], 'required'],
            [['uid', 'sid', 'gid', 'level'], 'integer'],
            [['create_time', 'up_time'], 'safe'],
            [['extend'], 'string'],
            [['role'], 'string', 'max' => 50],
            [['roleid'], 'string', 'max' => 64],
            [['from_social'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => 'Uid',
            'sid' => 'Sid',
            'gid' => 'Gid',
            'role' => 'Role',
            'level' => 'Level',
            'roleid' => 'Roleid',
            'create_time' => 'Create Time',
            'up_time' => 'Up Time',
            'extend' => 'Extend',
            'from_social' => 'From Social',
        ];
    }
}
