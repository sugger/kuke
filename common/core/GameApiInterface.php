<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/15
 * Time: 10:50
 */

namespace common\core;


interface GameApiInterface
{
    /**
     * 获取登录地址
     * @param $info['user']
     * @param $info['game']
     * @param $info['sid']
     * @param $info['key']
     * @param $info['client']
     * @return mixed
     */
    public static function LoginUrl($info);
    /**
     * 充值到游戏
     * @param $info['user']
     * @param $info['game']
     * @param $info['sid']
     * @param $info['rate'] int 充值比例
     * @param $info['sid']
     * @param $info['key']
     * @param $order object
     * @return mixed
     */
    public static function GamePay($info,$order);
    /**
     * 查询角色
     * @param $info['user']
     * @param $info['game']
     * @param $info['sid']
     * @param $info['key']
     * @return mixed
     */
    public static function GetRole($info);

}