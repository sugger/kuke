<?php
namespace api\models\game;

use common\core\GameApiInterface;

class Cgtx extends BaseGame implements GameApiInterface
{

    const PLATFORM = 'kukewan';
    public static $payAttr = [
        '1' => '充值成功',
        '-1' => '充值失败',
        '-2' => 'IP限制',
        '-3' => 'md5校验错误',
        '-4' => 'time时间已过期时间差在前后30分钟内',
        '-5' => '服务器查询失败',
        '-6' => '元宝发放失败',
        '-7' => '订单重复',
        '-8' => '用户不存在',
        '-9' => '缺少参数（参数值为空字符或者0都定位缺少参数)'
    ];

    public static $roleAttr = [
        'role' => ['name' => '角色名', 'description' => '区服内唯一标识，一个区内统一角色名不能重复'],
        'level' => ['name' => '角色等级', 'description' => ''],
        'sex' => ['name' => '角色性别', 'description' => '男、女'],
        'fightvalue' => ['name' => '战斗力', 'description' => '战斗力越高越牛逼！'],
        'roleid' => ['name' => '角色ID', 'description' => ''],
        'profession' => ['name' => '职业', 'description' => ''],
        'createTime' => ['name' => '创建时间', 'description' => ''],
    ];

    public static function LoginUrl($info)
    {
        $conf = [];
        if ($info['game_conf']) $conf = json_decode($info['game_conf'], true);
        $url = $info['url'] ? $info['url'] : $conf['game_url'];
        $key = $info['key'] ? $info['key'] : $conf['game_key'];
        $appid = $info['appid'] ? $info['appid'] : $conf['game_id'];//gkey
        $serverid = $info['serverid'];
        $uid = $info['uid'];
        $username = $info['username'];
        $timestamp = time();
        if (!$serverid || !$key || !$url || !$appid) return ['status' => 0, 'error' => "接口内部错误"];


        $pargam['agent'] = self::PLATFORM;
        $pargam['account'] = $uid;
        $pargam['serverId'] = $serverid;
        $pargam['time'] = $timestamp;
        $pargam['fcm'] = $info['fcm'] == 1 ? 1 : 0;
        $pargam['sign'] = md5(implode('', $pargam) . $key);
        $pargam['isClient'] = $info['client'] == 1 ? 1 : 0;
        $url = str_replace('{serverid}', $pargam['serverId'], $url); //替换区服id
        //组装get请求地址
        if (!strstr($url, '?')) $url .= '?';
        $url .= http_build_query($pargam);
        return ['status' => 1, 'error' => '', 'url' => $url];
    }

    /**
     * @param $info ;充值所需参数
     * @param $order \api\models\Order;
     * 游戏充值
     */
    public static function GamePay($info, $order)
    {

        if ($order->pay_status != 1 or $order->pay_time = 0) return false;
        /**调用接口，获取游戏URL*/
        $url = str_replace('{platform}', self::PLATFORM, $info['url']);
        $timestamp = time();
        $key = $info['key'];
        $serverid = $info['serverid'];
        $appid = $info['appid'];//gkey
        if (!$serverid || !$key || !$url || !$appid) return ['status' => 0, 'error' => "接口内部错误"];
        $pargam['agent'] = self::PLATFORM;
        $pargam['account'] = $order->uid;
        $pargam['serverId'] = $serverid;
        $pargam['orderId'] = $order->order_sn;
        $pargam['amount'] = sprintf("%2f", $order->game_money);
        $pargam['gold'] = $pargam['amount'] * $info['payto'];
        $pargam['time'] = $timestamp;
        $pargam['sign'] = md5(implode('', $pargam) . $key);
        $pargam = http_build_query($pargam);
        $response = file_get_contents($url . '?' . $pargam);
        $msg = isset(static::$payAttr[$response]) ? static::$payAttr[$response] : "未知代号" . $response;
        return [
            'status' => $response === '1' ? true : false,
            'url' => $url,
            'pargam' => $pargam,
            'response' => $response,
            'msg' => $msg
        ];
    }

    public static function GetRole($info)
    {
        $conf = [];
        if ($info['game_conf']) $conf = json_decode($info['game_conf'], true);
        $url = $info['url'] ? $info['url'] : $conf['game_url'];
        $key = $info['key'] ? $info['key'] : $conf['game_key'];
        $appid = $info['appid'] ? $info['appid'] : $conf['game_id'];//gkey
        $serverid = $info['serverid'];
        $uid = $info['uid'];
        $username = $info['username'];

        $timestamp = time();
        if (!$serverid || !$key || !$url || !$appid) return ['status' => 0, 'error' => "接口内部错误"];

        /**酷客玩不验证url**/
        $pargam['agent'] = self::PLATFORM;
        $pargam['account'] = $uid;
        $pargam['serverId'] = $serverid;
        $pargam['time'] = $timestamp;
        $pargam['sign'] = md5(implode('', $pargam) . $key);

        $url = str_replace('{serverid}', $pargam['serverId'], $url); //替换区服id
        //组装get请求地址
        if (!strstr($url, '?')) $url .= '?';
        $url .= http_build_query($pargam);

        $content = file_get_contents($url);
        $return = json_decode($content, true);
        $role = [];
        foreach ($return as $k => $value) {
            $role[] = [
                'role' => $value['nickname'],
                'roleid' => $value['roleId'],
                'level' => $value['grade'],
                'profession' => $value['profession'],
                'createTime' => strtotime($value['createTime']),
                'sex' => $value['sex'],
                'fightvalue' => $value['fightvalue'],
            ];
        }
        return ['status' => $role ? 1 : 0, 'roleAttr' => static::$roleAttr, 'data' => $role];
    }


}