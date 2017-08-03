<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use common\core\ActiveForm;
/**@var $this \yii\web\View **/
/* @var $model backend\models\Menu */
/* @var $form ActiveForm */
$this->title=($this->context->action->id =='add'?'添加' : '编辑') . '服务器';
?>


<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption font-red-sunglo">
            <i class="icon-settings font-red-sunglo"></i>
            <span class="caption-subject bold uppercase"> 内容信息</span>
        </div>
        <div class="actions">
            <div class="btn-group">
                <?= Html::button('返回', ['class' => 'btn green','style'=>'margin-right:10px;','onclick'=>'JavaScript:history.go(-1)']) ?>
                <a class="btn btn-sm green dropdown-toggle" href="javascript:;" data-toggle="dropdown"> 工具箱
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="javascript:;"><i class="fa fa-pencil"></i> 导出Excel </a></li>
                    <li class="divider"> </li>
                    <li><a href="javascript:;"> 其他 </a></li>
                </ul>
            </div>
        </div>
    </div>

    <!--Form表单-->
    <div class="portlet-body form">
        <?php $form=ActiveForm::begin(); ?>
        <?=$form->field($model,'gid')->dropDownList(ArrayHelper::map(
            \backend\models\search\GameSearch::find()->andFilterWhere(['is_del'=>0])->asArray()->all(),
            'id','name'
        ),['class'=>'form-control c-md-3'] ) ?>
        <?=$form->field($model,'servername')->textInput(['class'=>'form-control c-md-3'])->hint('必填'); ?>
        <?=$form->field($model,'sid')->input('number',['class'=>'form-control c-md-3'])->hint('必填'); ?>
        <?=$form->field($model,'cp_gameid')->textInput(['class'=>'form-control c-md-3'])?>
        <?=$form->field($model,'cp_sid')->textInput(['class'=>'form-control c-md-3'])->hint('必填')?>

        <?=$form->field($model,'start_time_date')->widget(
            '\kartik\datetime\DateTimePicker',
            [
                'type' => \kartik\datetime\DateTimePicker::TYPE_INPUT,
                'language' => 'zh-CN',
                'value' => date('Y-m-d H:i:s',$model->start_time),
                'options' =>  ['class'=>'form-control c-md-9','placeholder' => '开服时间'],
                'pluginOptions' => [
                    'autoclose'=>true,
                    'format' => 'yyyy-mm-dd hh:ii:00',
                    'todayHighlight' => true
                ]
            ]
        )->label('开服时间')->hint('必填');?>
        <?=$form->field($model,'is_display')->dropDownList([1=>'显示',0=>'隐藏'],['class'=>'form-control c-md-3'])?>
        <?=$form->field($model,'status')->dropDownList([1=>'推荐',0=>'不推荐'],['class'=>'form-control c-md-3'])?>
        <?=$form->field($model,'isstop')->dropDownList(['开启','关闭'],['class'=>'form-control c-md-3'])?>

        <?=$form->field($model,'stop_notice')->textarea(['class'=>'form-control c-md-5','rows'=>3])?>
        <?=$form->field($model,'content')->textarea(['class'=>'form-control c-md-5','rows'=>3])?>


        <div class="form-actions">
            <?= Html::submitButton('<i class="icon-ok">确定</i> ', ['class' => 'btn blue ','target-form'=>'form-aaa']) ?>
            <?= Html::button('取消', ['class' => 'btn','onclick'=>'JavaScript:history.go(-1)']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
