<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerUser */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = '合作者:'.$model->username ."的信息";
$this->params['breadcrumbs'][] = ['label' => 'Partner Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
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
            'status',
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
