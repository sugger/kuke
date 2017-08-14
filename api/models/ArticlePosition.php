<?php

namespace api\models;

use Yii;

/**
 * This is the model class for table "yii2_article_position".
 *
 * @property string $article_id
 * @property string $position_id
 */
class ArticlePosition extends \common\models\ArticlePosition
{
    public static function getArticlesByPosition_id($id){
        return self::find()->alias('a')->
            innerJoin('yii2_article as b','a.article_id=b.id')->
            innerJoin('yii2_article_cat as c','b.category_id=c.id')->
            select('b.id,b.title,b.cover,b.description,b.link,b.create_time as time,c.title as typename')->asArray()->all();
    }
}
