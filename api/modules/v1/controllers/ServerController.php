<?php

namespace api\modules\v1\controllers;
use api\controllers\BaseController;
use api\models\Article;
use Yii;
use api\models\Server;
class ServerController extends BaseController
{
    public function init()
    {
        $gid=Yii::$app->request->get('gid');
        if (empty($gid)) return $this->response(13001);
        parent::init(); // TODO: Change the autogenerated stub
    }

    public function actionIndex()
    {
        return $this->response(200,['MSG'=>'服务器接口']);
    }
    public function actionTuijian(){
        $gid=Yii::$app->request->get('gid');
        $limit=Yii::$app->request->get('pagesize',5);
        $offset=Yii::$app->request->get('start',0);
        return $data=Server::getList($gid,$limit,$offset,['status'=>Server::TJ_YES ]);
    }
    public function actionList(){
        $gid=Yii::$app->request->get('gid');
        $limit=Yii::$app->request->get('pagesize',5);
        $offset=Yii::$app->request->get('start',0);
        return $data=Server::getList($gid,$limit,$offset);
    }
    public function actionOne(){
        $gid=Yii::$app->request->get('gid');
        $sid=Yii::$app->request->get('sid');
        if (empty($sid)) return $this->response(13002);
        $data=Server::getList($gid,1,0,['sid'=>$sid ]);
        return $this->response($data?200:13003,$data);
    }
}
