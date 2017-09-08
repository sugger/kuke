<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\PartnerServer;
use backend\models\Server;
use common\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model backend\models\PartnerServer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="partner-server-form">

    <?php $form = ActiveForm::begin(); ?>


    <?php
    if($model->isNewRecord){
        $where="gid = {$game->id}";
        $sids=$partner->Sids($game->id);
        if ($sids) $where .= " and sid not in(".implode(',',$sids).")";
        echo $form->field($model, 'sid')->dropDownList(
            ArrayHelper::map(
                Server::find()->where($where)->orderBy('sid desc')->select('sid,servername')->asArray()->all(),
                'sid',
                'servername'
            )
        );
    }
    ?>

    <?= $form->field($model, 'pserverid')->textInput() ?>


    <?= $form->field($model, 'status')->dropDownList(
        [
            PartnerServer::STATUS_ACTIVE=>'正常',
            PartnerServer::STATUS_DISABLE=>'冻结',
            PartnerServer::STATUS_ONLY_LOGIN=>'仅登录',

        ]
    ) ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
