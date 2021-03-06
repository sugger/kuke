<?php
namespace api\models;

use common\models\GameLogin as CommonGameLogin;
use Yii;

class GameLogin extends CommonGameLogin
{
    public function beforeValidate()
    {
        $this->ip = ip2long(Yii::$app->request->getUserIP());
        return parent::beforeValidate();
    }

    public function afterFind()
    {
        $this->ip = long2ip($this->ip);
        parent::afterFind(); // TODO: Change the autogenerated stub
    }


}