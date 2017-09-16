<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model partner\models\PartnerGame */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-game-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'gkey')->textInput(['maxlength' => true]) ?>

    <?= $model->status==2?'':$form->field($model, 'status')->dropDownList([1=>'启用',0=>'禁用']) ?>

    <?= $model->auto_server==2?'':$form->field($model, 'auto_server')->dropDownList([0=>'手动',1=>'自动']) ?>

    <?= $model->isNewRecord?$form->field($model, 'rate')->textInput():'' ?>

    <?= $form->field($model, 'lkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_web')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_pay')->textInput(['maxlength' => true])->hint('账号:{uid} 区服号:{serverid}') ?>

    <?= $form->field($model, 'url_fcm')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_bbs')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_kefu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_client')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
