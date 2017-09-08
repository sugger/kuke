<?php

namespace common\models;

/**
 * This is the model class for table "{{%partner_users}}".
 *
 * @property integer $id
 * @property string $username
 * @property integer $parentid
 * @property string $domain
 * @property string $password
 * @property string $type
 * @property string $bankaccount
 * @property string $realname
 * @property string $number_id
 * @property string $remark
 * @property integer $register_time
 * @property integer $lastlogin_time
 * @property string $lastlogin_ip
 * @property double $available_money
 * @property double $money
 * @property double $rate
 * @property string $lkey
 * @property string $pkey
 * @property string $admin_username
 * @property double $totalmoney
 * @property integer $status
 * @property string $pay_tag
 * @property string $tel
 * @property string $email
 * @property string $qq
 * @property string $test_account
 * @property string $api_ip
 * @property string $callback
 * @property string $notify
 */
class PartnerUsers extends \common\core\BaseActiveRecord
{
    const TYPE_MIX = 1;
    const TYPE_CPS = 2;
    const TYPE_ADS = 3;
    const STATUS_ACTIVE = 1;
    const STATUS_DISABLE = 0;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%partner_users}}';
    }

    /**
     * 获取混服推广账号
     * @param $id
     * @return static
     */
    public static function findMix($id)
    {
        return self::findOne(['id' => (int)$id, 'type' => self::TYPE_MIX]);
    }

    /**
     * 获取CPS推广账号
     * @param $id
     * @return static
     */
    public static function findCps($id)
    {
        return self::findOne(['id' => $id, 'type' => self::TYPE_CPS]);
    }

    /**
     * 获取广告推广账号
     * @param $id
     * @return static
     */
    public static function findAds($id)
    {
        return self::findOne(['id' => $id, 'type' => self::TYPE_ADS]);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'parentid', 'domain',  'register_time', 'lastlogin_time', 'lastlogin_ip', 'available_money', 'money', 'rate', 'lkey', 'pkey', 'admin_username', 'totalmoney',  'email', 'api_ip', 'callback', 'notify'], 'required'],
            [['password'], 'required','on'=>'create'],
            [['parentid', 'register_time', 'lastlogin_time', 'status'], 'integer'],
            [['type', 'api_ip','api','ip'], 'string'],
            [['available_money', 'money', 'rate', 'totalmoney'], 'number'],
            [['username', 'realname', 'lastlogin_ip', 'admin_username'], 'string', 'max' => 30],
            [['domain', 'bankaccount', 'email'], 'string', 'max' => 100],
            [['password', 'number_id', 'pay_tag', 'tel', 'test_account'], 'string', 'max' => 50],
            [['remark'], 'string', 'max' => 255],
            [['lkey', 'pkey'], 'string', 'max' => 32],
            [['qq'], 'string', 'max' => 20],
            [['callback', 'notify'], 'string', 'max' => 250],
            [['rate'], 'compare', 'compareValue'=>1, 'operator' => '<'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => '用户名',
            'parentid' => '上级账户',
            'domain' => '域名',
            'password' => '密码',
            'type' => '账户类型',
            'bankaccount' => '银行账户',
            'realname' => '真实姓名',
            'number_id' => '身份证号',
            'remark' => '备注',
            'register_time' => '注册时间',
            'lastlogin_time' => '上次登录时间',
            'lastlogin_ip' => '上次登录IP',
            'available_money' => '透支金额（暂无用处）',
            'money' => '预付费额度',
            'rate' => '默认分成比例(小于1)',
            'lkey' => '登录KEY',
            'pkey' => '支付KEY',
            'admin_username' => '所属专员',
            'totalmoney' => '累计充值',
            'status' => '账户状态',
            'pay_tag' => '所属银行',
            'tel' => '联系电话',
            'email' => '电子邮箱',
            'qq' => 'QQ号',
            'test_account' => '测试账号（多个用,隔开）',
            'api_ip' => '接口权限及IP白名单',
            'ip' => 'IP白名单',
            'api' => 'Api接口权限',
            'callback' => '同步回调地址',
            'notify' => '异步回调地址',
        ];
    }
}
