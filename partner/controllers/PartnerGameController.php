<?php

namespace partner\controllers;

use partner\models\Game;
use partner\models\PartnerUser;
use Yii;
use partner\models\PartnerGame;
use partner\models\search\PartnerGameSearch;
use partner\controllers\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * PartnerGameController implements the CRUD actions for PartnerGame model.
 */
class PartnerGameController extends BaseController
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
     * Lists all PartnerGame models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PartnerGameSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single PartnerGame model.
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
     * Creates a new PartnerGame model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($pid)
    {
        $partner=PartnerUser::findOne($pid);
        return $this->error('没有权限','index');
//        $model = new PartnerGame();
//        $data=Yii::$app->request->post();
//        $data['PartnerGame']['partnerid']=$partner->id;
//        if (Yii::$app->request->isPost && $model->load($data) && $model->save()) {
//            return $this->redirect(['view', 'id' => $model->id]);
//        } else {
//            $model->loadDefaultValues();
//            return $this->render('create', [
//                'model' => $model,
//                'partner'=> $partner,
//
//
//            ]);
//        }
    }

    /**
     * Updates an existing PartnerGame model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {

        $model = $this->findModel($id);
        $partner=PartnerUser::findOne($model->partnerid);
        if (!$partner) return $this->error('混服合作者不存在','index');
        $game=Game::findOne($model->gid);
        $post=Yii::$app->request->post();
        if($model->auto_server==PartnerGame::AUTO_STOP_NEW_SERVER)
            unset($post['PartnerGame']['auto_server']);
        if ($model->status ==PartnerGame::STATUS_LOGIN)
            unset($post['PartnerGame']['status']);
        if ($model->load($post) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'partner' =>$partner,
                'game'=>$game
            ]);
        }
    }

    /**
     * Deletes an existing PartnerGame model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
//        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the PartnerGame model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return PartnerGame the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = PartnerGame::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
