<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerGame */

$this->title = '修改['.$partner->username .']的游戏:[' . $model->gamename .']';
$this->params['breadcrumbs'][] = ['label' => 'Partner Games', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="partner-game-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'partner'=> $partner,
        'game'=>$game
    ]) ?>

</div>
