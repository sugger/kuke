<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\PartnerUser */

$this->title = 'Create Partner User';
$this->params['breadcrumbs'][] = ['label' => 'Partner Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-user-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
