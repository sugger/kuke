<?php

namespace common\models;
use Yii;
/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $order_id
 * @property string $order_sn
 * @property string $pay_sn
 * @property string $uid
 * @property string $username
 * @property double $money
 * @property string $rebate_id
 * @property string $payables
 * @property double $really_money
 * @property double $game_money
 * @property string $type
 * @property string $gameid
 * @property string $sid
 * @property string $title
 * @property string $rolename
 * @property string $channel
 * @property string $create_time
 * @property string $pay_time
 * @property integer $pay_type
 * @property integer $pay_source
 * @property integer $pay_status
 * @property integer $status
 * @property string $remark
 * @property integer $is_del
 */
class Order extends \common\core\BaseActiveRecord
{
    const STATUS_PAY_YES = 1;
    const STATUS_PAY_NO = 0;
    const STATUS_YES = 1;
    const STATUS_NO = 0;


    public function writepaytype()
    {
        $paytype=Yii::$app->params['payType'];
        if (!$paytype[$this->pay_type]) return false;
        return $paytype[$this->pay_type]['apiClass']::paytype($this);
    }
    public function readpaytype()
    {

        if (!is_numeric($this->pay_type) && !empty($this->pay_type)){
            $paytype=Yii::$app->params['payType'];
            if (isset($paytype[$this->pay_type])) $this->pay_type = $paytype[$this->pay_type]['id'];

        }
        return $this;
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     * @return OrderQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new OrderQuery(get_called_class());
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_sn', 'money', 'gameid', 'sid', 'create_time'], 'required'],
            [['uid','channel', 'rebate_id', 'gameid', 'sid', 'create_time', 'pay_time', 'pay_status', 'status', 'is_del'], 'integer'],
            [['money','payables', 'really_money', 'game_money'], 'number'],
            [['order_sn'], 'string', 'max' => 35],
            [['pay_sn'], 'string', 'max' => 35],
            [['username', 'rolename'], 'string', 'max' => 30],
            [['type', 'pay_type', 'pay_source'], 'string', 'max' => 10],
            [['title'], 'string', 'max' => 100],
            [['remark'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'order_id' => 'Order ID',
            'order_sn' => '订单号',
            'pay_sn' => '付款订单号',
            'uid' => '用户id',
            'username' => '姓名',
            'money' => '订单总额',
            'rebate_id' => '代金券ID',
            'payables' => '应付款',
            'really_money' => '实际后款金额',
            'game_money' => '游戏到账金额',
            'type' => '订单类型',
            'gameid' => '游戏ID',
            'sid' => '区服ID',
            'title' => '商品名称',
            'rolename' => '角色名',
            'channel' => '渠道号',
            'create_time' => '订单创建时间',
            'pay_time' => '支付时间',
            'pay_type' => '支付类型 微信 支付宝 银联',
            'pay_source' => '支付途径',
            'pay_status' => '支付状态 0未支付 1已支付',
            'status' => '状态0未发放 1已发放',
            'remark' => '备注',
            'is_del' => '是否删除',
        ];
    }

    public function getGame()
    {
        return Game::findOne($this->gameid);
    }

    public function getServer()
    {
        return Server::findOne($this->sid);
    }

}
