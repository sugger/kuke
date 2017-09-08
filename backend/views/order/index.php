<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Orders';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Order', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'order_id',
            'order_sn',
            'pay_sn',
            'uid',
            'username',
            // 'money',
            // 'rebate_id',
            // 'payables',
            // 'really_money',
            // 'game_money',
            // 'type',
            // 'gameid',
            // 'sid',
            // 'title',
            // 'rolename',
            // 'channel',
            // 'create_time',
            // 'pay_time',
            // 'pay_type',
            // 'pay_source',
            // 'pay_status',
            // 'status',
            // 'remark',
            // 'is_del',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
