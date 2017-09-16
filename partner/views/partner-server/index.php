<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use \partner\models\PartnerServer;
/* @var $this yii\web\View */
/* @var $searchModel partner\models\search\PartnerServerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* 加载页面级别资源 */
\partner\assets\TablesAsset::register($this);
$this->title = '混服区服管理';
$this->params['breadcrumbs'][] = $this->title;
$server='';
?>
<div class="partner-server-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Partner Server', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
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


            'pserverid',
            [
                'attribute' => 'sid',
                'label' => '酷客玩区服',
                'value' => function($model)use (&$server){
                    $server=$model->getServer();
                    return "[{$server->serverid}]{$server->servername}" ;
                }
            ],
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
            'attribute' => 'ctime',
            [
                'label' => '开服时间',
//                'format' => 'datetime',
                'value' => function($model)use (&$server){
                    return date('Y-m-d H:i:s',$server->start_time) ;
                }
            ],


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