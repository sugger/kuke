<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\PartnerGame as PartnerGameModel;

/**
 * PartnerGame represents the model behind the search form about `backend\models\PartnerGame`.
 */
class PartnerGame extends PartnerGameModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'partnerid', 'gid', 'status', 'auto_server'], 'integer'],
            [['gkey', 'lkey', 'pkey', 'create_time', 'up_time', 'url_web', 'url_pay', 'url_fcm', 'url_bbs', 'url_kefu', 'url_client'], 'safe'],
            [['rate', 'totalmoney'], 'number'],
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
        $query = PartnerGameModel::find();

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
            'partnerid' => $this->partnerid,
            'gid' => $this->gid,
            'status' => $this->status,
            'rate' => $this->rate,
            'totalmoney' => $this->totalmoney,
            'auto_server' => $this->auto_server,
            'create_time' => $this->create_time,
            'up_time' => $this->up_time,
        ]);

        $query->andFilterWhere(['like', 'gkey', $this->gkey])
            ->andFilterWhere(['like', 'lkey', $this->lkey])
            ->andFilterWhere(['like', 'pkey', $this->pkey])
            ->andFilterWhere(['like', 'url_web', $this->url_web])
            ->andFilterWhere(['like', 'url_pay', $this->url_pay])
            ->andFilterWhere(['like', 'url_fcm', $this->url_fcm])
            ->andFilterWhere(['like', 'url_bbs', $this->url_bbs])
            ->andFilterWhere(['like', 'url_kefu', $this->url_kefu])
            ->andFilterWhere(['like', 'url_client', $this->url_client]);

        return $dataProvider;
    }
}
