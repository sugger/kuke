<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\PartnerServer */

$this->title = 'Create Partner Server';
$this->params['breadcrumbs'][] = ['label' => 'Partner Servers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-server-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
