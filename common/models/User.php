<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%user}}".
 *
 * @property string $uid
 * @property string $username
 * @property string $password
 * @property string $salt
 * @property string $email
 * @property string $mobile
 * @property string $reg_time
 * @property string $reg_ip
 * @property string $last_login_time
 * @property string $last_login_ip
 * @property string $update_time
 * @property string $tuid
 * @property string $image
 * @property string $score
 * @property string $score_all
 * @property integer $status
 */
class User extends \common\core\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password'], 'required'],
            [['uid','reg_time', 'reg_ip','reg_serverid','reg_gameid', 'last_login_time', 'last_login_ip', 'tuid', 'score', 'score_all', 'status'], 'integer'],
            [['username'], 'string', 'max' => 16],
            [['nickname'], 'string', 'max' => 30],
            [['idcard'], 'string', 'max' => 20],
            [['update_time'], 'string'],
            [['money','total_money',], 'number'],
            [['salt', 'email'], 'string', 'max' => 32],
            [['mobile'], 'string', 'max' => 15],
            [['image'], 'string', 'max' => 255],
            [['from_social'], 'string', 'max' => 200],
            [['username'], 'unique'],
            [['email'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'uid' => 'Uid',
            'username' => 'Username',
            'password' => 'Password',
            'salt' => 'Salt',
            'email' => 'Email',
            'mobile' => 'Mobile',
            'idcard' => 'Id Card',
            'money' => 'Money',
            'total_money' => 'Total Money',
            'from_social' => 'From Social',
            'reg_time' => 'Reg Time',
            'reg_ip' => 'Reg Ip',
            'last_login_time' => 'Last Login Time',
            'last_login_ip' => 'Last Login Ip',
            'update_time' => 'Update Time',
            'tuid' => 'Tuid',
            'image' => 'Image',
            'score' => 'Score',
            'score_all' => 'Score All',
            'reg_gameid' => 'Reg GameId',
            'reg_serverid' => 'Reg ServerId',
            'status' => 'Status',
        ];
    }

    /**
     * @return string
     */
    public function getOrder()
    {
        $limit = Yii::$app->request->get('limit', 5);
        $offset = Yii::$app->request->get('offset', 0);
        return $this->hasMany(Order::className(), ['uid' => 'id'])->orderBy('create_time desc')->limit($limit)->offset($offset);
    }
}
