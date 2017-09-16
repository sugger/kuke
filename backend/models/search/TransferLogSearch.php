<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\TransferLog;

/**
 * TransferLogSearch represents the model behind the search form about `backend\models\TransferLog`.
 */
class TransferLogSearch extends TransferLog
{
    public $from_date,$to_date;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'transfer_sn'], 'integer'],
            [['order_sn', 'type', 'ctime', 'status', 'stime', 'utime'], 'safe'],
            [['money', 'transfer_amount'], 'number'],
            [['from_date','to_date'],'safe'],
            [['partner'],'string','max'=>10],
            [['from_date','to_date'],'default','value'=>function ($model, $attribute){
                return date('Y-m-d', strtotime($attribute === 'from_date' ? 'last weeks' :'now'));
            }],

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
        $query = TransferLog::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'transfer_sn' => $this->transfer_sn,
            'money' => $this->money,
            'transfer_amount' => $this->transfer_amount,
            'status' => $this->status,
            'partner' => $this->partner,
            'type' => $this->type,
        ]);
        if (!$this->order_sn){
           $query->andFilterWhere(['between','ctime',$this->from_date .' 00:00:00',$this->to_date . ' 23:59:59']);
        }

        $query->andFilterWhere(['like', 'order_sn', $this->order_sn]);

        return $dataProvider;
    }
}
