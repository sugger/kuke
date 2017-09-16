<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
\backend\assets\TablesAsset::register($this);
/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* @var $this yii\web\View */
/* @var $model partner\models\PartnerUser */
/* @var $form yii\widgets\ActiveForm */
/* 加载页面级别资源 */
$this->title = '预付费充值:';
$this->params['breadcrumbs'][] = ['label' => '预付费充值'];
$this->params['breadcrumbs'][] = '预付费充值';
$this->beginPage();
$paytype=Yii::$app->params['payType'];
?>


<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title><?= Html::encode($this->title) ?> | Yii2通用后台 by huanglongfei.cn</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <?php $this->head() ?>
    <link rel="shortcut icon" href="<?=Yii::getAlias('@web/favicon.ico')?>" />
    <script language="JavaScript">
        var BaseUrl = '<?=Yii::getAlias('@web')?>';
    </script>
</head>



<!-- END HEAD -->

<body style="background-color: oldlace" class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">
<?php $this->beginBody() ?>



<div class="partner-user-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <!-- 表单操作ajax弹出提示 -->
    <style>
        .fixed{position: fixed!important;}
        .alert{color: #364150;font-weight: bold;border: 1px solid #364150;background-color: #364150;}
        #top-alert {display: block;z-index: 9999;margin-top: 20px;padding-top: 12px;padding-bottom: 12px;overflow: hidden;font-size: 16px;}
        .alert-error {color: white;border-color: #eed3d7;background-color: #FFF;}
        .alert-success {color: #468847;background-color: #CCFF99;border-color: #364150;}
        @media only screen and (max-width: 250px) {.alert-content {left:35%; right: 35%;}}
        @media only screen and (min-width: 245px) {.alert-content {left:35%; right: 35%;}}
        .alert_left{
            position: relative;
            left: 50%;
            top:50%;
            transform: translate(-50%,-50%);
        }
    </style>
    <div id="top-alert" class="fixed alert alert-error alert_left" style="display: none;">
        <button class="close" style="margin-top:6px;">&times;</button>
        <div class="alert-content"><img id="code_img"></div>
    </div>
    <div class="partner-user-form">

        <?php $form = ActiveForm::begin(
            ['options' => ['onSubmit'=>'pay.submitform();return false;']]
        ); ?>

        <?= $form->field($model, 'order_sn')->hiddenInput()->label('订单号：'.$model->order_sn) ?>
        <?= $form->field($model, 'money')->input('number') ?>
        <div class="form-group field-order-pay_source">
            <label class="control-label" for="order-pay_channel">帐号</label>
            <input type="text" id="order-channel" class="form-control" name="Order[channel]">

            <div class="help-block"></div>
        </div>

        <?= $form->field($model, 'pay_type')
            ->dropDownList(\common\helpers\ArrayHelper::map($paytype,'id','name'))
            ->label('付款方式');
        ?>
        <?= $form->field($model, 'pay_source')->textInput() ?>
        <div class="form-group">
            <?= Html::submitButton('充值', ['class' =>'btn btn-success'  ]) ?>
        </div>
        <?php ActiveForm::end(); ?>

    </div>


<?php \partner\assets\LayoutAsset::register($this); ?>
<?php $this->endBody() ?>
<!-- 定义数据块 -->
<?php $this->beginBlock('submit');?>

    var pay = {
        paytype : <?= json_encode(\common\helpers\ArrayHelper::map($paytype,'id','type'))?>,
        submitform : function(){

            pay_type=$('#order-pay_type').val();
            if(!pay_type) {
                alert("充值方式不能为空"+pay_type);
                return ;
            }
            api=this.paytype[pay_type]
            if(!api){
                alert("该方式充值配置错误")
                return ;
            }
            this[api]()
        },
        webApi:function(){
            form=$('#w0');
            _this=this
            $.ajax({
                type:form.attr('method'),
                dataType:'json',
                url:form.attr('action'),
                data:form.serialize(),
                success:function (result) {
                    console.log(result)
                    if(result.status===200){
                        $('#code_img').attr('src',result.code_img_url)
                        $('#top-alert').show();
                        _this.checkOrder($('#order-order_sn').val())
                    }
                },
                error: function(data) {
                    alert("error:"+data.responseText);
                }
            });

        },
        checkOrder:function(orderid){


        }

    }


<?php $this->endBlock()?>

<!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['submit'], \yii\web\View::POS_END); ?>

<!-- END PAGE LEVEL PLUGINS -->
</body>

</html>
<?php $this->endPage() ?>





