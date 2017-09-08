<?php

namespace backend\controllers;

use backend\models\Game;
use backend\models\PartnerUser;
use Yii;
use backend\models\PartnerServer;
use backend\models\search\PartnerServerSearch;
use backend\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PartnerServerController implements the CRUD actions for PartnerServer model.
 */
class PartnerServerController extends BaseController
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
     * Lists all PartnerServer models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PartnerServerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single PartnerServer model.
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
     * Creates a new PartnerServer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($pid,$gid)
    {
        $partner=PartnerUser::findOne($pid);
        if (!$partner || $partner->status==PartnerUser::STATUS_DISABLE)
            return $this->error('账户异常');
        $game=Game::findOne($gid);
        if (!$game)
            return $this->error('添加的游戏不存在');

        $model = new PartnerServer();
        $data=Yii::$app->request->post();
        $data['PartnerServer']['gid']=$gid;
        $data['PartnerServer']['pid']=$pid;
        if (Yii::$app->request->isPost && $model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            $model->loadDefaultValues();
            return $this->render('create', [
                'model' => $model,
                'partner' => $partner,
                'game' => $game,
            ]);
        }
    }

    /**
     * Updates an existing PartnerServer model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $partner=PartnerUser::findOne($model->pid);
        $game=Game::findOne($model->gid);

        if (Yii::$app->request->isPost && $model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'partner' => $partner,
                'game' => $game,
            ]);
        }
    }

    /**
     * Deletes an existing PartnerServer model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the PartnerServer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return PartnerServer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = PartnerServer::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
