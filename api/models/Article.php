<?php

namespace api\models;


class Article extends \common\models\Article
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_article';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['category_id', 'content'], 'required'],
            [['category_id', 'cover', 'up', 'down', 'view', 'sort', 'create_time', 'update_time', 'status'], 'integer'],
            [['content', 'extend'], 'string'],
            [['name'], 'string', 'max' => 40],
            [['title'], 'string', 'max' => 80],
            [['description'], 'string', 'max' => 140],
            [['link'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => 'Category ID',
            'name' => 'Name',
            'title' => 'Title',
            'cover' => 'Cover',
            'description' => 'Description',
            'content' => 'Content',
            'extend' => 'Extend',
            'link' => 'Link',
            'up' => 'Up',
            'down' => 'Down',
            'view' => 'View',
            'sort' => 'Sort',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'status' => 'Status',
        ];
    }

    public function getPicpath()
    {
        $pic = Picture::find()->where(['id' => $this->cover])->select(['path'])->asArray()->one();
//            ->createCommand()->getRawSql();
        return $pic['path'];
    }

    public function getArticletype()
    {
        $art = $this->hasOne(\common\models\ArticleCat::className(), ['id' => 'category_id']);
        var_dump($art);
    }
}
