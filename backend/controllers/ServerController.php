<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/2
 * Time: 10:42
 */

namespace backend\controllers;
use Yii;
use backend\models\search\ServerSearch;
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
}