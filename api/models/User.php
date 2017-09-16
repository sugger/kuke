<?php

namespace api\models;

use Yii;
use yii\filters\RateLimitInterface;
use yii\web\IdentityInterface;

/**
 * 实现User组件中的身份识别类 参见 yii\web\user
 * This is the model class for table "{{%user}}".

SELECT
a.uid,a.username,'' as `password`,'' as `salt` ,a.`email`, a.phone as mobile, a.id_card as idcard , a.plat_coin as `money`,a.total_money,a.point as score,a.point as score_all,
b.register_time as reg_time ,INET_ATON(b.register_ip) as reg_ip,
b.lastlogin_time as last_login_time,INET_ATON(b.lastlogin_ip) as last_login_ip,b.lastlogin_time as update_time,
b.gid as reg_gameid,b.sid as reg_serverid,b.sub_channels as tuid ,'kukewan' as from_social ,1 as status
FROM `mygame_member` as a JOIN `mygame_member_extend_info` as b ON a.uid=b.uid WHERE b.grouping=0

 */

class User extends \common\models\User implements IdentityInterface, RateLimitInterface
{


    public static function findByUserPhone($mobile)
    {
        return static::findOne(['mobile' => $mobile, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * 根据UID获取账号信息
     */
    public static function findIdentity($uid)
    {
        $user= static::findOne(['uid' => $uid, 'status' => self::STATUS_ACTIVE]);
        if (empty($user)){
            $user=static::getNotexit(['uid' => $uid]);
            $new=new User();
            $new->load(['User'=>$user]);
            $new->save(false);
            $user=$new->findOne($user['uid']);
        }
        return $user;
    }

    public static function getNotexit($where)
    {
        $where['table'] = 'member';
        $time = time();
        $apiurl = "http://mix.kukewan.com/newsiteapi/getdata&t={$time}&ccc=" . md5($time . 'newsite');
        $data_string = json_encode($where);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $apiurl);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data_string))
        );
        $content = curl_exec($ch);
        curl_close($ch);
        $return = json_decode($content, true);
        if ($return['status'] != 1) return false;

