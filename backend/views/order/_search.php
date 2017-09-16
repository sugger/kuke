<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\OrderSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'order_id') ?>

    <?= $form->field($model, 'order_sn') ?>

    <?= $form->field($model, 'pay_sn') ?>

    <?= $form->field($model, 'uid') ?>

    <?= $form->field($model, 'username') ?>

    <?php // echo $form->field($model, 'money') ?>

    <?php // echo $form->field($model, 'rebate_id') ?>

    <?php // echo $form->field($model, 'payables') ?>

    <?php // echo $form->field($model, 'really_money') ?>

    <?php // echo $form->field($model, 'game_money') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'gameid') ?>

    <?php // echo $form->field($model, 'sid') ?>

    <?php // echo $form->field($model, 'title') ?>

    <?php // echo $form->field($model, 'rolename') ?>

    <?php // echo $form->field($model, 'channel') ?>

    <?php // echo $form->field($model, 'create_time') ?>

    <?php // echo $form->field($model, 'pay_time') ?>

    <?php // echo $form->field($model, 'pay_type') ?>

    <?php // echo $form->field($model, 'pay_source') ?>

    <?php // echo $form->field($model, 'pay_status') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'remark') ?>

    <?php // echo $form->field($model, 'is_del') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
