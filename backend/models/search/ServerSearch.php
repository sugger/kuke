<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/2
 * Time: 11:21
 */

namespace backend\models\search;
use yii\base\Model;
use backend\models\Server ;
use yii\data\ActiveDataProvider;
class ServerSearch extends \backend\models\Server
{
    public $from_date; // 搜索开始时间
    public $to_date; // 搜索结束时间

    public function rules()
    {
        return [
            [['sid', 'gid', 'player_num', 'start_time', 'add_time', 'up_time', 'is_display', 'status', 'server_img', 'isstop', 'is_del'], 'integer'],
            [['servername', 'stop_notice', 'content', 'serverid', 'cp_gameid', 'cp_sid'], 'safe'],
        ];
    }
    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }
    /**
     * @param $params
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Server::find();

        /**
         * 在PHP5中 对象的复制是通过引用来实现的，
         * 运行到return处的$query对象和这里的$query在内存中的地址是一样的，
         * 所以不需要将这个语句写在return前
         */
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);
        $this->load($params);
        if (  !$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'gid' => $this->gid,
            'sid' =>$this->sid,
            'is_display' => $this->is_display,
            'status' =>$this->status,
            'isstop' =>$this->isstop,
            'is_del' => 0,
        ]);

        $query->andFilterWhere(['like', 'servername', $this->servername]);
        /* 条件搜索 */
        /* 时间搜索 */
        if(isset($params['OrderSearch']['from_date']) && isset($params['OrderSearch']['to_date'])){
            $this->from_date = $params['OrderSearch']['from_date'];
            $this->to_date = $params['OrderSearch']['to_date'];
        }
        if($this->from_date !='' && $this->to_date != '') {
            $query->andFilterWhere(['between', 'start_time', strtotime($this->from_date . ' 00:00:00'), strtotime($this->to_date . ' 23:59:59')]);
        }

        /* 排序 */
        $query->orderBy([
            'sid' => SORT_ASC,
        ]);

        return $dataProvider;
    }
}