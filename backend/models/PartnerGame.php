<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/25
 * Time: 15:18
 */

namespace backend\models;


class PartnerGame extends \common\models\PartnerGame
{
    public function getPartnerUser(){
        $PartnerUser=PartnerUser::findOne($this->partnerid);
//        var_dump($games);
        return $PartnerUser;
    }
    public function getGamename(){
        $game=Game::findOne($this->gid);
        return $game->name;
    }
}