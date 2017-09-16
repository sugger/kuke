<?php

namespace partner\controllers;

use Yii;
use partner\models\PartnerUser;
use partner\models\search\PartnerUserSearch;
use partner\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PartnerController implements the CRUD actions for PartnerUser model.
 */
class PartnerController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all PartnerUser models.
     * @return mixed
     */
    public function actionIndex()
    {
        $this->setForward();
        $searchModel = new PartnerUserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single PartnerUser model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new PartnerUser model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new PartnerUser();
        $model->scenario='create';
        $partnerData=Yii::$app->request->post();
        if ($partnerData['PartnerUser']['passowrd']){
            $partnerData['PartnerUser']['passowrd']=Yii::$app->security->generatePasswordHash($partnerData['PartnerUser']['passowrd']);
        }
        $partnerData['PartnerUser']['register_time']==time();
        if ($model->load($partnerData) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            $model->loadDefaultValues();
            $model->lkey= strtoupper(md5(uniqid())) ;
            $model->pkey=  strtoupper(md5(uniqid()));
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing PartnerUser model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $partnerData=Yii::$app->request->post();
        if ($partnerData['PartnerUser']['passowrd']){
            $partnerData['PartnerUser']['passowrd']=Yii::$app->security->generatePasswordHash($partnerData['PartnerUser']['passowrd']);
        }
        if ($model->load($partnerData) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing PartnerUser model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //$this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the PartnerUser model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return PartnerUser the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = PartnerUser::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    public function actionDisable(){
        return $this->upStatus(0);
    }
    public function actionEnable(){
        return $this->upStatus(1);
    }
    private function upStatus($status){
        $ids = Yii::$app->request->isPost?
            Yii::$app->request->post('id'):
            array_unique((array)explode(',',Yii::$app->request->get('id')));
        foreach ($ids as $k=>$v){
            $ids[$k]=(int)$v;
        }
        if ( empty($ids) ) {
            $this->error('请选择要操作的数据!');
        }
        $ids=implode(',',$ids);
        $_where = 'id in('.$ids.')';

        return  PartnerUser::updateAll(['status'=>$status],$_where)?
            $this->success('更改成功', $this->getForward()):
            $this->error('更改失败！');
    }
}
