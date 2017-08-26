<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerGame */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-game-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'partnerid')->textInput() ?>

    <?= $form->field($model, 'gid')->textInput() ?>

    <?= $form->field($model, 'gkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'rate')->textInput() ?>

    <?= $form->field($model, 'totalmoney')->textInput() ?>

    <?= $form->field($model, 'lkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'auto_server')->textInput() ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'up_time')->textInput() ?>

    <?= $form->field($model, 'url_web')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_pay')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_fcm')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_bbs')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_kefu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_client')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
