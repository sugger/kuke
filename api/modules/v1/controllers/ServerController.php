<?php

namespace api\modules\v1\controllers;
use api\controllers\BaseController;
use api\models\Game;
use api\models\GameLogin;
use api\models\GameRole;
use api\models\Server;
use Yii;

class ServerController extends BaseController
{

    public static function Play(){
        //todo
        $userinfo=Yii::$app->user->getIdentity();
        if (!$userinfo) static::response(13001);
        $gid=Yii::$app->request->get('gid');
        $sid=Yii::$app->request->get('sid');
        $serverid=Yii::$app->request->get('serverid');
        if (empty($gid)){
            if (!$sid) return static::response(13002);
            $server=Server::findOne(['sid'=>$sid,'is_del'=>Server::DEL_NO]);
            $gid=$server->gid;
        }
        if (!empty($serverid)){
            $data=static::getServer($gid,$serverid );
            $sid=$data->sid;
        }
        if (empty($sid)){
            if (!$gid) return static::response(13003);
            $server=Server::find()->where ("gid = :gid and is_del = :is_del and start_time < :now" ,
                [':gid'=>$gid ,':is_del'=>Server::DEL_NO,':now'=>time() ])->orderBy('start_time desc')->one();

        }
        if (!isset($server))
            $server = static::getServerBySid($sid);
        $gid = $server->gid;
        $game = GameController::getGameById($gid);
        $gameapi=['status'=>0,'error'=>'游戏或区服已关闭'];
        if (empty($server)||empty($game)) self::response(13004);
        if ($game->isopen == Game::OPEN_YES && $server->isstop == Server::STOP_NO && $server->is_del == Server::DEL_NO) {
            //可以进入游戏
            $gameconf=json_decode($game->game_conf,true);
            $info['uid'] = $userinfo->getId();
            $info['username'] = $userinfo['username'];
            $info['appid'] =$server->cp_gameid?$server->cp_gameid:$gameconf['game_id'];
            $info['serverid'] = $server->cp_sid ? $server->cp_sid : $server->serverid;
            $info['url'] = $gameconf['game_url'];
            $info['key'] = $gameconf['game_key'];
            $info['client'] = Yii::$app->request->get('client') ? '1':'0';
            $info['game_conf'] = $game->game_conf;
            $info['gid'] = $gid;
            unset($gameconf);
            $gameapi=self::GameUrl($info,ucfirst($game->game_api));
        }
        //更新记录
        if ($gameapi['status']==1)
            $log=static::GameLog($gid,$sid);



        return static::response($gameapi['status']==1?200:13005,[
            'sid'=>$server->sid,
            'serverid'=>$server->serverid,
            'servername'=>$server->servername,
            'player_num'=>$server->player_num,
            'start_time'=>$server->start_time,
            'stop_notice'=>$server->stop_notice,
            'server_img'=>$server->server_img,
            'isstop'=>$server->isstop,
            'content'=>$server->content,
            'tuijian'=>$server->status,
            'reg_time'=>$log?$log:time(),
            'play'=>$gameapi['url']
        ]);
    }

    /**
     * @param $gid
     * @param $serverid
     * @return Server|static
     * 获取区服实例 没有指定ID从酷客玩获取
     */
    public static function getServer($gid, $serverid)
    {
        $server = Server::findOne(['gid' => $gid, 'serverid' => $serverid]);
        if (empty($server)) {
            $model = new Server();
            $where = ['gid' => $gid, 'serverid' => $serverid];
            $json = Server::getNotexit($where);
            $model->load(['Server' => $json]);
            $model->save();
            return $model;
        }
        return $server;
    }

    /**
     * @param $gid
     * @param $sid
     * @return Server|static
     * 获取区服实例 没有指定ID从酷客玩获取
     */
    public static function getServerBySid($sid)
    {
        $server = Server::findOne(['sid' => $sid]);
        if (empty($server)) {
            $model = new Server();
            $where = ['sid' => $sid];
            $json = Server::getNotexit($where);
            $model->load(['Server' => $json]);
            $model->save();
            return $model;
        }
        return $server;
    }

    /**
     * @param $gid
     * @param $sid
     * @return bool|int|mixed
     * 记录登录日志
     */
    public static function GameLog($gid,$sid){
        $user=Yii::$app->user->identity;
        $todayLog=GameLogin::find()->where('`userid` = :uid and `gameid` = :gid and `sid` = :sid',
            [':uid' => $user->getId(),':gid' => $gid ,':sid' => $sid])->orderBy('id desc')->one();
        if ($todayLog) $reg_time=$todayLog->reg_time;
        if (empty($todayLog)||$todayLog->login_time < strtotime(date('Y-m-d 00:00:00'))) $todayLog = new GameLogin();
        $data['GameLogin']=[
            'userid'=>$user->getId() ,
            'gameid'=>$gid,
            'sid'=>$sid,
            'agent'=>$user->tuid,
            'login_time'=>(string)time(),
            'fromflag'=>$user->from_social
        ];
        if ($todayLog->isNewRecord) $data['GameLogin']['reg_time']=isset($reg_time)?$reg_time:time();
        if($todayLog->load($data) && $todayLog->save()){
            return $todayLog->reg_time;
        }
        return false;
    }

    /*
    * @var $tag api\models\game\Kuke;
    * @param $info['username']
    * @param $info['uid']
    * @param $info['appid'] 接口所需
    * @param $info['sid'] 区服ID
    * @param $info['url'] 至少指定url和game_conf中的一个
    * @param $info['key'] 至少指定key和game_conf中的一个
    * @param $info['client'] 默认web端
    * @param $tag 接口文件(类实例、全名、null) 为null必须指定gid
    * @param $info['game_conf']
    * @param $info['gid']
    */

