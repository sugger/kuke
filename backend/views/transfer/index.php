<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use backend\models\TransferLog;
use kartik\select2\Select2;
use backend\models\PartnerUser;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\TransferLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = 'Transfer Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transfer-log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Transfer Log', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'order_sn',
            'transfer_sn',
            'money',
            'transfer_amount',
            [
                'attribute' => 'partner',
                'label' => '退款账户',
                'value' => function($model){
                    return $model->partner?$model->partner :'原付款账户' ;
                },
                'filter' => Select2::widget(
                    [
                        'data'=>\common\helpers\ArrayHelper::map(
                            PartnerUser::find()->andFilterWhere(['type'=>PartnerUser::TYPE_MIX ,'status'=>PartnerUser::STATUS_ACTIVE])->asArray()->all(),
                            'username','username'
                        ),
                        'options' => ['placeholder' => '请选择...'],
                        'attribute'=>'partner',
                        'model' => $searchModel,
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                    ]

                ),
            ],
             [
                 'attribute' => 'type',
                 'value' =>function($model){
                     return TransferLog::$typeName[$model->type];
                 },
                 'filter' => Html::activeDropDownList($searchModel,'type',
                     TransferLog::$typeName,
                     ['prompt'=>'全部']
                 //'',
                 ),
             ],
            [
                'attribute' => 'ctime',
//                'format' =>  ['date', 'php:Y-m-d H:i:s'],
                'options' => ['width' => '150px;'],
                'filter' => \kartik\date\DatePicker::widget([
                    'type' => \kartik\date\DatePicker::TYPE_RANGE,
                    'language' => 'zh-CN',
                    'layout' => '{input1}<br>{input2}',
                    'name' => 'TransferLogSearch[from_date]',
                    'value' => $searchModel->from_date,
                    'options' =>  ['class'=>'form-control','placeholder' => '开始时间'],
                    'name2' => 'TransferLogSearch[to_date]',
                    'value2' => $searchModel->to_date,
                    'options2' => ['class'=>'form-control','placeholder' => '结束时间'],
                    'pluginOptions' => [
                        'autoclose'=>true,
                        'format' => 'yyyy-mm-dd'
                    ]
                ])
            ],
            //'stime',
            'utime',
            [
                'attribute' => 'status',
                'filter' => Html::activeDropDownList($searchModel,'status',
                    TransferLog::$statusName,
                    ['prompt'=>'全部']
                //'',
                ),
                'value' => function($model){
                    return TransferLog::$statusName[$model->status];
                }
            ],


            [
                'header' => '查看',
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view}',
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>


<!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
jQuery(document).ready(function() {
highlight_subnav('transfer/index'); //子导航高亮
});
<?php $this->endBlock() ?>
<!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>
