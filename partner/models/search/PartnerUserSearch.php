<?php

namespace partner\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use partner\models\PartnerUser;

/**
 * PartnerUserSearch represents the model behind the search form about `partner\models\PartnerUser`.
 */
class PartnerUserSearch extends PartnerUser
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'parentid', 'register_time', 'lastlogin_time', 'status'], 'integer'],
            [['username', 'domain', 'password', 'type', 'bankaccount', 'realname', 'number_id', 'remark', 'lastlogin_ip', 'lkey', 'pkey', 'admin_username', 'pay_tag', 'tel', 'email', 'qq', 'test_account', 'api_ip', 'callback', 'notify'], 'safe'],
            [['available_money', 'money', 'rate', 'totalmoney'], 'number'],
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
        $query = PartnerUser::find();

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
            'parentid' => $this->parentid,
            'register_time' => $this->register_time,
            'lastlogin_time' => $this->lastlogin_time,
            'available_money' => $this->available_money,
            'money' => $this->money,
            'rate' => $this->rate,
            'totalmoney' => $this->totalmoney,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'domain', $this->domain])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'bankaccount', $this->bankaccount])
            ->andFilterWhere(['like', 'realname', $this->realname])
            ->andFilterWhere(['like', 'number_id', $this->number_id])
            ->andFilterWhere(['like', 'remark', $this->remark])
            ->andFilterWhere(['like', 'lastlogin_ip', $this->lastlogin_ip])
            ->andFilterWhere(['like', 'lkey', $this->lkey])
            ->andFilterWhere(['like', 'pkey', $this->pkey])
            ->andFilterWhere(['like', 'admin_username', $this->admin_username])
            ->andFilterWhere(['like', 'pay_tag', $this->pay_tag])
            ->andFilterWhere(['like', 'tel', $this->tel])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'qq', $this->qq])
            ->andFilterWhere(['like', 'test_account', $this->test_account])
            ->andFilterWhere(['like', 'api_ip', $this->api_ip])
            ->andFilterWhere(['like', 'callback', $this->callback])
            ->andFilterWhere(['like', 'notify', $this->notify]);

        return $dataProvider;
    }
}
