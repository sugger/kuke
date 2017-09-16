<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\TransferLog */

$this->title = 'Create Transfer Log';
$this->params['breadcrumbs'][] = ['label' => 'Transfer Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transfer-log-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
