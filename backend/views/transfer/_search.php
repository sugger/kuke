<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\TransferLogSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="transfer-log-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'order_sn') ?>

    <?= $form->field($model, 'transfer_sn') ?>

    <?= $form->field($model, 'money') ?>

    <?= $form->field($model, 'transfer_amount') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'ctime') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'stime') ?>

    <?php // echo $form->field($model, 'utime') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
