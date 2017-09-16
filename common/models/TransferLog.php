<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%transfer_log}}".
 *
 * @property integer $id
 * @property string $order_sn
 * @property string $transfer_sn
 * @property double $money
 * @property double $transfer_amount
 * @property double $partner
 * @property string $type
 * @property string $ctime
 * @property string $utime
 * @property string $stime
 * @property string $status
 * @property string $remark
 *
 */
class TransferLog extends \common\core\BaseActiveRecord
{
    const TYPE_FEN='FEN';//分账
    const TYPE_TUI='TUI';//退款

    public static $typeName=[
        'FEN'=>'分账',
        'TUI'=>'退款',
    ];
    const STATUS_INIT='INIT';//初始化退款
    const STATUS_TI='TI';//初始化退款
    const STATUS_SHOU='SHOU';//申请已提交
    const STATUS_TUI='TUI';//初始化退款
    const STATUS_OK='OK';//初始化退款
    const STATUS_ERR='ERR';//初始化退款
    public static $statusName=[
        'INIT'=>'初始化退款',
        'TI'=>'申请已提交',
        'SHOU'=>'退款已受理',
        'TUI'=>'正在退款',
        'OK'=>'转出城成功',
        'ERR'=>'遇到错误已终止'
    ];
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%transfer_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_sn', 'money', 'transfer_amount'], 'required'],
            [['money', 'transfer_amount'], 'number'],
            [['type', 'status'], 'string'],
            [['ctime', 'utime', 'stime'], 'safe'],
            [['order_sn', 'transfer_sn'], 'string', 'max' => 35],
            [['remark'], 'string', 'max' => 200],
            [['partner'], 'string', 'max' => 10],
            [['order_sn'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order_sn' => '订单号',
            'transfer_sn' => '流水号',
            'money' => '订单金额',
            'transfer_amount' => '转账(退款)金额',
            'partner' => '分账账户',
            'type' => '类型',
            'ctime' => '创建时间',
            'utime' => '更新时间',
            'stime' => '成功时间',
            'status' => '资金状态',
            'remark' => '备注'
        ];
    }
}
