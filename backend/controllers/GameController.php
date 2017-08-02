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
        $map=Yii::$app->request->queryParams;
        $dataProvider = $searchModel->search($map);
        /* 导出excel */
        if (isset($params['action']) && $params['action'] == 'export') {
            $this->export($dataProvider->query->all());
            return false;
        }
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionAdd(){

        $model=$this->findModel(0);
        if(Yii::$app->request->isPost){
            /**添加数据**/
            $data=Yii::$app->request->post('Game');
            if ($this->saveRow($model,$data)){
                $this->success('操作成功', $this->getForward());
            }else{
                $this->error('操作错误');
            }
        }

//        ini_set();
        /* 获取模型默认数据 */
        $model->loadDefaultValues();

        return $this->render('edit',[
            'model' => $model,
        ]);
    }
    public function actionEdit(){
        $id = Yii::$app->request->get('id',0);
        $model=$this->findModel($id);
        if(Yii::$app->request->isPost){
            /**添加数据**/
            $data=Yii::$app->request->post('Game');
            if ($this->saveRow($model,$data)){
                $this->success('操作成功', $this->getForward());
            }else{
                $this->error('操作错误');
            }
        }
        /* 获取模型默认数据 */
        $model->loadDefaultValues();
        return $this->render('edit',[
            'model' => $model,
        ]);
    }


    /**
     * ---------------------------------------
     * 删除或批量删除
     * ---------------------------------------
     */
    public function actionDelete(){
        $model = $this->findModel(0);
        if($this->hideRow($model, 'id')){
            $this->success('删除成功', $this->getForward());
        } else {
            $this->error('删除失败！');
        }
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