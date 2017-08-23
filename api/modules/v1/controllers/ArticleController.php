<?php

namespace api\modules\v1\controllers;

use api\controllers\BaseController;
use api\models\Article;
use api\models\ArticlePosition;
use Yii;

class ArticleController extends BaseController/*\yii\web\Controller*/
{
//    public function behaviors()
//    {
//        $behaviors = parent::behaviors();
//        /* 设置认证方式 */
//        $behaviors['authenticator'] = [
//            'class' => \yii\filters\auth\QueryParamAuth::className(),
//        ];
//        return $behaviors;
//    }

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
        return $this->response(200,$articles);
    }
    public function actionWebarticle(){
        $id=Yii::$app->request->get('id',0);
        if (!$id) return $this->response(102001);
        $articles=ArticlePosition::getArticlesByPosition_id($id);
        return $this->response(200,$articles);
    }
    public function actionRead(){
        $id=Yii::$app->request->get('id',0);
        if (!$id) return $this->response(102002);
        $article=Article::findOne(['id'=>$id,'status'=>Article::ACTIVE_STATUS]);
        if (empty($article)) return $this->response(102003);
        return $this->response(200,[
            'id'=>$article->id,
            'title'=>$article->title,
            'typename'=>$article->articletype,
            'tag'=>$article->name,
            'cover'=>PublicController::getImg($article->name),
            'description'=>$article->description,
            'content'=>$article->content,
            'view'=>$article->view,
            'create_time'=>$article->create_time,
        ]);
    }


}
