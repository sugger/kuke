<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/25
 * Time: 13:30
 */

namespace partner\controllers;
use \Yii;
use partner\models\LoginForm;
use yii\helpers\ArrayHelper;
use common\models\Region;
use kartik\depdrop\DepDropAction;
use yii\helpers\Url;
use common\core\Controller;
class PublicController extends Controller
{
    public $layout = false;

    public $enableCsrfValidation=false;

    public $defaultAction = 'login';
    /**
     * ---------------------------------------
     * @inheritdoc
     * ---------------------------------------
     */
    public function actions()
    {
        return ArrayHelper::merge(parent::actions(), [
            /* 省市区联动 */
            'region' => [
                'class' => DepDropAction::className(),
                'outputCallback' => function ($id, $params) {
                    $region = Region::find()->where(['parent_code'=>$id])->orderBy('code ASC')->asArray()->all();
                    $_out = [];//var_dump($region);
                    foreach ($region as $value) {
                        $_tmp['id']   = $value['code'];
                        $_tmp['name'] = $value['fullname'];
                        $_out[] = $_tmp;
                    }
                    return $_out;
                },
                'selectedCallback' => function($id, $params){
                    return Yii::$app->getRequest()->get('sid');
                }
            ],
            /* ueditor文件上传 */
            'ueditor' => [
                'class' => 'common\actions\UEditorAction',
                'config' => Yii::$app->params['ueditorConfig'],
            ],
            /* 单图、多图上传 */
            'uploadimage' => [
                'class' => 'common\widgets\images\UploadAction',
            ],
            /* migration备份数据 */
            'backup' => [
                'class' => 'e282486518\migration\WebAction',
                'returnFormat' => 'json',
                'migrationPath' => '@console/migrations'
            ]
        ]);
    }

    /**
     * ---------------------------------------
     * 通用的404错误处理
     * @return string
     * ---------------------------------------
     */
    public function action404(){

        //渲染模板
        return $this->render('404');
    }

    public function actionLogin(){
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome(); // 默认 index/index
        }

        $model = new LoginForm();
        if (Yii::$app->request->isPost) {
            $model->load(Yii::$app->request->post(),'info') ;
            if ($model->load(Yii::$app->request->post(),'info') && $model->login()) {
                return 1;
            } else {
                return 0;
            }
        }else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }
    /**
     * ---------------------------------------
     * 注销页
     * ---------------------------------------
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->redirect(Url::toRoute('public/login'));
    }

}