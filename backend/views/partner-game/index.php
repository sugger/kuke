<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use common\models\Game;
use backend\models\PartnerUser;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\PartnerGameSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = '混服游戏';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('混服账户', ['partner/index'], ['class' => 'btn btn-success']) ?>
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
                'attribute' => 'partnerid',
                'label' => '合作者',
                'value' => function($model){
                    $game= PartnerUser::find()->where(['id'=>$model->partnerid])->asArray()->select('username')->one();
                    return "[{$model->partnerid}]{$game['username']}";
                    return '合作者';
                }
            ],
            [
                'attribute' => 'gid',
                'label' => '游戏',
                'value' => function($model,$index,$value,$a){
                    $game=Game::find()->where(['id'=>$model->gid])->asArray()->select('name')->one();
                    return "[{$model->gid}]{$game['name']}";
                }
            ],
                //'gkey',
            [
                'attribute' => 'rate',
                'value' => function($model){
                    return ($model->rate * 100) .'%' ;
                }
            ],
            [
                'attribute' => 'totalmoney',
                'value' => function($model){
                    return ($model->totalmoney ) .'元' ;
                }
            ],
                // 'lkey',
                // 'pkey',
             [
                 'attribute' => 'auto_server',
                 'format' => 'html',
                 'filter' => Html::activeDropDownList($searchModel,'auto_server',['0'=>"手动",'1'=>"自动"],['prompt'=>'全部']),
                 'value' => function($model){
                     if ($model->auto_server==1) {
                         return Html::tag('span','自动',['class'=>'badge badge-success']);
                     }elseif ($model->auto_server==0){
                         return Html::tag('span','手动',['class'=>'badge']);
                     }elseif ($model->auto_server==2){
                         return Html::tag('span','禁用部分区服',['class'=>'badge']);
                     }

                 }
             ],
            [
                'attribute' => 'auto_server',
                'format' => 'html',
                'filter' => Html::activeDropDownList($searchModel,'status',['0'=>"冻结",'1'=>"正常"],['prompt'=>'全部']),
                'value' => function($model){
                    return $model->status?
                        Html::tag('span','正常',['class'=>'badge badge-success']):
                        Html::tag('span','冻结',['class'=>'badge']);
                }
            ],
            [
                'attribute' => 'create_time',
                'filter'=>Html::tag('span','暂不支持搜索',['class'=>'badge']),
            ],

            // 'up_time',
            // 'url_web:url',
            // 'url_pay:url',
            // 'url_fcm:url',
            // 'url_bbs:url',
            // 'url_kefu:url',
            // 'url_client:url',

            [
                'header' => '操作',
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {addsub}',
                'buttons' => [
                    'addsub' => function ($url, $model, $key) {
                        return Html::a('<i class="fa fa-edit"></i>', ['partner-server/create', 'pid'=>$model['partnerid'],'gid'=>$model['gid']], [
                            'title' => Yii::t('app', '添加区服'),
                            'class' => 'btn btn-xs purple'
                        ]);
                    },
                ]
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
    <!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
    jQuery(document).ready(function() {
    highlight_subnav('partner-game/index'); //子导航高亮
    });
<?php $this->endBlock() ?>
    <!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>