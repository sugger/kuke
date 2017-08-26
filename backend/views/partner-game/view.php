<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerGame */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Partner Games', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-view">

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
            'partnerid',
            'gid',
            'gkey',
            'status',
            'rate',
            'totalmoney',
            'lkey',
            'pkey',
            'auto_server',
            'create_time',
            'up_time',
            'url_web:url',
            'url_pay:url',
            'url_fcm:url',
            'url_bbs:url',
            'url_kefu:url',
            'url_client:url',
        ],
    ]) ?>

</div>
