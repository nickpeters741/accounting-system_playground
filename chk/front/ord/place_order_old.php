<?php
session_start(); 
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$url = "../../assets";
if (!isset($_SESSION['user_id'])) {
   header("Location:../log_out.php");
}
$folder="front/ord/"; 
thesion_page($folder);

$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$mkt = $row['mkt'];
$day = $row['day']; 
$shop = $row['shop']; 
$sale_type = $row['sale_type']; 

$order_total=grand_total($sale_id);

$balance =$_POST['balance']; 
$arr = $_POST['pay-mode'] ;
$damount = $_POST['deli'];
$reg = strtoupper($_POST['reg']);
$means = $_POST['means'];
$disc = $_POST['disc'];
$beba_sta = $_POST['beba_sta'];  

$sale_amount=$order_total+$damount-$disc;
$tendered=$sale_amount+$balance;

$cust_bal=cust_bal($cust_id); 
$msg="Thank you for visiting our store today, We appriciate your business";
create_sms($cust_id,$msg);
//function columns($arr){
$array = array();
foreach($arr as $i) {
	$ref="moderef".$i;
	$mode="mode".$i;
	$refv="ref".$i; 
	if (empty($_POST[$refv]) ) {
		$moderef=""; 
	}else{ 
		$moderef=",".$ref;
	}
	$array[] =  $mode.$moderef;
}
//}
$array2 = array();
foreach($arr as $i) {
	$ref="ref".$i;
	$mode="name".$i; 
	if (empty($_POST[$ref])) {
		$modeval=""; 
	}else{ 
		$modeval=",'".$_POST[$ref]."'";
	}

	$array2[]=$_POST[$mode]-$balance.$modeval;
} 
//print_r($arr);
// if (empty($arr) OR !$arr) {
// 	# code...
// }else{
	foreach($arr as $i) { 
		$mode="name".$i; 
		$bcheck=is_int($i); 
		if ($_POST[$mode]==0) {
			$bank_id=00;
		}else{
			$pay_id= $i;
			$check_acc=mysqli_query($connection,"SELECT bank_id FROM kp_pay_mode WHERE  pay_id='$pay_id'"); 
			$on = mysqli_fetch_assoc($check_acc);
			$bank_id=$on['bank_id'];
			$mode_amount=$_POST[$mode]-$balance; 
			$bank_balance=bank_bal($bank_id);
			$transa="BANK CREDITED BY RECEIPT NO".$sale_id;
			$create_petty = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance ".mysqli_error($connection));
			//echo "INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','$transa','$mode_amount','$user_id','$bank_balance',CURRENT_DATE)";
			$insert_bank= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','$transa','$mode_amount','$user_id','$bank_balance',CURRENT_DATE)") or die("Could not insert bank history".mysqli_error($connection));
		}
	}
// }

//UPDATE STORE CREDIT
if ($_POST['namesc'] >0) {
 	$store_cred=$_POST['namesc'];
 	$trans="CASH SALE PAYMENT"; 
 	$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET amount=amount-'$store_cred' WHERE cust_id='$cust_id'") or die(mysqli_error($connection));

	$create_history = mysqli_query($connection,"INSERT INTO kp_sc_hist(cust_id,amount,trans,user_id,trans_id,trans_type,day)  
				VALUES('$cust_id','$store_cred','$trans','$user_id','$sale_id','$sale_type',CURRENT_DATE)") or die(mysqli_error($connection));
}

$pay_id=pay_id(); 
$field_values = array("pay_id","sale_id","user_id","cust_id","tendered","balance","pay_date","paid_total","type");
$result=array_merge( $field_values,$array);

$data_values = array($pay_id,$sale_id,$user_id,$cust_id,$tendered,$balance,"'".$day."'",$sale_amount,1);
$result2=array_merge( $data_values,$array2);
$sample=Insertdata("kp_sale_payment", $result, $result2);  

// START WITH DELIVERY
if ($damount==0) {}else{
	$insert_delivery= mysqli_query($connection,"INSERT INTO kp_logistics(beba_id,sale_id,amount,means,reg,day) VALUES('$beba_sta','$sale_id','$damount','$means','$reg',CURRENT_DATE)") or die(mysqli_error($connection));
	$action="ADDED|-|-|-|LOGISTICS TO SALE NO ".$sale_id;
	logs($action,"../../"); 
}
 
 
$clear_sale_status = mysqli_query($connection,"DELETE FROM kp_sale_status  WHERE sale_id='$sale_id'") or die("Error".mysqli_error($connection));  

$clear_po_status = mysqli_query($connection,"DELETE FROM kp_po_status  WHERE sale_id='$sale_id'") or die("Error".mysqli_error($connection));  

$create_history = mysqli_query($connection,"INSERT INTO kp_sales(sale_id,cust_id,user_id,sale_amount,disc,total_amount,type,pay_status,day,delivery,mktr,refno,cf_bal) VALUES('$sale_id','$cust_id','$user_id','$order_total','$disc','$sale_amount','$sale_type',1,'$day','$damount','$mkt',0,'$cust_bal')") or die(mysqli_error($connection));

cust_trans($cust_id,"SALE",$sale_id,$sale_amount);

$action="PLACED|-|-|-| SALE NO ".$sale_id;
logs($action,"../../"); 

sale_req($sale_id);
?>
<script type="text/javascript">
	 window.location = "../print/print_sale.php";
</script>  
<?php
//header("Location:../print/print_sale.php"); 




?>