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
        $game = $this->getGameById(96);

    }

    public static function getGameById($id)
    {
        $game = Game::findOne(['id' => $id, 'is_del' => Game::DEL_NO]);
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