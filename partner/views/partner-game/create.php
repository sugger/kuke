<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model partner\models\PartnerGame */

$this->title = '为' .$partner->username .'添加游戏';
$this->params['breadcrumbs'][] = ['label' => 'Partner Games', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'partner' =>$partner
    ]) ?>

</div>
