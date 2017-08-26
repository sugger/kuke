<?php

use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Partner Games';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Partner Game', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'partnerid',
            'gid',
            'gkey',
            'status',
            // 'rate',
            // 'totalmoney',
            // 'lkey',
            // 'pkey',
            // 'auto_server',
            // 'create_time',
            // 'up_time',
            // 'url_web:url',
            // 'url_pay:url',
            // 'url_fcm:url',
            // 'url_bbs:url',
            // 'url_kefu:url',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>
