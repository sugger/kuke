<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerUser */

$this->title = $model->id;
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
            'password',
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
            'api_ip:ntext',
            'callback',
            'notify',
        ],
    ]) ?>

</div>
