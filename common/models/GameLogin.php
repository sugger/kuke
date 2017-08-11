<?php

namespace common\models;

/**
 * This is the model class for table "{{%nav}}".
 *
 * @property integer $id
 * @property integer $userid
 * @property integer $gameid
 * @property string $agent
 * @property integer $login_time
 * @property integer $reg_time
 * @property integer $fromflag
 * @property integer $ip
 */
class GameLogin extends \common\core\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%game_login}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ip', 'userid', 'gameid', 'login_time', 'reg_time', 'fromflag', 'ip'], 'integer'],
            [['ip'], 'string', 'max' => 18],
            [['agent'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'userid' => 'userid',
            'gameid' => 'gameid',
            'agent' => 'agent',
            'login_time' => 'login_time',
            'reg_time' => 'reg_time',
            'fromflag' => 'fromflag',
            'ip' => 'Ip'
        ];
    }

    public function getGame()
    {
        $name = $this->hasOne(Game::className(), ['id' => 'gameid']);
        return $name;
    }

    public function getServer()
    {
        return $this->hasOne(Server::className(), ['id' => 'serverid']);
    }
}
