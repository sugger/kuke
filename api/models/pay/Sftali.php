<?php
namespace api\models\pay;
/**
* 盛付通微信支付
*/
use api\models\Order;
class Wftwx
{
  
  function __construct()
  {
    $dir=$_SERVER['DOCUMENT_ROOT'];
    require_once($dir . '/Lib/Pay/sheng/Api.php');
  }

    const BASE_DIR = __DIR__ . '/sheng';
    const SOURCE  = ['WFTALI'=>'威富通支付宝', 'WFTWX'=>'威富通微信'];
    public static function paytype($order){
        $order->pay_source='WFTWX';
        return true;
    }
    public function Pay(){

    }


  public function BeginPay($arr,$partner=null) {
    $request['notifyUrl']=$arr["notifyUrl"];
    $request['pageUrl']=$arr["callurl"];
    $request['orderNo']=$arr['orderid'];
    $request['orderAmount']=$arr['pay_money'];
    $request['orderTime']=date('YmdHis');
    $request['productName']= $arr["product_name"] ;
    $request['buyerId']=$arr["gid"] ;
    $request['buyerName']=$arr ['pay_to_account']; 
    $obj = new Api();
    $c_request=$obj->parse_cRequest($request) ;//获取收单数据
    $c_return=$obj->send($c_request);//发送收单数据
    // $f_request=$obj->parse_fRequest($c_return,M('member_bank')->where('uid = 196834')->find());
    // $f_return = $obj->send($f_request);
    $p_request=$obj->parse_pRequest($c_return,array('paytype'=>'ap')) ;
    $p_return=$obj->send($p_request);
    $data['returnInfo']=get_object_vars($p_return['return']->returnInfo) ;
    $data['extension'] =get_object_vars($p_return['return']->extension) ;
    die(json_encode($data)) ;
    }
    public function create_order($arr)
    {
      $request['notifyUrl']=$arr["notifyUrl"];
    $request['pageUrl']=$arr["callurl"];
    $request['orderNo']=$arr['orderid'];
    $request['orderAmount']=$arr['pay_money'];
    $request['orderTime']=date('YmdHis');
    $request['productName']= $arr["product_name"] ;
    $request['buyerId']=$arr["sid"] ;
    $request['buyerName']=$arr ['pay_to_account']; 
    $request['extension']=array('ext1'=>$arr['mix_orderid'],'ext2'=>'');
    $obj = new Api();
    $c_request=$obj->parse_cRequest($request) ;//获取收单数据
    $c_return=$obj->send($c_request);//发送收单数据
    $expire = $arr['expire'] ? 300 : $arr['expire'];
    $save['mix_orderNo']    = $c_return->extension->ext1;
    $save['orderNo']    = $c_return->orderNo;
    $save['tokenId']    = $c_return->tokenId;
    $save['sessionId']    = $c_return->sessionId;
    $save['transNo']    = $c_return->transNo;
    $save['orderAmount']  = $c_return->orderAmount;
    $save['orderType']    = $c_return->orderType;
    $save['errorCode']    = $c_return->returnInfo->errorCode;
    $save['errorMsg']     = $c_return->returnInfo->errorMsg;
    S( $arr['orderid'] ,$save , $expire );
    return S( $arr['orderid'] );
    }
    public function pay1($order)
    { 
      $p_cache = S('p_' . $order);
      if ($p_cache) die(json_encode($p_cache)) ;
      $cache=S($order);
      if($cache){
        $this->pay->orderNo =     $cache['orderNo'];     
        $this->pay->tokenId =     $cache['tokenId'];     
        $this->pay->sessionId = $cache['sessionId'];     
        $this->pay->transNo =     $cache['transNo'];     
        $this->pay->orderAmount =$cache['orderAmount'] ;   
        $this->pay->orderType = $cache['orderType'];     
        // $this->pay->returnInfo->errorCode =  $save['errorCode'];      
        // $this->pay->returnInfo->errorMsg = $save['errorMsg'];   
        $obj= new Api();
        $p_request=$obj->parse_pRequest($this->pay,array('paytype'=>'ap'));
        $p_return=$obj->send($p_request);
        $data['returnInfo']=get_object_vars($p_return['return']->returnInfo) ;
        $data['extension'] =get_object_vars($p_return['return']->extension) ;
        if ($_GET['lei']) {
            dump($p_request);
          dump($p_return);
        }
        S('p_' . $order,$data,300);
          if($_GET['merge']&&$data['extension']['ext3']){
               $data['url']="http://www.kukewan.com/pay/png?url=".$data['extension']['ext3'];
           }
          die(json_encode($data)) ;
        
      }
    }
    public function Sharing($data,$partner)
    {
      $order=M('pay_ok')->where(array('orderid'=>$data['orderid']))->find();
      if(!empty($order)&&$order['order_status']!="0,0,0"&&!empty($partner['bank_account'])){
        $obj = new Api();
        $frequest=$obj->parse_fRequest($data,$partner);
        
        $freturn =$obj->send($frequest);
        if($_POST['lei']){
          dump($frequest);
          dump($freturn);
        } 
        $ret['status']=$freturn->return->status;
        $ret['returnInfo']=$freturn->return->returnInfo;
        $ret['orderid']=$data['orderid'];
        $ret['sharingReqNo']=$freturn->return->sharingReqNo;
        $ret['items']=get_object_vars($freturn->return->items);
        $update['orderid']=$data['orderid'];
        $shar_model=M('pay_share');
        $share_info=$shar_model->where($update)->find();
        if ($ret['status']=="S") {
          $update['status']=2;
          $update['remark']=$share_info['remark'] ."->分账成功";
        }elseif ($ret['status']=="F") {
          $update['status']=3;
          $update['remark']=$share_info['remark'] ."->分账失败";
        }elseif ($ret['status']=="P") {
          $update['status']=1;
          $update['remark']=$share_info['remark'] ."->分账进行中";
        }else{
          $update['status']=4;
          $update['remark']=$share_info['remark'] ."->未知错误" .$ret['status'];
        }
        if ($ret['items']['sharingAmount'])  $update['share_money']=$ret['items']['sharingAmount'];
        if ($ret['sharingReqNo']) $update['sharing_oid']=$ret['sharingReqNo'];
        if ($share_info) {
          $shar_model->where(array('orderid'=>$data['orderid']))->save($update);
        }else{
          $update['account']=$order['uid'];
          $update['partner']=$partner['uid'];
          $shar_model->add($update);
        }
       
        return $ret;
      }
      if (empty($partner['bank_account'])) {
        return array(
            'status'=>5,
            ''
          );
      }
    }
    public function CallBack()//充值回调
    {
      $obj = new Api();
      $ret = $obj->CallBack();
      if($ret['status']==01){
        $pay_ok_model = M('pay_ok');
            $pay_order = $pay_ok_model->where(array('orderid'=>$ret['orderid']))->find();
            if (!$pay_order ) die("orderid not exists");
            $pay_type_model = M('pay_type');
            $pay_tag_object = $pay_type_model->where(array('tag'=>$pay_order['pay_tag']))->find();
            if ($pay_tag_object['fee'] != '') {
        $pay_money = $ret['pay_real_money']* $pay_tag_object['fee']/100;
            } else {
        $pay_money =$ret['pay_real_money'];
            }
            $update['pay_really_money'] = $pay_money;
            $member_model = M('member');
            $map['username'] = $pay_order['pay_to_account'];
            if($pay_order['pay_way_num'] == 1){
                $member_model->where($map)->setInc('plat_coin', $pay_money);//冲入平台币
                $update['remark'] = "充值成功,充值到:平台币.充值金额:".$pay_money."元,获得积分:".$pay_money."分";
            }else{
                $member_model->where($map)->setInc('money',$pay_money);//冲入金钱
                $update['remark'] =$pay_order['remark']  . "->付款成功";
            }
            $update['success_time'] = time();
            $update['order_status'] = "1,1,1";
            $member_model->where($map)->setInc('total_money',$pay_money);//累计消费
      $member_model->where($map)->setInc('point',$pay_money);//增加积分
            unset($map);
            $arr['flag'] =$pay_ok_model->where(array('orderid'=>$ret['orderid']))->data($update)->save();
      $arr['pay_way_num'] =$pay_order['pay_way_num'];
            return $arr;
      }
    }


    public function fCallBack()//充值回调
    {
      $obj = new Api();
      $ret = $obj->fCallBack();


            $update['orderid']=$ret['orderid'];
        $shar_model=M('pay_share');
        $share_info=$shar_model->where($update)->find();
        if ($ret['status']=="S") {
          $update['status']=2;
          $update['remark']=$share_info['remark'] ."->分账成功";
        }elseif ($ret['status']=="F") {
          $update['status']=3;
          $update['remark']=$share_info['remark'] ."->分账失败";
        }elseif ($ret['status']=="P") {
          $update['status']=1;
          $update['remark']=$share_info['remark'] ."->分账进行中";
        }

        if ($share_info) {
          $shar_model->where(array('orderid'=>$ret['orderid']))->save($update);
        }else{
          die("sharing order not exist");
        }
        return $ret;
      
    }


}
