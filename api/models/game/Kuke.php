<?php
namespace api\models\game;
use common\core\GameApiInterface;

class Kuke extends BaseGame  implements GameApiInterface{

    public static $roleAttr = [
        'role' => ['name' => '角色名', 'description' => '区服内唯一标识，一个区内统一角色名不能重复'],
        'level' => ['name' => '角色等级', 'description' => ''],
        'sex' => ['name' => '角色性别', 'description' => '男、女'],
        'combat' => ['name' => '战斗力', 'description' => '战斗力越高越牛逼！'],
    ];
    public $a;

    public static function LoginUrl($info)
    {
        $conf=[];
        if ($info['game_conf'])$conf=json_decode($info['game_conf'],true);
        $url=$info['url']?$info['url']:$conf['game_url'];
        $key=$info['key']?$info['key']:$conf['game_key'];
        $appid=$info['appid']?$info['appid']:$conf['game_id'];//gkey
        $serverid = $info['serverid'];
        $timestamp=time();
        if (!$serverid || !$key || !$url || !$appid) return ['status' => 0, 'error' => "接口内部错误"];
        if (!$serverid || !$appid) return ['status' => 0, 'error' => "接口内部错误"];
        /**酷客玩不验证url**/

        $where['table']='server';
        $where['username']=$info['username'];
        $where['gid']=$info['appid'];
        $where['serverid'] = $info['serverid'];
        $where['from_client']=$info['client'];
        $time=time();
        $apiurl="http://mix.kukewan.com/newsiteapi/playurl?t={$time}&ccc=".md5($time.'newsite');
        $data_string=json_encode($where);
        $ch=curl_init();
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_URL,$apiurl);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data_string))
        );
        $content=curl_exec($ch);
        curl_close($ch);
        $return=json_decode($content,true);
        return ['status'=>$return['status'],'error'=>'','url'=>$return['status']==1?$return['url']:null];
    }

    public static function GamePay($info, $order)
    {
        // TODO: Implement GamePay() method.
    }

    public static function GetRole($info)
    {
        $conf = [];
        if ($info['game_conf']) $conf = json_decode($info['game_conf'], true);
        $url = $info['url'] ? $info['url'] : $conf['game_url'];
        $key = $info['key'] ? $info['key'] : $conf['game_key'];
        $appid = $info['appid'] ? $info['appid'] : $conf['game_id'];//gkey
        $serverid = $info['serverid'];
        $timestamp = time();
//        if (!$sid || !$key|| !$url || !$appid)return ['status'=>0,'error'=>"接口内部错误"];
        if (!$serverid || !$appid) return ['status' => 0, 'error' => "接口内部错误"];
        /**酷客玩不验证url**/
        $where['table'] = 'server';
        $where['username'] = $info['username'];
        $where['gid'] = $info['appid'];
        $where['serverid'] = $info['sid'];
        $time = time();
        $apiurl = "http://mix.kukewan.com/newsiteapi/role?t={$time}&ccc=" . md5($time . 'newsite');
        $data_string = json_encode($where);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $apiurl);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data_string))
        );
        $content = curl_exec($ch);
        curl_close($ch);
        $return = json_decode($content, true);
        unset($return['data']['uid']);
        return ['status' => $return['status'], 'error' => '', 'data' => $return['status'] == 1 ? $return['data'] : null];
    }

}