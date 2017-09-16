<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\TransferLog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="transfer-log-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'order_sn')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'transfer_sn')->textInput() ?>

    <?= $form->field($model, 'money')->textInput() ?>

    <?= $form->field($model, 'transfer_amount')->textInput() ?>

    <?= $form->field($model, 'type')->dropDownList([ 'TUI' => 'TUI', 'FEN' => 'FEN', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'ctime')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList([ 'INIT' => 'INIT', 'TI' => 'TI', 'SHOU' => 'SHOU', 'TUI' => 'TUI', 'OK' => 'OK', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'stime')->textInput() ?>

    <?= $form->field($model, 'utime')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
