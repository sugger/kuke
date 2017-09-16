<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/25
 * Time: 11:41
 */

namespace partner\controllers;
use partner\models\PartnerUser;
use Yii;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;

class IndexController extends BaseController
{

    public $child=[
        [
            'name'=>'文档',
            'icon'=>'icon-speech',
            '_child'=>[
                ['title'=>'对接文档','url'=>'index/index','group','文档|icon-speech'],
                ['title'=>'其他文档文档','url'=>'index/index','group','文档|icon-speech'],
            ]
        ],
        [
            'name'=>'游戏素材',
            'icon'=>'icon-speech',
            '_child'=>[
                ['title'=>'游戏素材','url'=>'index/index','group','素材下载|icon-speech'],
            ]
        ],
    ];


    public function actionIndex(){
        return $this->render('index' );
    }
    public function actionMyinfo(){
        return $this->render('view', ['model' => Yii::$app->user->getIdentity()] );
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if (Yii::$app->request->isPost){
            $partnerData=Yii::$app->request->post();
            $field=['email','bankaccount','realname','number_id','lkey','pkey','pay_tag','tel','qq','test_account','ip','api','callback','notify'];
            foreach ($partnerData['PartnerUser'] as $k=>$value){
                if (!in_array($k,$field))
                    unset($partnerData['PartnerUser'][$k]);
            }
            if ($model->load($partnerData) && $model->save()) {
                return $this->redirect(['myinfo', 'id' => $model->id]);
            }
        }
        return $this->render('update', [
                'model' => $model,
            ]);

    }

    protected function findModel($id)
    {
        return PartnerUser::findOne(Yii::$app->user->getIdentity()->getId());
    }
}