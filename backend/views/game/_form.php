<?php

use yii\helpers\Html;
use common\core\ActiveForm;
use common\helpers\ArrayHelper;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model backend\models\Article */
/* @var $form common\core\ActiveForm */
?>

<?php $form = ActiveForm::begin([
    'options'=>[
        'class'=>"form-aaa ",
        'enctype'=>"multipart/form-data",
    ]
]);?>
<?=$form->field($model, 'gametype')->selectList(
    \common\models\GameType::find()->asArray()->all(),
    ['class'=>'form-control c-md-2'])->label('类型'); ?>

<?=$form->field($model, 'name')->textInput(['class'=>'form-control c-md-2'])->label('游戏名称')->hint('英文标识，只允许含有:英文、数字和中划线');?>

<!-- 单图 -->
<?$form->field($model, 'pic')->widget('\common\widgets\images\Images',[
    //'type' => \backend\widgets\images\Images::TYPE_IMAGE, // 单图
    'saveDB'=>1, //图片是否保存到picture表，默认不保存
],['class'=>'c-md-12'])->label('封面图片')->hint('单图图片尺寸为：300*300');?>

<?=$form->field($model, 'content')->textarea(['class'=>'form-control c-md-4', 'rows'=>3])->label('游戏简介')->hint('游戏简介') ?>


<?=$form->field($model, 'sort')->textInput(['class'=>'form-control c-md-1'])->label('排序值')->hint('排序值越小越前')?>

<?=$form->field($model, 'isdisplay')->radioList(['1'=>'正常','0'=>'隐藏'])->label('显示状态') ?>
<?=$form->field($model, 'isopen')->radioList(['1'=>'正常','0'=>'隐藏'])->label('开启状态') ?>
<div class="form-actions">
    <?= Html::submitButton('<i class="icon-ok"></i> 确定', ['class' => 'btn blue ajax-post','target-form'=>'form-aaa']) ?>
    <?= Html::button('取消', ['class' => 'btn']) ?>
</div>

<?php ActiveForm::end(); ?>

