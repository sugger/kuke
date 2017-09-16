<?php

use yii\helpers\Html;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model partner\models\Article */
/* @var $form common\core\ActiveForm */
?>

<?php $form = ActiveForm::begin([
    'options'=>[
        'class'=>"form-aaa ",
        'enctype'=>"multipart/form-data",
    ],
]);
?>
<?=$form->field($model, 'gametype')->selectList(
    Yii::$app->params['config_gametype'],
    ['class'=>'form-control c-md-2'])->label('平台类型'); ?>
<?=$form->field($model, 'gamestyle')->selectList(
    ArrayHelper::map(\common\models\GameType::find()->asArray()->all(),'id','name'),
    ['class'=>'form-control c-md-2'])->label('战斗类型'); ?>

<?=$form->field($model, 'name')->textInput(['class'=>'form-control c-md-2','placeholder' => '游戏名称'])->label('游戏名称') ?>
<?=$form->field($model,'game_starttime')->widget(
    '\kartik\datetime\DateTimePicker',
    [
        'type' => \kartik\datetime\DateTimePicker::TYPE_INPUT,
        'language' => 'zh-CN',
        'value' => $model->game_starttime,
        'options' =>  ['class'=>'form-control c-md-6','placeholder' => '开始时间'],
        'pluginOptions' => [
            'autoclose'=>true,
            'format' => 'yyyy-mm-dd hh:ii:ss'
        ]
    ]
);?>
<!-- 单图 -->
<?=$form->field($model, 'pic')->widget('\common\widgets\images\Images',[
    //'type' => \partner\widgets\images\Images::TYPE_IMAGE, // 单图
    'saveDB'=>1, //图片是否保存到picture表，默认不保存
],['class'=>'c-md-12'])->label('封面图片')->hint('单图图片尺寸为：300*300');?>

<?=$form->field($model,'payto')->input('number',['class'=>'form-control c-md-2','placeholder' => '游戏币兑换比例'])->label('游戏币兑换比例')->hint('游戏币兑换比例') ?>
<?=$form->field($model,'short')->textInput(['class'=>'form-control c-md-2','placeholder' => '简写'])->label('简写')->hint('简写') ?>
<?=$form->field($model, 'content')->textarea(['class'=>'form-control c-md-4', 'rows'=>3])->label('游戏简介')->hint('游戏简介') ?>
<?=$form->field($model, 'game_web')->textInput(['class'=>'form-control c-md-4'])->label('游戏官网')->hint('游戏官网') ?>
<?=$form->field($model, 'game_bbs')->textInput(['class'=>'form-control c-md-4'])->label('游戏论坛')->hint('游戏论坛') ?>
<?=$form->field($model,'currency')->textInput(['class'=>'form-control c-md-2','placeholder' => '游戏币单位'])->label('游戏币单位')->hint('游戏币兑换比例') ?>
<?=$form->field($model,'game_api')->textInput(['class'=>'form-control c-md-2','placeholder' => '接口文件名'])->label('接口文件名')->hint('接口文件名') ?>
<?=$form->field($model,'game_hit')->input('number',['class'=>'form-control c-md-2','placeholder' => '点击量'])->label('点击量')->hint('点击量') ?>
<?=$form->field($model,'game_players')->input('number',['class'=>'form-control c-md-2','placeholder' => '玩家数量'])->label('玩家数量')->hint('玩家数量') ?>
<?=$form->field($model, 'qq')->textarea(['class'=>'form-control c-md-4', 'rows'=>3])->label('客服QQ')->hint('多条数据以,隔开') ?>
<?=$form->field($model, 'desc1')->textarea(['class'=>'form-control c-md-4', 'rows'=>3])->label('描述')->hint('描述') ?>
<?=$form->field($model, 'game_conf')->textarea(['class'=>'form-control c-md-4', 'rows'=>5])->label('接口配置参数')->hint('JSON格式{key:111,key1:222}') ?>
<?=$form->field($model, 'remarks')->textarea(['class'=>'form-control c-md-4', 'rows'=>5])->label('停服备注')->hint('JSON格式{key:111,key1:222}') ?>

<?=$form->field($model, 'sort')->textInput(['class'=>'form-control c-md-1'])->label('排序值')->hint('排序值越小越前')?>
<?=$form->field($model, 'ishot')->radioList(['1'=>'推荐','0'=>'不推荐'])->label('推荐状态') ?>
<?=$form->field($model, 'isdisplay')->radioList(['1'=>'正常','0'=>'隐藏'])->label('显示状态') ?>
<?=$form->field($model, 'isopen')->radioList(['1'=>'开启','0'=>'关闭'])->label('开启状态') ?>
<?=$form->field($model, 'lander')->textInput(['class'=>'form-control c-md-5','placeholder' => '微端下载地址'])->label('微端下载地址{需要填写协议；http(s)://}') ?>
<div class="form-actions">
    <?= Html::submitButton('<i class="icon-ok"></i> 确定', ['class' => 'btn blue ','target-form'=>'form-aaa']) ?>
    <?= Html::button('取消', ['class' => 'btn']) ?>
</div>

<?php ActiveForm::end(); ?>

