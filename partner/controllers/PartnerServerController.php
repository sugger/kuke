<?php

namespace partner\controllers;

use partner\models\Game;
use partner\models\PartnerUser;
use Yii;
use partner\models\PartnerServer;
use partner\models\search\PartnerServerSearch;
use partner\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PartnerServerController implements the CRUD actions for PartnerServer model.
 */
class PartnerServerController extends BaseController
{
    public $child=[
        [
            'name'=>'游戏管理',
            'icon'=>'icon-speech',
            '_child'=>[
                ['title'=>'我的游戏','url'=>'partner-game/index','group','游戏管理|icon-speech'],
                ['title'=>'所有游戏(未开启)','url'=>'#','group','任务列表|icon-speech'],
            ]
        ],
        [
            'name'=>'区服管理',
            'icon'=>'icon-speech',
            '_child'=>[
                ['title'=>'我的区服','url'=>'partner-server/index','group','区服管理|icon-speech'],
                ['title'=>'所有区服(未开启)','url'=>'#','group','任务列表|icon-speech'],
            ]
        ],
    ];
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
        $model=$this->findModel($id);
        if (!$model||$model->pid!=Yii::$app->user->getIdentity()->getId())
            return $this->redirect(['index']);
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
        if (!$partner || $partner->status==PartnerUser::STATUS_DISABLE )
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
        return $this->redirect(['view', 'id' => $id]);
        $model = $this->findModel($id);
        if (!$model || $model->pid!=Yii::$app->user->getIdentity()->getId())
            return $this->redirect(['index']);
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
        return $this->redirect(['index']);
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
