<?php

namespace backend\models\search;

use backend\models\PartnerUser;
use backend\models\User;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Order;
/**
 * OrderSearch represents the model behind the search form about `backend\models\Order`.
 */
class OrderSearch extends Order
{
    public $from_date,$to_date;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id', 'uid', 'rebate_id', 'gameid', 'sid', 'create_time', 'pay_time', 'pay_status', 'status', 'is_del'], 'integer'],
            [['order_sn', 'pay_sn', 'username', 'type', 'title', 'channel', 'rolename', 'pay_type', 'pay_source', 'remark'], 'safe'],
            [['money', 'payables', 'really_money', 'game_money'], 'number'],
            [['from_date','to_date'],'default','value'=>function ($model, $attribute){
                return date('Y-m-d', strtotime($attribute === 'from_date' ? 'last weeks' :'now'));
            }],
            [['from_date','to_date'],'safe'],
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
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {

        $query = Order::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);


        $this->load($params);
        //按渠道搜索
        if (!empty($this->channel)&&!is_numeric($this->channel)){
            $channel=PartnerUser::getQdIdLikeUsername($this->channel) ;
            if ($channel){
                $query->andFilterWhere(['in', 'channel', implode(',',$channel)]);
            }
        }else{
            $query->andFilterWhere([ 'channel'=>$this->channel]);
        }
        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        if (empty($this->uid)&&$this->username && is_numeric($this->username)){
           $this->uid = $this->username;
        }else{
            $query->andFilterWhere(['like', 'username', $this->username]);
        }

        $query->andFilterWhere([
            'order_id' => $this->order_id,
            'uid' => $this->uid,
            'money' => $this->money,
            'rebate_id' => $this->rebate_id,
            'payables' => $this->payables,
            'really_money' => $this->really_money,
            'game_money' => $this->game_money,
            'gameid' => $this->gameid,
            'sid' => $this->sid,
            'pay_status' => $this->pay_status,
            'status' => $this->status,
            'pay_source' => $this->pay_source,
            'pay_type' => $this->pay_type,
            'type' => $this->type,
            'is_del' => 0,
        ]);
        $query->andFilterWhere(['between','create_time',strtotime($this->from_date),strtotime($this->to_date . ' 23:59:59')]);
        $query->andFilterWhere(['like', 'order_sn', $this->order_sn])
            ->andFilterWhere(['like', 'pay_sn', $this->pay_sn])
            ->andFilterWhere(['like', 'rolename', $this->rolename]);

        $query->orderBy('order_id desc');
        return $dataProvider;
    }
}
