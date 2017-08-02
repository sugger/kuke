<?php
use yii\grid\GridView;
use yii\helpers\Html;
/* ===========================以下为本页配置信息================================= */
/* 页面基本属性 */
$this->title = '游戏管理';
$this->params['title_sub'] = '';  // 在\yii\base\View中有$params这个可以在视图模板中共享的参数

/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);
$columns=[
    [
        'class'=>\common\core\CheckboxColumn::className(),
        'name'  => 'id',
        'options' => ['width' => '20px;'],
        'checkboxOptions' => function ($model, $key, $index, $column) {
            return ['value' => $key,'label'=>'<span></span>','labelOptions'=>['class' =>'mt-checkbox mt-checkbox-outline','style'=>'padding-left:19px;']];
        }
    ], [
        'options' => ['width' => '150px;'],
        'attribute' => 'id',
    ], [
        'options' => ['width' => '150px;'],
        'attribute' => 'gid',
    ],[
        'options' => ['width' => '150px;'],
        'attribute' => 'servername',
    ],[
        'options' => ['width' => '150px;'],
        'attribute' => 'player_num',
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'start_time',
        'format' => ['date', 'php:Y-m-d H:i:s'],
        'filter'=>\kartik\date\DatePicker::widget([
            'type' => \kartik\date\DatePicker::TYPE_RANGE,
            'language' => 'zh-CN',
            'layout' => '{input1}<br>{input2}',
            'name' => 'OrderSearch[from_date]',
            'value' => $searchModel->from_date,
            'options' =>  ['class'=>'form-control','placeholder' => '开始时间'],
            'name2' => 'OrderSearch[to_date]',
            'value2' => $searchModel->to_date,
            'options2' => ['class'=>'form-control','placeholder' => '结束时间'],
            'pluginOptions' => [
                'autoclose'=>false,
                'format' => 'yyyy-mm-dd'
            ]
        ])
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'add_time',
        'format' => ['date', 'php:Y-m-d H:i:s'],
        'filter'=>false
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'up_time',
        'format' => ['date', 'php:Y-m-d H:i:s'],
        'filter'=>false
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'is_display',
        'value'=>function($data){
            return $data->is_display?'显示':'隐藏';
        },
        'filter'=>Html::activeDropDownList($searchModel,'is_display',
            ['1'=>'显示', '0'=>'隐藏'],
            ['prompt'=>'全部','class'=>'form-control']
        )
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'status',
        'value'=>function($data){
            return $data->status?'推荐':'不推荐';
        },
        'filter'=>Html::activeDropDownList($searchModel,'status',
            ['1'=>'推荐', '0'=>'不推荐'],
            ['prompt'=>'全部','class'=>'form-control']
        )
    ],[
        'options' => ['width' => '100px;'],
        'attribute' => 'isstop',
        'value'=>function($data){
            return $data->isstop?'停服':'不停服';
        },
        'filter'=>Html::activeDropDownList($searchModel,'isstop',
            ['1'=>'停服', '0'=>'不停服'],
            ['prompt'=>'全部','class'=>'form-control']
            )
    ],[
        'class' => 'yii\grid\ActionColumn',
        'header' => '操作',
        'template' => '{edit} {delete}',
        'options' => ['width' => '200px;'],
        'buttons' => [
            'edit' => function ($url, $model, $key) {
                return Html::a('<i class="fa fa-edit"></i>', $url, [
                    'title' => Yii::t('app', '编辑'),
                    'class' => 'btn btn-xs purple'
                ]);
            },
            'delete' => function ($url, $model, $key) {
                return Html::a('<i class="fa fa-times"></i>', $url, [
                    'title' => Yii::t('app', '删除'),
                    'class' => 'btn btn-xs red ajax-get confirm'
                ]);
            },
        ],
    ]
];
?>
<div class="portlet light portlet-fit portlet-datatable bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-settings font-dark"></i>
            <span class="caption-subject font-dark sbold uppercase">管理信息</span>
        </div>
        <div class="actions">
            <div class="btn-group btn-group-devided">
                <?=Html::a('清空搜索 <i class="fa fa-times"></i>',['index'],['class'=>'btn green','style'=>'margin-right:10px;'])?>
                <?=Html::a('添加 <i class="fa fa-plus"></i>',['add'],['class'=>'btn green','style'=>'margin-right:10px;'])?>
                <?=Html::a('删除 <i class="fa fa-times"></i>',['delete'],['class'=>'btn green ajax-post confirm','target-form'=>'ids','style'=>'margin-right:10px;'])?>
            </div>
            <div class="btn-group">
                <button class="btn blue btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
                    工具箱
                    <i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="javascript:;"><i class="fa fa-pencil"></i> 导出Excel </a></li>
                    <li class="divider"> </li>
                    <li><a href="javascript:;"> 其他 </a></li>
                </ul>
            </div>
        </div>
    </div>
<!--    数据表格开始-->
    <div class="portlet-body">
        <?php \yii\widgets\Pjax::begin(['options'=>['id'=>'pjax-container']]); ?>
            <div class="table-container">
                <?= GridView::widget([
                    'dataProvider' => $dataProvider, // 列表数据
                    'filterModel' => $searchModel, // 搜索模型
                    'options' => ['class' => 'grid-view table-scrollable'],
                    /* 表格配置 */
                    'tableOptions' => ['class' => 'table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer'],
                    /* 重新排版 摘要、表格、分页 */
                    'layout' => '{items}<div class=""><div class="col-md-5 col-sm-5">{summary}</div><div class="col-md-7 col-sm-7"><div class="dataTables_paginate paging_bootstrap_full_number" style="text-align:right;">{pager}</div></div></div>',
                    /* 配置摘要 */
                    'summaryOptions' => ['class' => 'pagination'],
                    /* 配置分页样式 */
                    'pager' => [
                        'options' => ['class'=>'pagination','style'=>'visibility: visible;'],
                        'nextPageLabel' => '下一页',
                        'prevPageLabel' => '上一页',
                        'firstPageLabel' => '第一页',
                        'lastPageLabel' => '最后页'
                    ],
                    /* 定义列表格式 */
                    'columns' => $columns,
                ]);
                ?>
            </div>
        <?php \yii\widgets\Pjax::end(); ?>
    </div>
</div>
