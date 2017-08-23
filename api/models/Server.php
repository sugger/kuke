<?php
namespace api\models;


class Server extends \common\models\Server
{
    /**
     * @param $gid
     * @param $limit
     * @param $offset
     * @param null $addwhere
     * @return array|\yii\db\ActiveRecord[]
     */
    static public function getList($gid,$limit,$offset,$addwhere=null){
        $query=self::find()->where("is_display= :display and isstop= :isstop and a.is_del= :is_del and start_time < :time",
            [
            ':display'=>self::SHOW,
            ':isstop'=>self::STOP_NO,
            ':is_del'=>self::DEL_NO,
            ':time'=>time()
            ])->alias('a')
            ->innerJoin('yii2_game as b','a.gid=b.id')
            ->select('a.id,a.servername,a.player_num,a.start_time,a.stop_notice,a.server_img,a.sid,b.name as gamename')
            ->orderBy('start_time desc')
            ->offset($offset);
        $query->limit($limit>0?$limit:10);
        if($gid) $query->andWhere(['gid'=>$gid]);
        if($addwhere) $query->andWhere((array)$addwhere);
        return $query->asArray()->all();
    }


    public static function getNotexit($where){
        $where['table']='server';
        $time=time();
        $apiurl="http://mix.kukewan.com/newsiteapi/getdata&t={$time}&ccc=".md5($time.'newsite');
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
        if ($return['status']!=1)return false;
        return [
            'sid'=>$return['data']['sid'],
            'gid'=>$return['data']['gid'],
            'servername'=>$return['data']['servername'],
            'player_num'=>'0',
            'start_time'=>$return['data']['start_time'],
            'add_time'=>$return['data']['add_time'],
            'up_time'=>'0',
            'stop_notice'=>'',
            'is_display'=>'1',
            'status'=>'1',
            'content'=>'',
            'server_img'=>'0',
            'isstop'=>'0',
            'serverid'=>$return['data']['serverid'],
            'cp_gameid'=>'',
            'cp_sid'=>'',
            'is_del'=>'0',
        ];
    }
}