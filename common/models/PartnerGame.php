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
    const AUTO_STOP_NEW_SERVER = 1;

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
            [['partnerid', 'gid', 'gkey', 'status', 'rate', 'totalmoney', 'lkey', 'pkey', 'url_web', 'url_pay', 'url_fcm', 'url_bbs', 'url_kefu', 'url_client'], 'required'],
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
            'partnerid' => 'Partnerid',
            'gid' => 'Gid',
            'gkey' => 'Gkey',
            'status' => 'Status',
            'rate' => 'Rate',
            'totalmoney' => 'Totalmoney',
            'lkey' => 'Lkey',
            'pkey' => 'Pkey',
            'auto_server' => 'Auto Server',
            'create_time' => 'Create Time',
            'up_time' => 'Up Time',
            'url_web' => 'Url Web',
            'url_pay' => 'Url Pay',
            'url_fcm' => 'Url Fcm',
            'url_bbs' => 'Url Bbs',
            'url_kefu' => 'Url Kefu',
            'url_client' => 'Url Client',
        ];
    }
}
