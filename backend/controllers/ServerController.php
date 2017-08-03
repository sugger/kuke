<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/2
 * Time: 10:42
 */

namespace backend\controllers;
use backend\models\Server;
use phpDocumentor\Reflection\Types\This;
use Yii;
use backend\models\search\ServerSearch;
use yii\web\NotFoundHttpException;
class ServerController extends BaseController
{
    public function actionIndex(){
        $this->setForward();
        $request= Yii::$app->request->queryParams;
        $searchModel= new ServerSearch();
        $dataProvider=$searchModel->search($request);
        /* 导出excel */
        if (isset($params['action']) && $params['action'] == 'export') {
            $this->export($dataProvider->query->all());
            return false;
        }
        return $this->render('index',[
            'searchModel'=>$searchModel,
            'dataProvider'=>$dataProvider
            ]);
    }
    public function actionAdd(){

        $model=$this->findModel(0);
        $model->loadDefaultValues();
        if (Yii::$app->request->isPost){
            $model->scenario='savedata';
            $pargam=Yii::$app->request->post();
            if ( $model->load($pargam)&& $model->save() ){
                $this->success('添加成功',$this->getForward());
            }
        }
        return $this->render('edit',['model'=>$model]);
    }
    public function actionEdit(){
        $id=Yii::$app->request->get('id',0);
        $model=$this->findModel($id);
        $model->start_time_date=date('Y-m-d H:i:s',$model->start_time?$model->start_time:time());
        $model->loadDefaultValues();
        if (Yii::$app->request->isPost){
            $model->scenario='savedata';
            $pargam=Yii::$app->request->post();
            if ( $model->load($pargam)&& $model->save() ){
                $this->success('添加成功',$this->getForward());
            }
        }
        return $this->render('edit',['model'=>$model]);
    }
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
     * @return Server the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if ($id == 0) {
            return new Server();
        }
        if (($model = Server::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}