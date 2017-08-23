<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/1
 * Time: 17:06
 */

namespace common\models;

/**
 * This is the model class for table "{{%server}}".
 *
 * @property integer $sid
 * @property integer $gid
 * @property string $servername
 * @property integer $player_num
 * @property integer $start_time
 * @property integer $add_time
 * @property integer $up_time
 * @property string $stop_notice
 * @property integer $is_display
 * @property integer $status
 * @property string $content
 * @property integer $server_img
 * @property integer $isstop
 * @property string $serverid
 * @property string $cp_gameid
 * @property string $cp_sid
 * @property integer $is_del
 */
use common\models\Game;
class Server extends \common\core\BaseActiveRecord
{
    const DEL_YES =1;
    const DEL_NO=0;
    const SHOW=1;
    const HIDDEN=0;
    const STOP_YES=1;
    const STOP_NO=0;
    const TJ_YES=1;
    const TJ_NO=0;


    public $start_time_date;
    public static function tableName()
    {
        return "{{%server}}";
    }
    public function rules()
    {
        return [
            [['servername','start_time','start_time_date','serverid','cp_sid'],'required','on'=>'savedata'],
            [['gid', 'servername', 'player_num', 'start_time', 'add_time', 'up_time', 'is_display', 'status'], 'required'],
            [['sid','gid', 'player_num', 'start_time', 'add_time', 'up_time', 'is_display', 'status', 'server_img', 'isstop', 'is_del'], 'integer'],
            [['servername'], 'string', 'max' => 50],
            [['stop_notice', 'content'], 'string', 'max' => 255],
            [['serverid', 'cp_gameid', 'cp_sid'], 'string', 'max' => 10],
        ];
    }
    public function beforeValidate()
    {

        if ($this->start_time_date){
            $this->start_time=strtotime($this->start_time_date);
        }
        return parent::beforeValidate();
    }

    public function attributeLabels()
    {
        return [
            'sid'=>'编号',
            'gid'=>'所属游戏',
            'servername'=>'服务器名称',
            'player_num'=>'玩家数量',
            'start_time'=>'开服时间',
            'add_time'=>'添加时间',
            'up_time'=>'更新时间',
            'stop_notice'=>'停服通知',
            'is_display'=>'显示状态',
            'status'=>'推荐状态',
            'content'=>'简介',
            'server_img'=>'图片ID',
            'isstop'=>'是否停服',
            'serverid'=>'本站区服',
            'cp_gameid'=>'cp游戏ID',
            'cp_sid'=>'cp区服ID',
            'is_del'=>'删除',
        ];
    }
    public function getGame(){
        return Game::findOne($this->gid);
    }
}