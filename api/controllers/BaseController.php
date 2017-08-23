<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 10:44
 */

namespace api\controllers;

use yii\rest\Controller;

class BaseController extends Controller
{
    public static function response($code = 0, $data = [])
    {
        return [
            'status' => 200,
            'code' => $code,
            'data' => (object)$data,
        ];
    }
}