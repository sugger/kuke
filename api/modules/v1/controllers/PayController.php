<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:18
 */

namespace api\modules\v1\controllers;
use api\controllers\BaseController;
use Yii;
use yii\web\HttpException;

class PayController extends  BaseController
{
    static $message=[
        200 => 'OK',
    ];
    /**
     * 统一下单地址
     */
    public function actionUnifiedorder(){
        try{
            if (! Yii::$app->request->isPost) throw new HttpException(200);

        }catch (HttpException $e){
            return ['Status'=>$e->statusCode,'Message'=>self::$message[$e->statusCode]];
        }


    }

}