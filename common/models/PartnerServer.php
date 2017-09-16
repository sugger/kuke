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
            [['ctime'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sid' => '本站区服',
            'pserverid' => '混服ID号',
            'gid' => '游戏',
            'status' => '状态',
            'pid' => '所属混服',
            'ctime'=>'创建时间'
        ];
    }
}
