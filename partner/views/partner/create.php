<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* 加载页面级别资源 */
\partner\assets\TablesAsset::register($this);
$this->title = '创建合作账户';
$this->params['breadcrumbs'][] = ['label' => '填写账户信息', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-user-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    <!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
    jQuery(document).ready(function() {
    highlight_subnav('partner/index'); //子导航高亮
    });
<?php $this->endBlock() ?>
    <!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>