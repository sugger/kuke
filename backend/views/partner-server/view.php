<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use \backend\models\PartnerServer;
/* @var $this yii\web\View */
/* @var $model backend\models\PartnerServer */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$game=$model->getGame();
$server=$model->getServer();
$PartnerUser=$model->getPartnerUser();
$this->title = $PartnerUser->username .':'.$game->name ."的{$model->pserverid}服信息";
$this->params['breadcrumbs'][] = ['label' => 'Partner Servers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="partner-server-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'pid',
                'value' =>"[{$PartnerUser->id}]{$PartnerUser->username}"
            ],
            [
                'attribute' => 'gid',
                'label'=>'游戏',
                'value' =>  "[{$game->id}]{$game->name}"

            ],
            [
                'attribute' => 'sid',
                'value' => "[{$server->serverid}]{$server->servername}"
            ],
            'pserverid',
            [
                'attribute' => 'status',
                'value' => function($model){
                    switch ($model->status){
                        case PartnerServer::STATUS_ACTIVE:
                            return '正常';
                            break;
                        case PartnerServer::STATUS_DISABLE:
                            return '关闭';
                            break;
                        case PartnerServer::STATUS_ONLY_LOGIN:
                            return '关闭充值';
                            break;
                    }
                }
            ],
        ],
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