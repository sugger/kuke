<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'domain')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type')->dropDownList([ 1 => '混服', 2 => 'CPS', 3 => '广告' ], ['prompt' => '请选择账户类型']) ?>

    <?= $form->field($model, 'available_money')->textInput() ?>

    <?= $form->field($model, 'money')->textInput() ?>

    <?= $form->field($model, 'totalmoney')->textInput() ?>

    <?= $form->field($model, 'rate')->textInput() ?>

    <?= $form->field($model, 'lkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pkey')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'admin_username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'remark')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->dropDownList([ 1 => '启用', 0 => '锁定'], ['prompt' => '请选择账户类型'])  ?>

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
