<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/25
 * Time: 15:22
 */

namespace backend\models;


class PartnerServer extends \common\models\PartnerServer
{
    public function getPartnerUser(){
        $PartnerUser=PartnerUser::findOne($this->pid);
//        var_dump($games);
        return $PartnerUser;
    }
    public function getGamename(){
        return $this->getGame()->name;
    }
    public function getGame(){
        $game=Game::findOne($this->gid);
        return $game;
    }
    public function getServername(){
        return $this->getServer()->servername;
    }
    public function getServer(){
        $game=Server::findOne($this->sid);
        return $game;
    }
}