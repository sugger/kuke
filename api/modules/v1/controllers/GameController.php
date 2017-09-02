<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/7
 * Time: 11:18
 */

namespace api\modules\v1\controllers;

use api\models\Game;
use api\models\User;
use yii\web\Controller;

class GameController extends Controller
{
    /**
     * @param $order \api\models\Order;
     * 游戏充值 入口
     */
    public static function GamePay($order)
    {
        if ($order->pay_status != 1 or $order->pay_time = 0) return false;
        $game = $order->getGame();
        $server = $order->getServer();
        if (!$game || !$server) return false;
        /**调用接口，获取游戏URL*/
        $gameconf = json_decode($game->game_conf, true);
        $info['appid'] = $server->cp_gameid ? $server->cp_gameid : $gameconf['game_id'];
        $info['serverid'] = $server->cp_sid ? $server->cp_sid : $server->serverid;
        $info['url'] = $gameconf['game_payurl'];
        $info['key'] = $gameconf['game_paykey'];
        $info['payto'] = $game->payto;
        $info['gid'] = $order->gameid;
        unset($gameconf);
        $apitag = "api\\models\\game\\" . ucfirst($game->game_api);
        $gameapi = $apitag::GamePay($info, $order);
        $log = "URL:{$gameapi['url']}\tPargam:{$gameapi['pargam']}\tResponse:{$gameapi['response']}\tMsg:{$gameapi['msg']}\r\n";
        PublicController::Log('游戏接口访问日志', $log, $gameapi['status'] ? '' : '_err');
        return $gameapi['status'];
    }

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
        $user = User::findByUsername('kukejs');
        echo '<pre>';
        var_dump($user);
        $user->score += 10;
        var_dump($user);
        var_dump($user->save(false));
        var_dump($user);
        var_dump($user->isAttributeChanged('score'));
        die;
    }
}