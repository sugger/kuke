<?php
namespace api\models\game;
use common\core\GameApiInterface;
class Kuke extends BaseGame  implements GameApiInterface{

    public static function LoginUrl($info)
    {
        $conf=[];
        if ($info['game_conf'])$conf=json_decode($info['game_conf'],true);
        $url=$info['url']?$info['url']:$conf['game_url'];
        $key=$info['key']?$info['key']:$conf['game_key'];
        $appid=$info['appid']?$info['appid']:$conf['game_id'];//gkey
        $sid=$info['sid'];
        $timestamp=time();
//        if (!$sid || !$key|| !$url || !$appid)return ['status'=>0,'error'=>"接口内部错误"];
        if (!$sid || !$key || !$appid)return ['status'=>0,'error'=>"接口内部错误"];/**酷客玩不验证url**/

        $where['table']='server';
        $where['username']=$info['username'];
        $where['gid']=$info['appid'];
        $where['serverid']=$info['sid'];
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
        // TODO: Implement GetRole() method.
    }

}