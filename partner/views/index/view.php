<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* 加载页面级别资源 */
\partner\assets\TablesAsset::register($this);
$this->title = $model->username ."的信息";
$this->params['breadcrumbs'][] = ['label' => 'Partner Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-user-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('修改基本信息', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>

    </p>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'parentid',
            'domain',
//            'password',
            'type',
            'bankaccount',
            'realname',
            'number_id',
            'remark',
            'register_time:datetime',
            'lastlogin_time:datetime',
            'lastlogin_ip',
            'available_money',
            'money',
            'rate',
            'lkey',
            'pkey',
            'admin_username',
            'totalmoney',
            [
                'attribute'=>'status',
                'value'=>function($m){
                    return \common\models\PartnerUsers::STATUS_ACTIVE==$m->status ? '启用':'冻结';
                }
            ],

            'pay_tag',
            'tel',
            'email:email',
            'qq',
            'test_account',
//            'api_ip:ntext',
            'ip',
            'api',
            'callback',
            'notify',
        ],
    ]) ?>

</div>
<!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
jQuery(document).ready(function() {
highlight_subnav('partner/index'); //子导航高亮
});
<?php $this->endBlock() ?>
<!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>