    /**
     * @param $serverid 服务器ID
     */
    public static function MyGamerole($sid)
    {
        $sid = abs(intval($sid));
        $server = Server::findOne($sid);
        if (!$server) return self::response(13006);
        $role = static::GameRole(Yii::$app->user->identity, $server);//获取角色信息
        return static::response($role ? 200 : 13007, (array)$role);
    }

    /**
     * 返回角色数据，并更新数据库信息
     * @param $user \api\models\User;
     * @param $server \api\models\Server;
     */
    public static function GameRole($user,$server){
        $game=$server->game;
        if (empty($game)) return false;
        if ($game->isopen == Game::OPEN_YES && $server->isstop == Server::STOP_NO) {
            //可以进入游戏
            $gameconf = json_decode($game->game_conf, true);
            $info['uid'] = $user['uid'];
            $info['username'] = $user['username'];
            $info['appid'] = $server->cp_gameid ? $server->cp_gameid : $gameconf['game_id'];
            $info['sid'] = $server->cp_sid ? $server->cp_sid : $server->serverid;
            $info['url'] = $gameconf['game_url'];
            $info['key'] = $gameconf['game_key'];
            $info['game_conf'] = $game->game_conf;
            $info['gid'] = $game->id;
            unset($gameconf);
            $tag = ucfirst($game->game_api);
            if (!strstr("api\\models\\game\\", $tag)) $tag = "api\\models\\game\\" . $tag;
            $gameapi = $tag::GetRole($info);
            if ($gameapi['status'] == 1) {
                $log = static::WriteRoleLog([
                    'uid' => $user['uid'],
                    'sid' => $server->sid,
                    'gid' => $server->gid,
                    'from_social' => $user->from_social,
                ], $gameapi['data']);//有数据则写入角色日志记录
                return $gameapi['data'];
            }
        }
        return false;
    }

    /**
     * 更新写入角色信息
     * @param $user \api\models\User;
     * @param $role ;//多条数据为二维数组，一条数据为一维数组
     */
    private static function WriteRoleLog($base, $role)
    {
        if (isset($role[0])) { //定义设定了索引型数组 启用递归写入数据
            foreach ($role as $value) {
                if (is_array($value) && isset($value['role'])) static::WriteRoleLog($base, $value);
            }
            return;
        }
        $where = [
            'uid' => $base['uid'],
            'sid' => $base['sid'],
        ];
        if ($role['role']) {
            $where['role'] = $role['role'];
            $thisrole = GameRole::findOne($where);
            if (empty($thisrole)) $thisrole = new GameRole();
            /*更新数据时只更新拓展信息字段和等级字段*/
            $dbdata = $thisrole->isNewRecord ? [
                'uid' => $base['uid'],
                'sid' => $base['sid'],
                'gid' => $base['gid'],
                'role' => $role['role'],
                'roleid' => $role['roleid'] ? $role['roleid'] : '',
                'level' => $role['level'],
                'create_time' => date('Y-m-d H:i:s', isset($role['create_time']) ? $role['create_time'] : time()),
                'from_social' => $base['from_social'],
            ] : [
                'level' => $role['level'],
            ];
            unset($role['role'], $role['level'], $role['roleid'], $role['create_time']);
            $dbdata['extend'] = json_encode($role);
            return $thisrole->load(['GameRole' => $dbdata]) && $thisrole->save();

        }
    }

    public function actionIndex()
    {
        $map = [
            'username' => 'admin110',
            'sid' => 1,
            'gid' => 96,
            'appid' => 96,
            'game_conf' => '{"game_key":"0053f613878d33a60c37c62fef8ca0e7","game_url":"aa","game_paykey":"0053f613878d33a60c37c62fef8ca0e7","game_payurl":"aa","game_id":"95"}'
        ];
        $urldata = self::GameUrl($map, 'Kuke');
        var_dump($urldata);
//        return $this->response(200,['MSG'=>'服务器接口']);
    }

    public static function GameUrl($info, $tag = null)
    {
        if (is_object($tag)) return $tag->LoginUrl($info);
        elseif (is_string($tag)) { //tag游戏接口类全名
            if (!strstr("api\\models\\game\\", $tag)) $tag = "api\\models\\game\\" . $tag;
            if (!class_exists($tag)) return ['status' => 0, 'error' => $tag . "类文件不存在"];
            return $tag::LoginUrl($info);
        } elseif (is_null($tag) && $info['gid']) { //没有指定接口，查询db中的游戏接口
            $tag = Game::findOne($info['gid']);
            //没有指定游戏配置，把查到游戏配置数据放传给接口
            if (!isset($info['game_conf'])) $info['game_conf'] = $tag['game_conf'];
            if (!$tag || !$tag['game_api']) return ['status' => 0, 'error' => "GId为{$info['gid']}的游戏不存在，或游戏接口未指定"];
            $tag = "api\\models\\game\\" . $tag['game_api'];
            if (!class_exists($tag)) return ['status' => 0, 'error' => $tag . "类文件不存在"];;
            return $tag::LoginUrl($info);
        }
        return ['status' => 0, 'error' => "\$tag类型错误"];
    }

    public function actionTuijian()
    {
        $gid = Yii::$app->request->get('gid');
        if (empty($gid)) return $this->response(13001);
        $limit = Yii::$app->request->get('limit', 5);
        $offset = Yii::$app->request->get('offset', 0);
        return $data = Server::getList($gid, $limit, $offset, ['status' => Server::TJ_YES]);
    }

    public function actionList()
    {
        $gid = Yii::$app->request->get('gid');
        if (empty($gid)) return $this->response(13001);
        $limit = Yii::$app->request->get('limit', 5);
        $offset = Yii::$app->request->get('offset', 0);
        return $data = Server::getList($gid, $limit, $offset);
    }
}
