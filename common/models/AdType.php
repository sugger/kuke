<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%ad_type}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $createtime
 * @property string $status
 */
class AdType extends \common\core\BaseActiveRecord
{
    const SHOW_STATUS="1";
    const HIDE_STATUS="0";
    const DEL_STATUS="2";
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ad_type}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'createtime', 'status'], 'required'],
            [['createtime'], 'integer'],
            [['status'], 'string'],
            [['name'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'createtime' => 'Createtime',
            'status' => 'Status',
        ];
    }

}
