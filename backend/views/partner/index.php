<?php
use common\core\ActiveForm;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\PartnerUserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$this->title = '合作账户';
$this->params['breadcrumbs'][] = $this->title;
?>



<div class="partner-user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php  //echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加', ['create'], ['class' => 'btn btn-success']) ?>
        <?=Html::a('禁用',['disable'],['class'=>'btn green ajax-post confirm','target-form'=>'ids'])?>
        <?=Html::a('启用',['enable'],['class'=>'btn green ajax-post confirm','target-form'=>'ids'])?>
    </p>
    <?php ActiveForm::begin([
        'options'=>[
            'class'=>"ids",
            'enctype'=>"multipart/form-data",
        ],
    ])?>
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
            ]
            ,
            [
                'label' => 'PID',
                'attribute' => 'id',
                'options' => ['width' => '50px;'],
            ],
            [
                'label' => '用户名',
                'attribute' => 'username',
            ],
//            'parentid',
            ['label' => '域名','attribute' => 'domain'],
//            'password',
            [
                'label' => '账户类型',
                'attribute' => 'type',
                'value' => function($model,$key,$index,$column){
                    switch ($model->type){
                        case 1:
                            return "混服";
                            break;
                        case 2:
                            return "CPS";
                            break;
                        case 3:
                            return "广告";
                            break;
                        case 4:
                            return "混服子账号";
                            break;
                        default:
                            return "未知";
                        break;
                    }
                }
            ],
            // 'bankaccount',
            // 'realname',
            // 'number_id',
            // 'remark',
//             'register_time:datetime',
//             'lastlogin_time:datetime',
//             'lastlogin_ip',
            // 'available_money',
             ['label' => '预付费额度','attribute' => 'money'],
             ['label' => '默认付费比例','attribute' => 'rate'],
//             'lkey',
//             'pkey',

             ['label' => '累计充值','attribute' => 'totalmoney'],
             ['label' => '所属专员','attribute'  => 'admin_username'],
             [
                'label' => '账户状态',
                'attribute' => 'status',
                'format' => 'html',
                'filter' => Html::activeDropDownList($searchModel,'status',['0'=>"锁定",'1'=>"正常"],['prompt'=>'全部']),
                'value' => function($model){
                     return $model['status'] ?
                         Html::tag('span','正常',['class'=>'badge badge-success']) :
                         Html::tag('span','锁定',['class'=>'badge badge-important']);
                 }
             ],
            // 'pay_tag',
            // 'tel',
            // 'email:email',
            // 'qq',
            // 'test_account',
            // 'api_ip:ntext',
            // 'callback',
            // 'notify',

            [
                'header' => '操作',
                'class' => 'yii\grid\ActionColumn',
                'options' => ['width' => '80px;'],
                'template' => '{view} {update} {addsub} ',
                'buttons' => [
                    'addsub' => function ($url, $model, $key) {
                        return Html::a('<i class="fa fa-edit"></i>', ['partner-game/create', 'pid'=>$model['id']], [
                            'title' => Yii::t('app', '添加'),
                            'class' => 'btn btn-xs purple'
                        ]);
                    },
                ]
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?>
    <?php ActiveForm::end(); ?>
</div>
<!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
jQuery(document).ready(function() {
highlight_subnav('partner/index'); //子导航高亮
});
<?php $this->endBlock() ?>
<!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>
