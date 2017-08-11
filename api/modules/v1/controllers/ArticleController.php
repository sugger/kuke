<?php

namespace api\modules\v1\controllers;

use api\controllers\BaseController;
use api\models\Article;
use Yii;

class ArticleController extends BaseController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        /* 设置认证方式 */
        $behaviors['authenticator'] = [
            'class' => \yii\filters\auth\QueryParamAuth::className(),
        ];
        return $behaviors;
    }

    /**
     * @return array
     */
    public function actionIndex()
    {
        $where['status'] = Article::SHOW_STATUS;
        $catid = Yii::$app->request->get('cat', 0);
        if ($catid) $where['category_id'] = $catid;
        $limit = intval(Yii::$app->request->get('limit', 10));
        $offset = intval(Yii::$app->request->get('offset', 0));
        $articles = Article::find()->where($where)->offset($offset)->limit($limit)
            ->select(['id', 'name as tag', 'cover', 'title', 'description', 'link', 'create_time'])
            ->all();
//        $article=$articles[0];
//        $article->picpath;
//        $article->articletype;
//        return ['success'];
    }

}
