<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:19
 */

namespace api\controllers;


use api\controllers\BaseController;

class CardController extends BaseController
{
    /*
     * type/gid 查询
     */
    public function actionList(){

    }

    /**
     * 卡类详情
     */
    public function actionDetails(){

    }

    /**
     * 领取记录
     */
    public static function History(){

    }

    /**
     * 领取卡片
     */
    public static function GetCard($user,$cid){

        $cardnum=self::Card($cid);
        if ($cardnum){
            self::CardLog($user,$cid,$cardnum);//日志
            return self::response($cardnum?200:14001,['user'=>$user,'cardid'=>$cid,'card'=>$cardnum]);
        }

    }

    /**
     * @param $user
     * @param $cid
     * @param $cardnum
     * 添加领取新手卡日志
     */
    private static function CardLog($user,$cid,$cardnum){

    }
    private static function Card($cid){
        return '';
    }
}