<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model backend\models\PartnerGame */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-game-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'gkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->dropDownList([1=>'启用',0=>'禁用' ,2=>'仅登录']) ?>

    <?= $form->field($model, 'auto_server')->dropDownList([0=>'手动',1=>'自动',2=>'部分停服']) ?>

    <?= $form->field($model, 'rate')->textInput() ?>

    <?= $form->field($model, 'lkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pkey')->textInput(['maxlength' => true]) ?>

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
