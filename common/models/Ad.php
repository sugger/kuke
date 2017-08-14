<?php

namespace common\models;

use Yii;
use common\models\AdType;
/**
 * This is the model class for table "{{%ad}}".
 *
 * @property integer $id
 * @property integer $type
 * @property string $title
 * @property string $image
 * @property string $url
 * @property integer $sort
 * @property integer $create_time
 * @property integer $update_time
 * @property integer $status
 */
class Ad extends \common\core\BaseActiveRecord
{
    const ACTIVE_STATUS=1;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ad}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'image'], 'required'],
            [['type', 'sort', 'create_time', 'update_time', 'status'], 'integer'],
            [['title'], 'string', 'max' => 50],
            [['image', 'url'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'title' => 'Title',
            'image' => 'Image',
            'url' => 'Url',
            'sort' => 'Sort',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'status' => 'Status',
        ];
    }
    public static function getAdByTypeid($id){
        return self::find()->alias('a')
            ->where(['a.status'=>self::ACTIVE_STATUS,'b.status'=>AdType::SHOW_STATUS])
            ->rightJoin('yii2_ad_type as b','a.type=b.id')
            ->asArray()
            ->select('a.id,a.title,b.name as type,a.image,a.url')
            ->all();
    }
}
