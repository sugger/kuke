<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\PartnerServer */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = "为混服[{$partner->username}]的[{$game->name}]" .($model->isNewRecord?'添加':'修改')."区服";
$this->params['breadcrumbs'][] = ['label' => 'Partner Servers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-server-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'partner'=> $partner,
        'game' => $game,
    ]) ?>

</div>
    <!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
    jQuery(document).ready(function() {
    highlight_subnav('partner-server/index'); //子导航高亮
    });
<?php $this->endBlock() ?>
    <!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>