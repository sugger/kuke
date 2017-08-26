<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\PartnerGame */

$this->title = 'Create Partner Game';
$this->params['breadcrumbs'][] = ['label' => 'Partner Games', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
