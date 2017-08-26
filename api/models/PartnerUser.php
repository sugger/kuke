<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/25
 * Time: 16:27
 */

namespace api\models;


class PartnerUser extends \common\models\PartnerUsers
{
    /**
     * 验证接口访问的IP和权限
     * @param null $ip
     * @param null $api
     * @return array
     */
    public function checkIpAndAccess($ip = null, $api = null)
    {
        if (empty($this->api_ip)) return ['status' => false, 'msg' => '账户未配置IP白名单或接口权限'];
        $api_ip = json_decode($this->api_ip, true);
        if ($ip && (empty($api_ip['ip']) || !is_array($api_ip['ip']) || in_array($ip, $api_ip['ip'])))
            return ['status' => false, 'msg' => 'IP禁止访问'];

        if ($api && (empty($api_ip['api']) || !is_array($api_ip['api']) || in_array($api, $api_ip['api'])))
            return ['status' => false, 'msg' => '接口禁止访问'];
        return ['status' => true];
    }

}