<?php

namespace common\models;

use api\models\User;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $order_id
 * @property string $order_sn
 * @property string $uid
 * @property string $username
 * @property double $money
 * @property string $rebate_id
 * @property double $really_money
 * @property double $game_money
 * @property string $type
 * @property string $gameid
 * @property string $sid
 * @property string $title
 * @property string $rolename
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
            [['order_sn', 'money', 'rebate_id', 'game_money', 'type', 'gameid', 'sid', 'title', 'create_time', 'pay_time', 'remark'], 'required'],
            [['uid', 'rebate_id', 'gameid', 'sid', 'create_time', 'pay_time', 'pay_type', 'pay_source', 'pay_status', 'status', 'is_del'], 'integer'],
            [['money', 'really_money', 'game_money'], 'number'],
            [['order_sn'], 'string', 'max' => 35],
            [['username', 'rolename'], 'string', 'max' => 30],
            [['type'], 'string', 'max' => 10],
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
            'uid' => '用户id',
            'username' => '姓名',
            'money' => '订单总额',
            'rebate_id' => '代金券ID',
            'really_money' => '实际后款金额',
            'game_money' => '游戏到账金额',
            'type' => '订单类型',
            'gameid' => '游戏ID',
            'sid' => '区服ID',
            'title' => '商品名称',
            'rolename' => '角色名',
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

    public function getUser()
    {
        return $this->hasOne(User::className(), ['uid' => 'uid'])->asArray();
    }
}
