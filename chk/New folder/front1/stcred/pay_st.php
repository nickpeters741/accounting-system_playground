<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
if (isset($_POST['pay'])) { 

	$user_id = $_SESSION['user_id'];
	$amount = mysqli_real_escape_string($connection,$_POST['amount']);
	$cust_id = mysqli_real_escape_string($connection,$_POST['cust_id']); 
	if ($cust_id==0 || empty($cust_id)) {
		header("Location:init_pg.php");
	}elseif ($amount==0 || empty($amount)) {
		header("Location:add_st.php?id=$cust_id");
	}else{


	$arr = $_POST['pay-mode'] ;
	$today=date("Y-m-d");
	//create pay id 
	$pay_id = pay_id();

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
 
 	$array2 = array();
	foreach($arr as $i) {
		$ref="ref".$i;
		$mode="name".$i; 
		if (empty($_POST[$ref])) {
			$modeval=""; 
		}else{ 
			$modeval=",'".$_POST[$ref]."'";
		}

		$array2[]=$_POST[$mode].$modeval;
	}

	foreach($arr as $i) { 
		$bank_id= $i;
		$mode="name".$i; 
		if ($_POST[$mode]==0) {
			# code...
		}else{
			$bank_id= $i;
			$mode_amount=$_POST[$mode]; 
			$transa="CUSTOMER PAID IN ADVANCE";
			$create_petty = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not create a new purchase order number");

			$insert_bank= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,day) VALUES('$bank_id','$transa','$mode_amount','$user_id',CURRENT_DATE)") or die(mysqli_error($connection));
		}
	}

// $field_values = array("pay_id","user_id","cust_id","paid_total","pay_date");
// $result=array_merge( $field_values,$array);
 
// $data_values = array($pay_id,$user_id,$cust_id,$amount,"'".$today."'");
// $result2=array_merge( $data_values,$array2);
// $sample=Insertdata("kp_sale_payment", $result, $result2); 

// echo $sample;
// $bal=cust_bal($cust_id);

  
  
function update_wallet($cust_id,$amount,$sale_id,$user_id,$sale_type){
	global $connection; 
	$trans="CUSTOMER PAID UPFRONT"; 
	$update_wallet=mysqli_query($connection,"INSERT INTO kp_sc (cust_id,amount) VALUES ('$cust_id', '$amount') ON DUPLICATE KEY UPDATE amount=amount+'$amount'") or die(mysqli_error($connection));

	if ($update_wallet) {
		$create_history = mysqli_query($connection,"INSERT INTO kp_sc_hist(cust_id,amount,trans,user_id,trans_id,trans_type,day)  
		VALUES('$cust_id','$amount','$trans','$user_id','$sale_id','$sale_type',CURRENT_DATE)") or die(mysqli_error($connection));
	}else{
		 error_logs("PAY CREDIT ORDER","COULDN'T UPDATE WALLET FOR SALE ID $sale_id");
	}
	
}

update_wallet($cust_id,$amount,$pay_id,$user_id,"UP_PAY");

// $cust_cred=mysqli_query($connection,"UPDATE kp_customers SET bal=bal-'$amount' WHERE cust_id='$cust_id'");
  
$msg="YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT".$amount;
create_sms($cust_id,$msg);
 

 


header("Location:../stcred/print_st.php?cust_id=$cust_id&amount=$amount");
}
 
}else{
	echo "<h1>ERROR!!!!!!!!!</H>";
}
?>