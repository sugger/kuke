<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use \backend\models\PartnerServer;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\PartnerServerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = '混服区服管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-server-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Partner Server', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
//                'filter' =>
                'class' => \common\core\CheckboxColumn::className(),
                'name'  => 'id',
                'options' => ['width' => '20px;'],
                'checkboxOptions' => function ($model, $key, $index, $column) {
                    return ['value' => $key,'label'=>'<span></span>','labelOptions'=>['class' =>'mt-checkbox mt-checkbox-outline','style'=>'padding-left:19px;']];
                }
            ],
            [
                'attribute' => 'pid',
                'value' => function($model){
                    $PartnerUser=$model->getPartnerUser();
                    return "[{$PartnerUser->id}]{$PartnerUser->username}" ;
                }
            ],
            [
                'attribute' => 'gid',
                'value' => function($model){
                    $game=$model->getGame();
                    return "[{$model->gid}]{$game->name}" ;
                }
            ],
            [
                'attribute' => 'sid',
                'value' => function($model){
                    $server=$model->getServer();
                    return "[{$server->serverid}]{$server->servername}" ;
                }
            ],
            'pserverid',

            [
                'attribute' => 'status',
                'filter' => Html::activeDropDownList($searchModel,'status',
                    [
                        PartnerServer::STATUS_ACTIVE=>'正常',
                        PartnerServer::STATUS_DISABLE=>'关闭',
                        PartnerServer::STATUS_ONLY_LOGIN=>"关闭充值",
                    ],
                    ['prompt'=>'全部']
                    //'',
                ),
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


            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
    <!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
    jQuery(document).ready(function() {
    highlight_subnav('partner-server/index'); //子导航高亮
    });
<?php $this->endBlock() ?>
    <!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>