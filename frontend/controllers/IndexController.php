<?php

namespace frontend\controllers;
use api\controllers\BaseController;
class IndexController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

}