        //获取拓展信息
        unset($where);
        $where['table'] = 'member_extend_info';
        $where['uid'] = $return['data']['uid'];
        $time = time();
        $apiurl = "http://mix.kukewan.com/newsiteapi/getdata&t={$time}&ccc=" . md5($time . 'newsite');
        $data_string = json_encode($where);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $apiurl);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data_string))
        );
        $content = curl_exec($ch);
        curl_close($ch);
        $return1 = json_decode($content, true);
        if ($return['status'] != 1) return false;


        return [
            'uid' => $return['data']['uid'],
            'username' => $return['data']['username'],
            'password' => 'noKnow',
            'nickname' => $return['data']['nickname'],
            'salt' => 'noKnow',
            'email' => $return['data']['email'],
            'mobile' => 'noKnow',
            'idcard' => $return['data']['id_card'],
            'money' => '0',
            'total_money' => $return['data']['total_money'],
            'from_social' => 'kukewan',
            'reg_time' => $return1['data']['register_time'],
            'reg_ip' => ip2long($return1['data']['register_ip']),
            'last_login_time' => $return1['data']['lastlogin_time'],
            'last_login_ip' => ip2long($return1['data']['lastlogin_ip']),
            'update_time' => date('Y-m-d H:i:s'),
            'tuid' => $return1['data']['sub_channels'],
            'image' => $return['data']['avatar'] ? 'http://www.kukewan.com/' . $return['data']['avatar'] : '',
            'score' => (int)$return['data']['point'],
            'score_all' => (int)$return['data']['total_money'],
            'reg_gameid' => 0,
            'reg_serverid' => 0,
            'status' => 1,
        ];
    }

    /**
     * ---------------------------------------
     * 由token获取用户信息
     * @param mixed $token
     * @param null $type
     * @return null|static
     * ---------------------------------------
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        /* 这里为了简便将数据库token字段设置成username */
        /* 使用 /api/v1/user?access-token=e282486518 即可访问 */
        return static::findOne(['salt' => $token, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * 根据用户名获取账号信息
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username, $extend = [])
    {
        $user=static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
        if (empty($user)){
            $user=static::getNotexit(['username' => $username]);
            if ($user) {
                if ($extend) {
                    foreach ($extend as $k => $v) {
                        $user[$k] = $v;
                    }
                }
                $new = new User();
                $new->load(['User' => $user]);
                $new->save(false);

                $user = $new->findOne($user['uid']);
            }
        }
        return $user;
    }

    public function fields()
    {
        $fields = parent::fields();
        unset($fields['password'], $fields['salt']);
        return $fields;
    }

    /**
     * ---------------------------------------
     * 获取主键
     * @return mixed
     * ---------------------------------------
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * ---------------------------------------
     * 验证
     * @param string $authKey
     * @return bool
     * ---------------------------------------
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * ---------------------------------------
     * 获取密码干扰字符串
     * @return string
     * ---------------------------------------
     */
    public function getAuthKey()
    {
        return $this->salt;
    }

    /**
     * 设置加密后的密码
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * 验证密码
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        if ($this->password === 'noKnow' && $this->from_social == 'kukewan') {
            $apiurl='http://www.kukewan.com/accounts/checklogin';
            $ch=curl_init();
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            curl_setopt($ch,CURLOPT_POST,1);
            curl_setopt($ch,CURLOPT_URL,$apiurl);
            curl_setopt($ch, CURLOPT_POSTFIELDS, ['user_name'=>$this->username,'user_pwd'=>$password]);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            $content=curl_exec($ch);
            curl_close($ch);
            $return=json_decode($content,true);
            $return=$return['state']==='1';
            if ($return){
                $this->password=Yii::$app->security->generatePasswordHash(md5($password));
                $this->save();
            }
            return $return ;
        }
        return Yii::$app->security->validatePassword($password, $this->password);
    }

    /**
     * ---------------------------------------
     * 重置密碼干扰字符串
     * @param string $authKey
     * @return bool
     * ---------------------------------------
     */
    public function resetAuthKey()
    {
        $this->salt = Yii::$app->security->generateRandomString();
        return $this->getAuthKey();
    }
    /**
     * --------------------------------------------------------------
     * 实现RateLimitInterface
     * 以下是接口调用速率限制信息，记得在数据库中添加两个字段allowance,allowance_updated_at
     * 这两个字段也可以存储到缓存中，这里方便就存储到数据库中了
     * 资料参考：http://www.yiichina.com/doc/guide/2.0/rest-rate-limiting
     * --------------------------------------------------------------
     */

    public function removeAuthKey()
    {
        $this->salt = '';
        return $this;
    }

    /**
     * ---------------------------------------
     * 返回某一时间允许请求的最大数量，比如设置10秒内最多5次请求（小数量方便我们模拟测试）
     * @param \yii\web\Request $request
     * @param \yii\base\Action $action
     * @return array
     * ---------------------------------------
     */
    public function getRateLimit($request, $action)
    {
        return [5, 10];
    }

    /**
     * ---------------------------------------
     * 回剩余的允许的请求和相应的UNIX时间戳数 当最后一次速率限制检查时
     * @param \yii\web\Request $request
     * @param \yii\base\Action $action
     * @return array
     * ---------------------------------------
     */
    public function loadAllowance($request, $action)
    {
//        return [$this->allowance, $this->allowance_updated_at];
    }

    /**
     * ---------------------------------------
     * 保存允许剩余的请求数和当前的UNIX时间戳
     * @param \yii\web\Request $request
     * @param \yii\base\Action $action
     * @param int $allowance
     * @param int $timestamp
     * ---------------------------------------
     */
    public function saveAllowance($request, $action, $allowance, $timestamp)
    {
//        $this->allowance = $allowance;
//        $this->allowance_updated_at = $timestamp;
//        $this->save();
    }


}
