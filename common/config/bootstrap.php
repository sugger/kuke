<?php
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('@backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('@apiUrl', dirname(dirname(__DIR__)) .'/'); //API的url
Yii::setAlias('@api', dirname(dirname(__DIR__)) . '/api'); //API的path
Yii::setAlias('@partner', dirname(dirname(__DIR__)) . '/partner'); //API的path