<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'domain')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'lkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pkey')->textInput(['maxlength' => true]) ?>

    <? //$form->field($model, 'api_ip')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ip')->textarea(['rows' => 6])->label('IP白名单') ?>

    <?= $form->field($model, 'api')->textarea(['rows' => 6])->label('Api接口权限') ?>

    <?= $form->field($model, 'test_account')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'callback')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'notify')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pay_tag')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bankaccount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'realname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'number_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'qq')->textInput(['maxlength' => true]) ?>



    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
