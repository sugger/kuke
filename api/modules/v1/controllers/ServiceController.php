<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:20
 */

namespace api\modules\v1\controllers;
use Yii;
use api\controllers\BaseController;

class ServiceController extends BaseController
{
    public function actionIndex(){
        $gid=Yii::$app->request->get('gid');

        return $this->response(200,['kufu'=>static::kefu($gid),'friendlink'=>static::friendlink($gid)]);

    }
    public function actionKefu(){
        $gid=Yii::$app->request->get('gid');
        return $this->response(200,static::kefu($gid));
    }
    public static function kefu($gid){
        return [["qq"=>'2639824849','nickname'=>'可儿'],["qq"=>'2171209489','nickname'=>'沫沫']];
    }
    public function actionFriendlink(){
        $gid=Yii::$app->request->get('gid');
        return $this->response(200,static::friendlink($gid));
    }
    public static function friendlink($gid){
        return [
            ["link"=>'http://baidu.com','title'=>'百度一下', 'params'=>['_target'=>'_blank','description'=>"BaiduSearch"]],
            ["link"=>'http://baidu.com','title'=>'百度两下', 'params'=>['_target'=>'_blank','description'=>"BaiduSearch"]],
            ["link"=>'http://baidu.com','title'=>'百度三下', 'params'=>['_target'=>'_blank','description'=>"BaiduSearch"]],
        ];
    }
}