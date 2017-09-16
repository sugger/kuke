<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use partner\models\PartnerGame;
/* @var $this yii\web\View */
/* @var $model partner\models\PartnerGame */
$partner=$model->getPartnerUser();
$this->title = $partner->username .'的游戏['. $model->gamename .']';
$this->params['breadcrumbs'][] = ['label' => 'Partner Games', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partner-game-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('修改基本信息', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= $model->auto_server ==PartnerGame::AUTO_DISABLE?
            Html::a('添加区服', ['partner-server/create', 'gid'=>$model->gid], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]):'' ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'partnerid',
            [
                'attribute'=>'gid',
                'label'=>'游戏',
                'value'=>function($model){
                    return $model->gid . "[{$model->gamename}]";
                }
            ],
            'gkey',
            [
                'attribute'=>'status',
                'label'=>'状态',
                'value'=>function($model){
                    if ($model->status ==0 ){
                        return '关闭';
                    }elseif ($model->status == 1){
                        return '正常';
                    }elseif ($model->status == 2){
                        return '仅登录';
                    }
                }
            ],
            [
                'attribute'=>'rate',
                'value'=>function($model)use ($partner){
                    if ($model->rate ==0 ){
                        return $partner?'默认比例：'. $partner->rate : '未填写';
                    }else{
                        return $model->rate;
                    }
                }
            ],
            'totalmoney',
            [
                'attribute'=>'lkey',
                'value'=>function($model)use ($partner){
                    if (!$model->lkey ){
                        return $partner?'默认Key：'. $partner->lkey : '未填写';
                    }else{
                        return $model->lkey;
                    }
                }
            ],
            [
                'attribute'=>'pkey',
                'value'=>function($model)use ($partner){
                    if (!$model->pkey  ){
                        return $partner?'默认Key：'. $partner->pkey : '未填写';
                    }else{
                        return $model->pkey;
                    }
                }
            ],
            [
                'attribute'=>'auto_server',
                'value'=>function($model){
                        return $model->auto_server ==PartnerGame::AUTO_ACTIVE?'自动':
                            $model->auto_server ==PartnerGame::AUTO_DISABLE?'手动':'停服禁用';
                }
            ],
            'create_time',
            'up_time',
            'url_web:url',
            'url_pay:url',
            'url_fcm:url',
            'url_bbs:url',
            'url_kefu:url',
            'url_client:url',
        ],
    ]) ?>

</div>
