<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\PartnerServer */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = $this->title = "[{$partner->username}]-[{$game->name}]" . "修改区服[". $model->getServername() .']';
$this->params['breadcrumbs'][] = ['label' => 'Partner Servers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="partner-server-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
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