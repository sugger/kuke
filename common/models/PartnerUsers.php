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
            [['username', 'parentid', 'domain', 'password', 'bankaccount', 'realname', 'number_id', 'remark', 'register_time', 'lastlogin_time', 'lastlogin_ip', 'available_money', 'money', 'rate', 'lkey', 'pkey', 'admin_username', 'totalmoney', 'pay_tag', 'tel', 'email', 'qq', 'api_ip', 'callback', 'notify'], 'required'],
            [['parentid', 'register_time', 'lastlogin_time', 'status'], 'integer'],
            [['type', 'api_ip'], 'string'],
            [['available_money', 'money', 'rate', 'totalmoney'], 'number'],
            [['username', 'realname', 'lastlogin_ip', 'admin_username'], 'string', 'max' => 30],
            [['domain', 'bankaccount', 'email'], 'string', 'max' => 100],
            [['password', 'number_id', 'pay_tag', 'tel', 'test_account'], 'string', 'max' => 50],
            [['remark'], 'string', 'max' => 255],
            [['lkey', 'pkey'], 'string', 'max' => 32],
            [['qq'], 'string', 'max' => 20],
            [['callback', 'notify'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'parentid' => 'Parentid',
            'domain' => 'Domain',
            'password' => 'Password',
            'type' => 'Type',
            'bankaccount' => 'Bankaccount',
            'realname' => 'Realname',
            'number_id' => 'Number ID',
            'remark' => 'Remark',
            'register_time' => 'Register Time',
            'lastlogin_time' => 'Lastlogin Time',
            'lastlogin_ip' => 'Lastlogin Ip',
            'available_money' => 'Available Money',
            'money' => 'Money',
            'rate' => 'Rate',
            'lkey' => 'Lkey',
            'pkey' => 'Pkey',
            'admin_username' => 'Admin Username',
            'totalmoney' => 'Totalmoney',
            'status' => 'Status',
            'pay_tag' => 'Pay Tag',
            'tel' => 'Tel',
            'email' => 'Email',
            'qq' => 'Qq',
            'test_account' => 'Test Account',
            'api_ip' => 'Api Ip',
            'callback' => 'Callback',
            'notify' => 'Notify',
        ];
    }
}
