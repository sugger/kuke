<?php

use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Partner Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-user-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Partner User', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            'parentid',
            'domain',
            'password',
            // 'type',
            // 'bankaccount',
            // 'realname',
            // 'number_id',
            // 'remark',
            // 'register_time:datetime',
            // 'lastlogin_time:datetime',
            // 'lastlogin_ip',
            // 'available_money',
            // 'money',
            // 'rate',
            // 'lkey',
            // 'pkey',
            // 'admin_username',
            // 'totalmoney',
            // 'status',
            // 'pay_tag',
            // 'tel',
            // 'email:email',
            // 'qq',
            // 'api_ip:ntext',
            // 'callback',
            // 'notify',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>
