<?php
$dir=$_SERVER['DOCUMENT_ROOT'];
require_once($dir . '/Lib/Pay/sheng/Api.php');
class sheng_fbank extends Think {
    
    public function BeginPay($arr,$partner=null) {
        
		$dir = $_SERVER ['DOCUMENT_ROOT'];
        require_once($dir . '/Lib/Pay/sheng/core.php');
        $shengpay = new shengpay();
        
        $data['SendTime'] = date('YmdHis');
        $data['OrderNo'] = $arr['orderid'];
        $data['OrderAmount'] = $arr['pay_money'];
        $data['OrderTime'] = date('YmdHis');
        $data['PayType'] = 'PT001';
        /* $data['PayChannel'] = '19'; */
        $data['InstCode'] = $arr['pay_bank'];
        $data['PageUrl'] = $arr['callurl'];
        $data['NotifyUrl'] = $arr['notifyUrl']; #todo; 
        if(!empty($partner['email'])&&!empty($partner['ratio'])){
            $data['SharingInfo'] = $partner['email']."^3^0^" .(($arr['gid']==84?70: $partner['ratio']) /100);
            $data['SharingNotifyUrl'] = 'http://' .$_SERVER['HTTP_HOST'] .'/api/Sharing_notify/paytag/' .$arr['pay_tag']; 
        } 
 
        $data['ProductName'] = $arr['product_name'];
        $data['BuyerContact'] = $arr['pay_to_account'];
        $data['BuyerIp'] = $arr['pay_ip'];
        $new_data = $shengpay->parseData($data);
        return $new_data;
    }
    public function fCallBack()//充值回调
    {
        $dir=$_SERVER['DOCUMENT_ROOT'];
        require_once($dir . '/Lib/Pay/sheng/Api.php');
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
                $update['share_money']=$ret['money'];
                $update['sharing_oid']=$ret['sharingReqNo'];
                
            if ($share_info) {
                $shar_model->where(array('orderid'=>$ret['orderid']))->save($update);
            }else{
                die("sharing order not exist");
            }
            return $ret;
        
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
}
