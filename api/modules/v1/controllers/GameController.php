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
        $game=$this->getGameById(95);

    }
    private function getGameById($id){
        $game=Game::findOne(['id'=>$id]);
        if (empty($game)){
            $mode=new Game();
            $where=['gid'=>$id];
            $json= Game::getNotexit($where);
            $mode->load(['Game'=>$json]);
            $mode->save();
            return $mode;
        }
        return $game;
    }
    /**
     * @return string
     */
    public function actionIndex()
    {
        echo "asdjlasd";
    }
}