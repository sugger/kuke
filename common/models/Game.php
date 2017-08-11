<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/28
 * Time: 10:58
 */

namespace common\models;

/**
 * This is the model class for table "{{%game}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $game_starttime
 * @property string $short
 * @property integer $sort
 * @property string $gametype
 * @property integer $gamestyle
 * @property string $pic
 * @property integer $payto
 * @property string $content
 * @property integer $ishot
 * @property string $game_web
 * @property string $game_bbs
 * @property string $currency
 * @property integer $addtime
 * @property integer $game_hit
 * @property integer $game_players
 * @property string $qq
 * @property integer $isdisplay
 * @property integer $isopen
 * @property string $desc1
 * @property string $game_api
 * @property string $game_conf
 * @property string $remarks
 * @property string $lander
 * @property integer $is_del
 */
class Game extends \common\core\BaseActiveRecord
{
    public static function tableName()
    {
        return "{{%game}}";
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'game_starttime', 'short', 'gametype', 'gamestyle', 'pic', 'content', 'game_web', 'game_bbs', 'addtime', 'qq', 'desc1', 'remarks', 'is_del'], 'required'],
            [['game_starttime'], 'safe'],
            [['sort', 'gamestyle', 'payto', 'ishot', 'addtime', 'game_hit', 'game_players', 'isdisplay', 'isopen', 'is_del'], 'integer'],
            [['pic', 'content', 'qq', 'remarks'], 'string'],
            [['name'], 'string', 'max' => 55],
            [['short'], 'string', 'max' => 10],
            [['gametype', 'currency'], 'string', 'max' => 20],
            [['game_web', 'game_bbs', 'desc1'], 'string', 'max' => 255],
            [['game_api', 'game_conf'], 'string', 'max' => 60],
            [['lander'], 'string', 'max' => 254],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'game_starttime' => '开始时间',
            'name' => '游戏名称',
            'short' => '简写',
            'sort'=>'排序值',
            'gametype' => '平台类型',
            'gamestyle' => '战斗类型',
            'pic' => '图片',
            'payto' => '充值比例',
            'content' => '游戏简介',
            'ishot' => '推荐状态',
            'game_web' => '游戏官网',
            'game_bbs' => '游戏论坛',
            'currency' => '游戏币单位',
            'addtime' => '添加时间',
            'game_hit' => '点击量',
            'game_players' => '玩家数量',
            'qq' => '客服QQ',
            'isdisplay' => '显示状态',
            'isopen' => '开启状态',
            'desc1' => '描述',
            'game_api' => '接口文件名',
            'game_conf' => '接口配置参数',
            'remarks' => '停服备注',
            'lander' => '微端地址',
            'is_del' => '删除',
        ];
    }

    public function pic($id)
    {
        return Picture::findOne($id);
    }

}