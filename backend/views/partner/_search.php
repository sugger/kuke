<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\PartnerUserSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-user-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'username') ?>

    <?= $form->field($model, 'parentid') ?>

    <?= $form->field($model, 'domain') ?>

    <?= $form->field($model, 'password') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'bankaccount') ?>

    <?php // echo $form->field($model, 'realname') ?>

    <?php // echo $form->field($model, 'number_id') ?>

    <?php // echo $form->field($model, 'remark') ?>

    <?php // echo $form->field($model, 'register_time') ?>

    <?php // echo $form->field($model, 'lastlogin_time') ?>

    <?php // echo $form->field($model, 'lastlogin_ip') ?>

    <?php // echo $form->field($model, 'available_money') ?>

    <?php // echo $form->field($model, 'money') ?>

    <?php // echo $form->field($model, 'rate') ?>

    <?php // echo $form->field($model, 'lkey') ?>

    <?php // echo $form->field($model, 'pkey') ?>

    <?php // echo $form->field($model, 'admin_username') ?>

    <?php // echo $form->field($model, 'totalmoney') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'pay_tag') ?>

    <?php // echo $form->field($model, 'tel') ?>

    <?php // echo $form->field($model, 'email') ?>

    <?php // echo $form->field($model, 'qq') ?>

    <?php // echo $form->field($model, 'test_account') ?>

    <?php // echo $form->field($model, 'api_ip') ?>

    <?php // echo $form->field($model, 'callback') ?>

    <?php // echo $form->field($model, 'notify') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
