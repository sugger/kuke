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
        $query=self::find()->where(" is_display= :display and isstop= :isstop and a.is_del= :is_del and start_time < :time",
            [
            ':display'=>self::SHOW,
            ':isstop'=>self::STOP_NO,
            ':is_del'=>self::DEL_NO,
            ':time'=>time()
            ])->alias('a')
            ->innerJoin('yii2_game as b','a.gid=b.id')
            ->select('a.id,a.servername,a.player_num,a.start_time,a.stop_notice,a.server_img,a.sid,b.name as gamename')
            ->orderBy('id desc')
            ->offset($offset);
        if($limit>0) $query->limit($limit);
        if($addwhere) $query->andWhere((array)$addwhere);
        return $query->asArray()->all();
    }
}