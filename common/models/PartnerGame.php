<?php

namespace common\models;

/**
 * This is the model class for table "{{%partner_game}}".
 *
 * @property integer $id
 * @property integer $partnerid
 * @property integer $gid
 * @property string $gkey
 * @property integer $status
 * @property double $rate
 * @property double $totalmoney
 * @property string $lkey
 * @property string $pkey
 * @property integer $auto_server
 * @property string $create_time
 * @property string $up_time
 * @property string $url_web
 * @property string $url_pay
 * @property string $url_fcm
 * @property string $url_bbs
 * @property string $url_kefu
 * @property string $url_client
 */
class PartnerGame extends \common\core\BaseActiveRecord
{
    const STATUS_DISABLE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_LOGIN = 2;
    const AUTO_DISABLE = 0;
    const AUTO_ACTIVE = 1;
    const AUTO_STOP_NEW_SERVER = 2;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%partner_game}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['partnerid', 'gid', 'gkey', 'status', 'url_web', 'url_pay'], 'required'],
            [['partnerid', 'gid', 'status', 'auto_server'], 'integer'],
            [['rate', 'totalmoney'], 'number'],
            [['create_time', 'up_time'], 'safe'],
            [['gkey'], 'string', 'max' => 10],
            [['lkey', 'pkey'], 'string', 'max' => 32],
            [['url_web', 'url_pay', 'url_fcm', 'url_bbs', 'url_kefu', 'url_client'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'partnerid' => '合作者ID',
            'gid' => '本站游戏ID',
            'gkey' => '混服游戏标识',
            'status' => '启用状态',
            'rate' => '分成比例',
            'totalmoney' => '累计充值',
            'lkey' => '登录Key',
            'pkey' => '充值KEY',
            'auto_server' => '区服自动添加',
            'create_time' => '创建时间',
            'up_time' => '更新时间',
            'url_web' => '官网',
            'url_pay' => '充值页面',
            'url_fcm' => '防沉迷地址',
            'url_bbs' => '论坛地址',
            'url_kefu' => '客服中心',
            'url_client' => '微端下载地址',
        ];
    }

}
