<?php

namespace api\models;
class Game extends \common\models\Game
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return parent::rules();
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return parent::attributeLabels();
    }
    public static function getNotexit($where){
        $where['table']='game';
        $time=time();
        $apiurl="http://mix.kukewan.com/index1.php?s=newsiteapi/getdata&t={$time}&ccc=".md5($time.'newsite');
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
        echo $content=urldecode($content);
        $return=json_decode($content,true);
        echo json_last_error();
        var_dump($return);
        die;
        if ($return['status']!=1)return false;
        return [
            'id' => $return['data']['gid'],
            'game_starttime' => $return['data']['game_starttime'],
            'name' => $return['data']['sort'],
            'short' => $return['data']['sort'],
            'sort'=>$return['data']['sort'],
            'gametype' => 0,
            'gamestyle' => $return['data']['gamestyle'],
            'pic' => json_encode([
                'pic1'=>$return['data']['gamepic'],
                'pic2'=>$return['data']['smallpic'],
                'pic3'=>$return['data']['ordinarypic'],
                'pic4'=>$return['data']['remen_gamepic'],
                'pic5'=>$return['data']['temporary_ordinarypic'],
                'pic6'=>$return['data']['temporary_smallpic'],
                'pic7'=>$return['data']['card_pic'],
                'pic8'=>$return['data']['card_smallpic'],
                'pic9'=>$return['data']['game_logo'],
            ]),
            'payto' => $return['data']['payto'],
            'content' => $return['data']['content'],
            'ishot' => $return['data']['ishot'],
            'game_web' => $return['data']['game_web'],
            'game_bbs' => $return['data']['game_bbs'],
            'currency' => $return['data']['currency'],
            'addtime' => $return['data']['addtime'],
            'game_hit' => $return['data']['game_hit'],
            'game_players' => 0,
            'qq' => $return['data']['qq'],
            'isdisplay' => 1,
            'isopen' => 1 ,
            'desc1' => $return['data']['desc1'],
            'game_api' => $return['data']['game_api'],
            'game_conf' => json_encode([
                'game_key'=>$return['data']['game_key'],
                'game_url'=>$return['data']['game_url'],
                'game_paykey'=>$return['data']['game_paykey'],
                'game_payurl'=>$return['data']['game_payurl'],
                'game_id'=>$return['data']['p_id'],
            ]) ,
            'remarks' => $return['data']['sort'],
            'lander' => '',
            'is_del' => '0',
        ];
    }

}
