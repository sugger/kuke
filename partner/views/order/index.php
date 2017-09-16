<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use partner\models\Order;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $searchModel partner\models\search\OrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Orders';
$this->params['breadcrumbs'][] = $this->title;
$pay_type=Yii::$app->params['payType'];

$statusPayName=Order::$statusPayName;
$statusName=Order::$statusName;
$orderType=Order::$typeName;
?>
<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Order', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            [
                'attribute' => 'order_sn',
                'label' => '酷客玩订单号'
            ],
            [
                'attribute' => 'pay_sn',
                'label' => '平台订单号'
            ],
            [
                'attribute' => 'username',
                'label' => '充值账号(UID/用户名)',
                'value' => function($model){
                    return $model->uid?
                        ($model->uid.'【'.ltrim($model->username,Yii::$app->user->getIdentity()->username .'_') .'】'):
                        '无';
                }
            ],
            [
                'attribute' => 'money',
                'label' => '总额',
                'options' => ['width' => '80px;'],
                'value' => function($model){
                    return "￥{$model->money}元";
                }
            ],
            [
                'attribute' => 'gameid',
                'label' => '游戏',
                'value' => function($model){
                    return $model->gameid?"[{$model->gameid}]" . $model->getGamename ():'无' ;
                },
                'filter' => Select2::widget(
                    [
                        'data'=>\common\helpers\ArrayHelper::map(
                            \partner\models\search\GameSearch::find()->andFilterWhere(['is_del'=>0])->asArray()->all(),
                            'id','name'
                        ),
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                        'options' => ['placeholder' => '请选择...'],
                        'attribute'=>'gameid',
                        'model' => $searchModel,
                    ]

                ),
            ],
            [
                'attribute' => 'sid',
                'label' => '区服',
                'options' => ['width' => '85px;'],
                'value' => function($model){
                    return $model->sid?"[{$model->sid}]".$model->getServer()->serverid .'服':'无';
                }
            ],
            [
                'attribute' => 'type',
                'filter' => Html::activeDropDownList($searchModel,'type',Order::$typeName,['prompt'=>'全部']),
                'options' => ['width' => '100px;'],
                'value' => function($model) use ($orderType){
                    return isset($orderType[$model->type])?$orderType[$model->type]:$model->type;
                }
            ],
            [
                 'attribute' => 'rolename',
                 'options' => ['width' => '100px;'],
            ],
            [
                'attribute' => 'channel',
                'options' => ['width' => '100px;'],
                'value' => function ($m){
                    return $m->channel?("[{$m->channel}]".$m->getQdName()):"无渠道";
                }
            ],
            [
                'attribute' => 'create_time',
                'format' =>  ['date', 'php:Y-m-d H:i:s'],
                'options' => ['width' => '150px;'],
                'filter' => \kartik\date\DatePicker::widget([
                    'type' => \kartik\date\DatePicker::TYPE_RANGE,
                    'language' => 'zh-CN',
                    'layout' => '{input1}<br>{input2}',
                    'name' => 'OrderSearch[from_date]',
                    'value' => $searchModel->from_date,
                    'options' =>  ['class'=>'form-control','placeholder' => '开始时间'],
                    'name2' => 'OrderSearch[to_date]',
                    'value2' => $searchModel->to_date,
                    'options2' => ['class'=>'form-control','placeholder' => '结束时间'],
                    'pluginOptions' => [
                        'autoclose'=>true,
                        'format' => 'yyyy-mm-dd'
                    ]
                ])
            ],

            [
                'attribute' => 'pay_type',
                'label' => '付款方式',
                'filter' => Html::activeDropDownList($searchModel,'pay_type',\common\helpers\ArrayHelper::map($pay_type,'id','name'),['prompt'=>'全部']),
                'value' => function($model) use ($pay_type){
                    return  (isset($pay_type[$model->pay_type] ) ?
                        $pay_type[$model->pay_type]['name'] :
                        "{$model->pay_type}") . "[{$model->pay_source}]" ;
                }
            ],
            [
                'attribute' => 'pay_status',
                'label' => '付款状态',
                'format' => 'html',
                'filter' => Html::activeDropDownList($searchModel,'pay_status',$statusPayName,['prompt'=>'全部']),
                'value' => function($m) use ($statusPayName){
                    return isset($statusPayName[$m->pay_status])?
                        Html::tag('span',$statusPayName[$m->pay_status],['class'=>'badge' .($m->pay_status==Order::STATUS_PAY_YES ?' badge-success':'')]):
                        Html::tag('span','未知:'.$m->pay_status,['class'=>'badge badge-important']);
                }
            ],
            [
                'attribute' => 'status',
                'label' => '游戏状态',
                'format' => 'html',
                'filter' => Html::activeDropDownList($searchModel,'status',$statusName,['prompt'=>'全部']),
                'value' => function($m) use ($statusName){
                    return isset($statusName[$m->status])?
                        Html::tag('span',$statusName[$m->status],['class'=>'badge'.($m->status==Order::STATUS_YES ?' badge-success':'')]):
                        Html::tag('span','代号:'.$m->status,['class'=>'badge badge-success']);
                }
            ],

            [
                'header' => '详情',
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view}',
                'options' => ['width' => '50px;'],
                'buttons' => [
                    'addsub' => function ($url, $model, $key) {
                        return ''/*Html::a('<i class="fa fa-edit"></i>', ['partner-server/create', 'pid'=>$model['partnerid'],'gid'=>$model['gid']], [
                            'title' => Yii::t('app', '添加区服'),
                            'class' => 'btn btn-xs purple'
                        ])*/;
                    },
                ]
            ],
        ],
    ]); ?>
    <h2>累计充值<?= $dataProvider->query->andFilterWhere(['pay_status'=>1])->sum('money') ?>元</h2>
<?php Pjax::end(); ?></div>
