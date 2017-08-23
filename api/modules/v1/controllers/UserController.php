<?php

namespace api\modules\v1\controllers;

use api\controllers\BaseController;
use api\models\GameLogin;
use api\models\User;
use Yii;


/**
 * 这里注意是继承 yii\rest\ActiveController 因为源码中已经帮我们实现了index/update等方法
 * 以及其访问规则verbs()等，
 * 其他可参考：http://www.yiichina.com/doc/guide/2.0/rest-controllers
 *
 * 权限采用最简单的QueryParamAuth方式
 * 用户角色权限比较复杂，这里没有做
 *
 * @package api\modules\v1\controllers
 */
class UserController extends BaseController
{
//    public function behaviors()
//    {
//        $behaviors = parent::behaviors();
//        /* 设置认证方式 */
//        $behaviors['authenticator'] = [
//            'class' => QueryParamAuth::className(),
//        ];
//        return $behaviors;
//    }

    public function actionIndex()
    {
        return static::response(200, ['MSG' => '用户接口']);
    }

    /*
     * 提交重置密码
     * @param $type phone | email
     * @param $code
     * @return array
     */
    public function actionResetpass()
    {
        $user = Yii::$app->user->getIdentity();
        return static::response(200, $user);
    }
    /*
    * token获取重置密码的用户基本信息及提交密码时所需的token
    * @param $type phone | email
    * @param $code
    * @return array
    */
    public function actionCheckresettoken(){

    }
    /**
     * 获取用户信息
     * @return array
     */
    public static function Info()
    {
        $user = Yii::$app->user->getIdentity();
        return static::response(200, $user);
    }

    /**
     * 防沉迷
     * @return array
     */
    public static function Fcm()
    {
        $user = Yii::$app->user->getIdentity();
        return static::response(200, $user);
    }

    /**
     * 获取游戏登录记录
     */
    public static function Gamehistory()
    {
        $gid = Yii::$app->request->get('gid');
        $limit = Yii::$app->request->get('num', 5);
        $offset = Yii::$app->request->get('offset', 0);
        $where['userid'] = Yii::$app->user->getIdentity()->id;
        if ($gid) $where['gameid'] = $gid;
        $log = GameLogin::find()->andFilterWhere($where)->limit($limit)->offset($offset)->all();
        $log = array_map(function ($data) {
            return [
                'id' => $data->id,
                'userid' => $data->userid,
                'gameid' => $data->gameid,
                'gamename' => $data->game['name'],
                'serverid' => $data->server['sid'],
                'servername' => $data->server['servername'],
                'logintime' => $data->login_time,
                'regtime' => $data->reg_time,
                'ip' => long2ip($data->ip),
            ];

        }, $log);
        return static::response(0, $log);
    }

    /**
     * @_GET[offset]
     * @_GET[limit]
     * @return array
     */
    public static function Myorder()
    {
        $uid = Yii::$app->user->identity->getId();
        $user = User::findOne($uid);
        $orders = $user->order;
        $data=[];
        while ($order = current($orders)) {
            $data[] = [
                'order_id' => $order->order_id,
                'order_sn' => $order->order_sn,
                'money' => $order->money,
                'really_money' => $order->really_money,
                'gamename' => $order->game['name'],
                'servername' => $order->server['servername'],
                'type' => $order->type,
                'create_time' => $order->create_time,
                'pay_time' => $order->pay_time,
                'pay_type' => $order->pay_type,
                'pay_source' => $order->pay_source,
                'pay_status' => $order->pay_status,
                'status' => $order->status,
            ];
            next($orders);
        }
        return static::response(200, $data);
    }



}
