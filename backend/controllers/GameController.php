<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/28
 * Time: 10:33
 */

namespace backend\controllers;
use Yii;
use backend\models\Game;
use backend\models\search\GameSearch;
use yii\web\NotFoundHttpException;
class GameController extends BaseController
{
    public function actionIndex()
    {

        /* 添加当前位置到cookie供后续跳转调用 */
        $this->setForward();

        $searchModel = new GameSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionAdd(){
        $model=$this->findModel(0);
        if(Yii::$app->request->isPost){
            /**添加数据**/
        }
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
        /* 获取模型默认数据 */
        $model->loadDefaultValues();
//var_dump(\backend\models\ArticleCat::find()->asArray()->all());die;
        $this->render('edit',[
            'model' => $model,
        ]);
    }

    /**
     * Finds the Article model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Game the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if ($id == 0) {
            return new Game();
        }
        if (($model = Game::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}