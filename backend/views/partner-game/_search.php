<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\PartnerGameSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-game-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'partnerid') ?>

    <?= $form->field($model, 'gid') ?>

    <?= $form->field($model, 'gkey') ?>

    <?= $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'rate') ?>

    <?php // echo $form->field($model, 'totalmoney') ?>

    <?php // echo $form->field($model, 'lkey') ?>

    <?php // echo $form->field($model, 'pkey') ?>

    <?php // echo $form->field($model, 'auto_server') ?>

    <?php // echo $form->field($model, 'create_time') ?>

    <?php // echo $form->field($model, 'up_time') ?>

    <?php // echo $form->field($model, 'url_web') ?>

    <?php // echo $form->field($model, 'url_pay') ?>

    <?php // echo $form->field($model, 'url_fcm') ?>

    <?php // echo $form->field($model, 'url_bbs') ?>

    <?php // echo $form->field($model, 'url_kefu') ?>

    <?php // echo $form->field($model, 'url_client') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
