<?php
session_start(); 
include('../../inc/connection.php'); 
include('sale_funcs.php');
$url = "../../assets";
page_restrict();

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

salerestrict();
if ($day=='0000-00-00') {
	$day=date('Y-m-d');
}

$order_total=column_total('kp_sale_items','total',"sale_id='$sale_id'");//grand_total($sale_id);

$balance =$_POST['balance']; 
$arr = $_POST['pay-mode'];
$disc = $_POST['disc'];
$store_credit=$_POST['namesc'];
//logistics vars////
$damount = $_POST['deli'];
$means = $_POST['means'];
$beba_sta = $_POST['beba_sta'];
$reg = strtoupper($_POST['reg']);
//logistics vars/////

$sale_amount=$order_total+$damount-$disc;

$tendered=$sale_amount+$balance;

$cust_bal=get_column('kp_customers','bal',"cust_id='$cust_id'");//cust_bal($cust_id);

// $msg="Thank you for visiting our store today, We appriciate your business";
// create_sms($cust_id,$msg);
function deli(){
	global $connection,$damount,$beba_sta,$sale_id,$means,$reg;
	if ($damount==0) {
		return true;
	}else{
		$insert_delivery= mysqli_query($connection,"INSERT INTO kp_logistics(beba_id,sale_id,amount,means,reg,day) VALUES('$beba_sta','$sale_id','$damount','$means','$reg',CURRENT_DATE)") or die(mysqli_error($connection));
		$action="ADDED|-|-|-|LOGISTICS TO SALE NO ".$sale_id;
		logs($action,"../../");
		if ($insert_delivery) {
			return true;
		}else{
			return false;
		}
	}
}
function clear_deli(){
	global $connection,$damount,$beba_sta,$sale_id,$means,$reg;
	if ($damount==0) {
		return true;
	}else{
		$del_delivery= mysqli_query($connection,"DELETE FROM kp_logistics WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
		$action="REMOVED|-|-|-|LOGISTICS FOR SALE NO ".$sale_id;
		logs($action,"../../");
		if ($del_delivery) {
			return true;
		}else{
			return false;
		}
	}
}
function update_bank($arr){
	global $connection, $balance, $sale_id, $user_id;
	foreach($arr as $i) {
		$mode="name".$i;
		if ($_POST[$mode]==0) {
			$bank_id=00;
		}else{
			try { 
				$pay_id= $i;
				// $check_acc=mysqli_query($connection,"SELECT bank_id FROM kp_pay_mode WHERE  pay_id='$pay_id'"); 
				// $on = mysqli_fetch_assoc($check_acc);
				$bank_id=get_column('kp_pay_mode','bank_id',"pay_id='$pay_id'");//$on['bank_id'];
				$bank_balance=get_column('kp_banks','bal',"bank_id='$bank_id'");
				$amount=$_POST[$mode]-$balance; 
				$transa="BANK CREDITED BY RECEIPT NO ".$sale_id;
				$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal + '$amount' WHERE bank_id='$bank_id'");
				if ($update_bank) {
					$track_bank= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','$transa','$amount','$user_id','$bank_balance',CURRENT_DATE)") or die("Could not insert bank history".mysqli_error($connection));
					if ($track_bank) {
						$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal-'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance ".mysqli_error($connection));
					}
				}	
				
			} catch (Exception $e) {
		      return false;
		   }
		}

	}
	return true;
}
function store_cred(){
	global $connection,$store_credit,$cust_id,$sale_id,$sale_type,$user_id;
	if ($store_credit >0) { 
		$trans="CASH SALE PAYMENT"; 
		$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET amount=amount-'$store_credit'") or die(mysqli_error($connection));
		if ($update_wallet) {
			$create_history = mysqli_query($connection,"INSERT INTO kp_sc_hist(cust_id,amount,trans,user_id,trans_id,trans_type,day) VALUES('$cust_id','$store_credit','$trans','$user_id','$sale_id','$sale_type',CURRENT_DATE)") or die(mysqli_error($connection));
			if ($create_history) {
				return true;
			}else{
				$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET amount=amount+'$store_credit'") or die(mysqli_error($connection));
				return false;
			}
		}else{
			return false;
		}
	}else{
		return true;
	}
}
function store_cred_clear(){
	global $connection,$store_credit,$cust_id,$sale_id,$sale_type,$user_id;
	$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET amount=amount+'$store_cred' WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
	$delete_sale = mysqli_query($connection,"DELETE FROM kp_sc_hist  WHERE trans_id='$sale_id' AND day=CURRENT_DATE") or die("Error undo sc".mysqli_error($connection)); 
}
function insert_payments(){
	global $connection, $balance, $sale_id, $user_id,$arr,$store_credit,$sale_amount,$day,$tendered,$cust_id;
	$array = array();
	$array2 = array();
	foreach($arr as $i) {
		$ref="moderef".$i;
		$mode="mode".$i;
		$refv="ref".$i;
		$modename="name".$i; 
		if (empty($_POST[$refv]) ) {
			$moderef="";
		}else{ 
			$moderef=",".$ref;
		}
		$array[] =  $mode.$moderef;

		if (empty($_POST[$refv])) {
			$modeval=""; 
		}else{ 
			$modeval=",'".$_POST[$refv]."'";
		}
		$array2[]=$_POST[$modename]-$balance.$modeval;
	}

	if (store_cred()) {
		$pay_id=pay_id(); 
		$field_values = array("pay_id","sale_id","user_id","cust_id","tendered","balance","pay_date","paid_total","type");
		$result=array_merge( $field_values,$array);

		$data_values = array($pay_id,$sale_id,$user_id,$cust_id,$tendered,$balance,"'".$day."'",$sale_amount,1);
		$result2=array_merge( $data_values,$array2); 

		if(Insertdata("kp_sale_payment", $result, $result2)){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}
function sale_payment_clear(){
	global $connection;
}
function update_bank_undo($arr){
	global $connection, $balance, $sale_id, $user_id;
	foreach($arr as $i) {
		$mode="name".$i;
		$bcheck=is_int($i);
		if ($_POST[$mode]==0) {
			$bank_id=00;
		}else{
			try { 
				$pay_id= $i;
				$check_acc=mysqli_query($connection,"SELECT bank_id FROM kp_pay_mode WHERE  pay_id='$pay_id'"); 
				$on = mysqli_fetch_assoc($check_acc);
				$bank_id=$on['bank_id'];
				$mode_amount=$_POST[$mode]-$balance; 
				$bank_balance=bank_bal($bank_id);
				$transa="BANK DEBITED BY RECEIPT NO ".$sale_id." ERROR";
				$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal-'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance ".mysqli_error($connection));
				if ($update_bank) {
					$track_bank= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','$transa','$mode_amount','$user_id','$bank_balance',CURRENT_DATE)") or die("Could not insert bank history".mysqli_error($connection));
					if ($track_bank) {
						$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal-'$mode_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance ".mysqli_error($connection));
					}
				}	
				
			} catch (Exception $e) {
		        return false;
		    }
		    return true;
		}

	}
}

if (empty($arr) OR !$arr) { 
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Warning!!! You have to select Paymet Mode', "warning"); 
	</script>
	<?php
}else{
	if (deli()) { 
		if (update_bank($arr)){
			//echo "OK 3 BANK UPDATED <BR>";
	 		if (insert_payments()) {
	 			//echo "OK 4 PAYMENTS INSERTED <BR>";
	 			$gate = $_POST['gate']; 
				$garr = explode(",", $gate); 
				foreach($garr as $c) { 
					$update_wallet=mysqli_query($connection,"UPDATE split_message SET status=1 WHERE code='$c'") or die(mysqli_error($connection));
				}
	 			$create_sale = mysqli_query($connection,"INSERT IGNORE INTO kp_sales(sale_id,cust_id,user_id,sale_amount,disc,total_amount,type,pay_status,day,delivery,mktr,refno,cf_bal) VALUES('$sale_id','$cust_id','$user_id','$order_total','$disc','$sale_amount','$sale_type',1,'$day','$damount','$mkt',0,'$cust_bal')") or die(mysqli_error($connection));
	 			if ($create_sale) {
	 			 	$clear_sale_status = mysqli_query($connection,"DELETE FROM kp_sale_status  WHERE sale_id='$sale_id'") or die("Error".mysqli_error($connection));
	 			 	if ($clear_sale_status) {
						cust_trans($cust_id,"SALE","sale_id",$sale_id,$sale_amount);
						$action="PLACED|-|-|-| SALE NO ".$sale_id;
						logs($action,"../../"); 
						?>
						<script type="text/javascript">
							window.location = "../print/print_credit.php";
						</script>  
						<?php
					}else{
						?>
						<script type="text/javascript">
							window.location = "../print/print_credit.php"; 
						</script>
						<?php
					}
	 			}else{
		 			update_bank_undo($arr);
		 			store_cred_clear();
	 				?>
					<script type="text/javascript">
						var hulla = new hullabaloo();
						hulla.send('Warning!!! System Colud not create history.!!! Call for assistance.', "warning"); 
					</script>
					<?php
	 			} 
	 		}else{
	 			update_bank_undo($arr);
	 			store_cred_clear();
	 			?>
				<script type="text/javascript">
					var hulla = new hullabaloo();
					hulla.send('Warning!!! System Colud not insert payments.!!! Call for assistance.', "warning"); 
				</script>
				<?php
	 		}
		}else{
			clear_deli();
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send('Warning!!! System Colud not Update Bank.!!! Call for assistance.', "warning"); 
			</script>
			<?php
		}
	}else{
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send('Warning!!! System Colud not record Delivery.!!!if this persists call for assistance.', "warning"); 
		</script>
		<?php
	}
}
 

?>