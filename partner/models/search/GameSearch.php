<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/28
 * Time: 11:58
 */

namespace partner\models\search;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use partner\models\Game;
class GameSearch extends Game
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [
                [
                    'id', 'game_starttime', 'sort', 'gametype', 'gamestyle', 'payto',
                    'ishot','addtime','game_hit','game_players','isdisplay','isopen','is_del'
                ],
                'integer'
            ],
            [['name'], 'safe'],
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
        $query = Game::find();

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
            'id' => $this->id,
            'game_hit' => $this->game_hit,
            'game_players' => $this->game_players,
            'isdisplay' => $this->isdisplay,
            'is_del' => 0,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        /* 条件搜索 */


        /* 排序 */
        $query->orderBy([
            'sort' => SORT_ASC,
        ]);

        return $dataProvider;
    }
}