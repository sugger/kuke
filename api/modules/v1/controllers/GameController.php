<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:18
 */

namespace api\modules\v1\controllers;

use api\controllers\BaseController;
use api\models\Game;
class GameController extends BaseController
{
    public function actionGet(){
        $where=['gid'=>95];
        return Game::getNotexit($where);
    }

    /**
     * @return string
     */
    public function actionIndex()
    {
        echo "asdjlasd";
    }
}