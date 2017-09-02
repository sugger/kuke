<?php

namespace common\models;

/**
 * This is the model class for table "{{%partner_server}}".
 *
 * @property integer $id
 * @property integer $sid
 * @property integer $pserverid
 * @property integer $gid
 * @property integer $status
 * @property integer $pid
 */
class PartnerServer extends \common\core\BaseActiveRecord
{
    const STATUS_ACTIVE = 1;
    const STATUS_DISABLE = 0;
    const STATUS_ONLY_LOGIN = 2;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%partner_server}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sid', 'pserverid', 'gid', 'status', 'pid'], 'required'],
            [['sid', 'pserverid', 'gid', 'status', 'pid'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sid' => 'Sid',
            'pserverid' => 'Pserverid',
            'gid' => 'Gid',
            'status' => 'Status',
            'pid' => 'Pid',
        ];
    }
}