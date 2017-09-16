<?php
namespace api\controllers;

use api\models\PartnerGame;
use api\models\User;
use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use api\models\Picture;
/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionImg(){
        header('Content-type: image/jpeg');
        $id=Yii::$app->request->get('id',0);
        if (empty($id)) return header("Status: 404 Not Found");
        $pic=static::getImg($id);
        if (empty($pic) ) {
            return header("Status: 404 Not Found");
        }
        if (strpos($pic,'://')) return $this->redirect($pic);
        $basePath=Yii::$app->params['upload']['path'];
        echo  file_exists($basePath.$pic)?file_get_contents($basePath.$pic):'';
    }
    public static function getImg($id)
    {
        $pic = Picture::findOne($id);
        if (empty($pic)) return false;
        return $pic->path;

    }
    /**
     * @param string $web
     * @param string $user
     * @param string $game
     * @param string $serverid
     * @return string
     * 游戏跳转地址
     */
    public function actionWeb($web='pay',$user='',$game='',$serverid='')
    {
        if (!in_array($web,['web','pay','fcm','bbs','kufu','client']))
            return "unKnow Web";
        $web='url_'.$web;
        $WebSiteUrl=[
            'url_web'=>'http://www.kukewan.com',
            'url_pay'=>'http://www.kukewan.com/pay/?game={game}&server_id={serverid}&user={user}',
            'url_fcm'=>'http://www.kukewan.com/service',
            'url_bbs'=>'http://www.kukewan.com',
            'url_kefu'=>'http://www.kukewan.com/service',
        ];
        $userSession=Yii::$app->session['mixuser'];
        $user=$user?$user:$userSession['uid'];
        if (!$user) return "unKnow User";
        $find=User::find()->select('tuid,from_social,username')->where(['uid'=>$user])->asArray()->one();
        $serverid=$serverid?$serverid:$userSession['serverid'];
        if ($find['from_social']==User::HF_USER){
            /**是混服玩家,查询混服地址**/
            $pid=$find['tuid'];
            $game=$game?$game:$userSession['gid'];
            if (!$game)
                return "unKnow Game";
            $partnerGame=PartnerGame::find()->where(['partnerid'=>$pid,'gid'=>$game])->asArray()->one();
            if (!$partnerGame)
                return 'Game Not Exist';
            $game=$partnerGame['gkey'];

            $user=substr($find['username'],strpos($find['username'],'_') + 1 );
            $WebSiteUrl=$partnerGame;
            unset($partnerGame);
        }

        $url=$WebSiteUrl[$web];
        $url=str_replace(['{game}','{serverid}','{user}'],[$game,$serverid,$user],$url);
        $this->redirect($url) ;
    }
    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
