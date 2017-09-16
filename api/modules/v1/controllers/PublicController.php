<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/4
 * Time: 17:36
 * Code:1000-1100
 */

namespace api\modules\v1\controllers;

use api\controllers\BaseController;

use api\models\User;

use common\models\Ad;
use Yii;

class PublicController extends BaseController
{
    public static function Log($desc, $content, $rprefix = '')
    {
        $path = Yii::$aliases['@runtime'] . "/apilog/" . date('ymd') . $rprefix . '.txt';
        if (is_array($content)) {
            $content = json_encode($content);
        }
        $content = rtrim($content);
        file_put_contents($path, $desc . "\t" . date('Y-m-d H:i:s') . "\t" . $content . "\r\n", FILE_APPEND);
    }





    public function actionBanner(){
        $id=Yii::$app->request->get('cateid');
        if (!$id) $this->response(11008);
        $banner=Ad::getAdByTypeid($id);
        return $this->response(200,array_map(function ($data){
            $data['image']=static::getImg($data['image']);
            return $data;
        },$banner));
    }

    /**
     * @return array
     * todo 没有加暴力破解
     */
    public function actionLogin()
    {
        $username = Yii::$app->request->post('u');
        if (!$username) return $this->response(11001);//用户名不能为空
        $password = Yii::$app->request->post('p');
        if (!$password) return $this->response(11002);//密码不能为空
        $user = User::findByUsername($username);
        if (empty($user)) return $this->response(11003);//用户名不存在
        if (!$user->validatePassword($password)) return $this->response(11004);//密码错误
        $key = $user->resetAuthKey();
        $user->last_login_time = (string)time();
        $user->last_login_ip = (string)ip2long(Yii::$app->request->getUserIP());
        return $user->save(false) ?
            $this->response(200, ['access-token' => $key]) :
            $this->response(11005);
    }

    /**
     * todo Token获取方式
     */
    public function actionLogout()
    {
        $token = Yii::$app->request->param('access-token');
        $user = User::findIdentityByAccessToken($token);
        if ($user)
            $user->removeAuthKey()->save();
        return $this->response(200);
    }

    public function actionInfo()
    {
        return $this->response(200, Yii::$app->user->isGuest);
    }





}