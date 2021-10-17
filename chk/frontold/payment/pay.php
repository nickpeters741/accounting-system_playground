<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$tendered = mysqli_real_escape_string($connection,$_POST['tendered']);
$cust_id = mysqli_real_escape_string($connection,$_POST['cust_id']);
$pay_arr = $_POST['pay-mode'] ;
$inv_amount = $_POST['grand_total'] ; 
$today=today();
$total_paid=$tendered; 
$pay_id = pay_id();
//print_r($pay_arr);
//check if tendered has data
if(count($pay_arr) == 0) {
    ?> 
<script type="text/javascript">
    var hulla = new hullabaloo();
	    hulla.send('Danger!!! CALL THE ADMINISTRATOR OR CLEAR CACHE', "danger");
	     </script>
	    <?php
}elseif ($tendered==0) {
	?>
	error
	<?php
}else{
	//check the type of payment
	if (isset($_POST['pay'])) {
		$get_invoices = mysqli_query($connection,"SELECT sale_id FROM kp_sales WHERE sale_bal>0 AND cust_id='$cust_id' ORDER BY sale_id ASC") or die("Could not get the user permissions"); 
		$invoices = array();
		while($row = mysqli_fetch_array($get_invoices)) {
		  $invoices[] = $row['sale_id'];
		}
		$invoices= implode(', ', $invoices);
	}elseif (isset($_POST['invoices'])) {
		$invoices = $_POST['invoices']; 
	}else{
		echo "ERROR";
	}

	//LOOP THROUGH THE INVOICES PAYING
	$arr = explode(",", $invoices);
	foreach( $arr  as $c) {
		$sale_id=$c;
		$sale_bal=sale_bal($sale_id);
		//check if what is paid is greater than a sale bal
		if ($tendered==$sale_bal) { 
			$pay_amount=$sale_bal;
			$balance=0; 
		}elseif ($tendered>$sale_bal) {
			$pay_amount=$sale_bal;
			$balance=0;
		}elseif ($tendered<$sale_bal) { 
			$pay_amount=$tendered;
			$balance=$sale_bal-$tendered;
		}

		if ($tendered>0) {
			if ($balance==0) {
				$sql="UPDATE kp_sales SET sale_bal=0, pay_status=1, pay_day=CURRENT_DATE WHERE sale_id='$sale_id'";
			}elseif ($balance>0) {
				$sql="UPDATE kp_sales SET sale_bal=sale_bal-'$pay_amount', pay_status=3, pay_day=CURRENT_DATE WHERE sale_id='$sale_id'";
			}
			$update_sale=mysqli_query($connection,$sql);
			if ($update_sale) { 
				$cust_bal=cust_bal($cust_id)-$pay_amount;
	 			$update_bal=mysqli_query($connection,"UPDATE kp_customers SET bal='$cust_bal' WHERE cust_id='$cust_id'");
	 			if ($update_bal) {
	 				$create_history = mysqli_query($connection,"INSERT INTO kp_sale_cred_pay_hist(pay_id,sale_id,user_id,cust_id,sale_bal,cf_bal,amount,day) VALUES('$pay_id','$sale_id','$user_id','$cust_id','$sale_bal','$cust_bal','$pay_amount',CURRENT_DATE)") or die("Could not create a new pay hist". mysqli_error($connection));
	 				$tendered=$tendered-$pay_amount;
	 				
	 			}else{
	 				//update bal error
	 			}
	 		}else{
	 			//update sale error
	 		}
		}else{
			break;
		}
	}

	if (track_bank($pay_arr)) {
		if(sale_pay($pay_arr)){
			$action="PAID|". get_cust($cust_id)."|-|-| BALANCE OF ".$total_paid;
			cust_trans($cust_id,"CREDIT PAYMENT","pay_id",$pay_id,$total_paid);
			$log=logs($action,"../../");
			echo "complete";
			?>
			<script type="text/javascript">
				myWindow =window.open('../print/print_pay.php?cust=<?php echo $cust_id; ?>&id=<?php echo $pay_id; ?>', '', 'height=600, width=600');  
			</script>
			<?php
		}else{
			echo "INSERTING PAYMENT ERROR";
		}
	}else{
		echo "TRACKING BANK ERROR";
	}
 
}

function track_bank($pay_arr){
	global $connection; 
	global $sale_id,$user_id;
	foreach($pay_arr as $i) { 
		$bank_id= $i;
		$mode="name".$i; 
		if ($_POST[$mode]==0) {
		}else{
			$bank_id= get_bank_id($i);
			$bank_bal=bank_bal($bank_id); 
			$mode_amount=$_POST[$mode];
			$transa="AMOUNT ADDED FOR CREDIT PAYMENT FOR SALE NO.".$sale_id;
			$create_hist= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','$transa','$mode_amount','$user_id','$bank_bal',CURRENT_DATE)") or die(mysqli_error($connection));
			if ($create_hist) {
				$update_bal = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not set new bank blance");
				if ($update_bal) {
				 	return true;
			 	} else{
			 		$last_id = mysqli_insert_id($connection); 
					$del_hist = mysqli_query($connection,"DELETE FROM kp_bank_hist WHERE id='$last_id'") or die("Could not del hist");
				 	return false;
			 	}
			}else{
				return false;
			}
		}
	}
}
function sale_pay($pay_arr){
	global $connection;
	global $pay_id, $user_id,$cust_id,$total_paid,$today;
	$get_invoices = mysqli_query($connection,"SELECT sale_id FROM kp_sale_cred_pay_hist WHERE pay_id='$pay_id' ORDER BY sale_id ASC") or die("Could not get the paid invoices"); 
		$invoices = array();
		while($row = mysqli_fetch_array($get_invoices)) {
		  $invoices[] = $row['sale_id'];
		}
		$invoices= implode(', ', $invoices);
	$array = array();
	$array2 = array();
	foreach($pay_arr as $i) {
		$ref="moderef".$i;
		$mode="mode".$i;
		$refv="ref".$i; 
		$moden="name".$i; 
		if (empty($_POST[$refv]) ) {
			$moderef=""; 
		}else{ 
			$moderef=",".$ref;
		}
		$refn="ref".$i;
		if (empty($_POST[$refn])) {
			$modeval=""; 
		}else{ 
			$modeval=",'".$_POST[$refn]."'";
		}
		$array[] =  $mode.$moderef;
		$array2[]=$_POST[$moden].$modeval;
	}

	$field_values = array("pay_id","sale_id","user_id","cust_id","tendered","paid_total","pay_date","type");
	$result=array_merge( $field_values,$array);
	 
	$data_values = array($pay_id,"'".$invoices."'",$user_id,$cust_id,$total_paid,$total_paid,"'".$today."'",2);
	$result2=array_merge( $data_values,$array2);
	 
	//$sample=Insertdata("kp_sale_payment", $result, $result2);

	if (Insertdata("kp_sale_payment", $result, $result2)) {
		return true;
	}else{
		return false;
	}
}

 ?>