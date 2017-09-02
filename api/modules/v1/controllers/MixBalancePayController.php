<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/1
 * Time: 17:24
 */

namespace api\modules\v1\controllers;

use api\models\Game;
use api\models\PartnerGame;
use api\models\PartnerServer;
use api\models\PartnerUser;
use api\models\Server;
use common\core\Controller;
use Yii;

class MixBalancePayController extends Controller
{
    public $errMsg = '';//错误提示详情，在返回JSON.msg 的后面追加
    public $errorIndex = [
        1 => '验证PID失败',
        2 => '接口的验证',
        3 => '用户名非法',
        4 => '获取用户信息失败',
        5 => '用户已被锁定',
        6 => '没有游戏运营权限',
        7 => '游戏已关闭',
        8 => '没有此游戏，或游戏已删除',
        9 => '区服编号不存在',
        10 => '区服不存在或已删除',
        11 => '未开服',
        12 => '接口加载失败',
        13 => '接口内部错误',
        14 => '签名错误',
        15 => '时间戳认证失败',
        16 => '区服已被禁止接入',
    ];

    public function actionIndex($pid, $uid, $gid, $sid, $orderid, $money, $gold, $time, $sign)
    {
        /**验证PID**/
        $pid = abs((int)$pid);
        $partner = PartnerUser::findMix($pid);
        if (empty($partner) || $partner->status == PartnerUser::STATUS_DISABLE)
            return 1;
        /**手否具有访问该接口的验证**/
        $check = $partner->checkIpAndAccess(Yii::$app->request->getUserIP(), Yii::$app->request->pathInfo);
        if ($check['status'] == false) {
            $this->errMsg = $check['msg'];
            return 2;
        };
        if (Yii::$app->request->getUserIP() !== '127.0.0.1') { //本地不验证签名和时间戳
            /**验证时间戳，前后不超过十分钟**/
            if (!is_numeric($time) || $time + 600 < time() || $time - 600 > time())
                return 3;
            /**验证sign**/
            if (md5($uid . $pid . $gid . $sid . $orderid . $money . $gold . $time . $partner->pkey) !== $sign)
                return 4;
        }

        /**验证gid**/
        $partnerGame = PartnerGame::findOne(['partnerid' => $partner->id, 'gkey' => $gid]);

        if (empty($partnerGame))
            return 5;/*没有游戏运营权限*/
        if ($partnerGame->status == PartnerGame::STATUS_DISABLE)
            return 6;//游戏已关闭

        $game = Game::findOne($partnerGame->gid);/*本站游戏开关状态不在此验证，关闭混服游戏，需要更改PartnerGame，以便单独控制*/
        if (empty($game))
            return 7;/*没有此游戏，或游戏已删除*/

        /*验证sid，先验证partnerServer数据，根据此数据找真正的(本站)区服sid，*/
        $partnerServer = PartnerServer::findOne(['gid' => $partnerGame->gid, 'pserverid' => $sid]);
        if (!$partnerServer)
            return 8;//区服编号不存在
        if ($partnerServer->status != PartnerServer::STATUS_ACTIVE)
            return 9;//区服已被禁止充值

        /**验证sid对应本站Server数据**/
        $server = Server::findOne($partnerServer->sid);
        if (empty($server))
            return 10;//区服不存在或已删除

        $test_accounts = explode(',', $partner->test_account);
        if ($server->start_time > time() && !in_array($uid, $test_accounts))
            return 11;//未开服


    }
}