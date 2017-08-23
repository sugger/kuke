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
        $limit = Yii::$app->request->get('limit', 5);
        $offset = Yii::$app->request->get('offset', 0);
        $categoryid = Yii::$app->request->get('categoryid', 0);
        $articles=self::find()->alias('a')->
            innerJoin('yii2_article as b','a.article_id=b.id')->
            innerJoin('yii2_article_cat as c','b.category_id=c.id')->
            leftJoin('yii2_picture as d','b.cover=d.id')->
            select('b.id,b.title,d.path as cover,b.description,b.link,b.create_time as time,c.title as typename')
            ->orderBy('b.create_time desc')->limit($limit)->offset($offset);
        $articles->where(['a.position_id'=>$id]);
        if ($categoryid) $articles->where(['b.category_id'=>$categoryid]);
        return $articles->asArray()->all();

    }
}
