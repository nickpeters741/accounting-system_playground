<?php
$filename = "../../inc/gen_funcs.php";
if (file_exists($filename)){
    include('../../inc/gen_funcs.php');
}elseif (file_exists("../inc/gen_funcs.php")){
    include('../inc/gen_funcs.php');
}else{
    
}


function petty_id(){
	global $connection;
	$get_table = "SELECT petty_id FROM kp_petty_id";
	$get_table_r = mysqli_query($connection,$get_table) or die("Could not get petty id");
	$row = mysqli_fetch_array($get_table_r);
	if (empty($row)) { 
		$create_new_id = mysqli_query($connection,"INSERT INTO kp_petty_id(petty_id) VALUES(1)") or die("Could not create a new petty id");
		$petty_id = 1;
	}else{
		$last_id = $row['petty_id'];
		$petty_id = $last_id + 1;
		$create_petty = mysqli_query($connection,"UPDATE kp_petty_id SET petty_id=petty_id+1") or die(mysqli_error($connection));
	}
	// $get_petty_r = mysqli_query($connection,"SELECT petty_id FROM kp_petty_id") or die("Could not get the last purchase id");
	// $row = mysqli_fetch_array($get_petty_r);
	// $petty_id = $row['petty_id']; 
	return $petty_id;
}
// function bank_bal($bank_id){
// 	global $connection;
// 	$check_bals=mysqli_query($connection,"SELECT bal FROM kp_banks WHERE  bank_id='$bank_id'"); 
// 	$on = mysqli_fetch_assoc($check_bals);
// 	$bal = $on['bal'];
	
// 	return $bal;
// }

// function sale_type($sale_id){
// 	global $connection;
// 	$check_type=mysqli_query($connection,"SELECT type FROM kp_sales WHERE  sale_id='$sale_id'"); 
// 	$on = mysqli_fetch_assoc($check_type);
// 	$type = $on['type'];
// 	return $type;
//   }
 

function user_id($pass){
	global $connection;
	$verify = mysqli_query($connection,"SELECT user_id FROM kp_users WHERE cabi='$pass'") or die("Could not verify the password".mysqli_error($connection));
	$row = mysqli_fetch_assoc($verify);
	$user_id=$row['user_id'];
	return $user_id; 
}



function last_id($sale_type,$cust_id,$mkt,$day){
global $connection;
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$shop = $row['shop'];
$check_order=mysqli_query($connection,"SELECT sale_id FROM kp_sale_status WHERE  user_id='$user_id' AND cust_id='$cust_id' AND status=2 AND type='$sale_type'");
if (mysqli_num_rows($check_order) > 0) {
	$on = mysqli_fetch_assoc($check_order);
	$sale_id = $on['sale_id'];
}else{
	$get_table = "SELECT sale_id FROM kp_sale_id";
	$get_table_r = mysqli_query($connection,$get_table) or die("Could not get the order numbers");
	$row = mysqli_fetch_array($get_table_r);
	if (empty($row)) { 
		$create_new_id = mysqli_query($connection,"INSERT INTO kp_sale_id(sale_id) VALUES(0)") or die("Could not create a new order status");
		$sale_id = 1;
	}else{
		$last_sale_id = $row['sale_id'];
		$sale_id = $last_sale_id + 1;
	}
	$create_order_status = "INSERT INTO kp_sale_status(sale_id,user_id,cust_id,mkt,type,day,shop) VALUES('$sale_id','$user_id','$cust_id','$mkt','$sale_type','$day','$shop')";
	$create_order_status_r = mysqli_query($connection,$create_order_status) or die("Could not create a new order status");

	$create_last_order_no = "UPDATE kp_sale_id SET sale_id='$sale_id'";
	$create_last_order_no_r = mysqli_query($connection,$create_last_order_no) or die("Could not create a new order number");
}
return $sale_id;

}

function req_id()
{
global $connection;	
$user_id = $_SESSION['user_id'];
$check_id=mysqli_query($connection,"SELECT req_id FROM kp_req_status WHERE  user_id='$user_id' AND status=2");
if (mysqli_num_rows($check_id) > 0) {
$on = mysqli_fetch_assoc($check_id);
$req_id = $on['req_id'];
$_SESSION['req_id']=$req_id;

}else{ 
$create_req = mysqli_query($connection,"UPDATE req_id SET req_id=req_id+1") or die("Could not create a new order number");
$get_order_r = mysqli_query($connection,"SELECT req_id FROM req_id") or die("Could not get the last Req id");
$row = mysqli_fetch_array($get_order_r);
$req_id = $row['req_id'];

$create_req_status = "INSERT INTO req_status(req_id,user_id) VALUES('$req_id','$user_id')";
$create_req_status_r = mysqli_query($connection,$create_req_status) or die("Could not create a new requision number");
$_SESSION["req_id"]=$req_id;
}}

function sale_req($sale_id){
	global $connection;	
	$user_id = $_SESSION['user_id'];
		$get_req_id = mysqli_query($connection,"SELECT req_id FROM kp_req_id") or die("Could not get the last requisition id".mysqli_error($connection));
		$row = mysqli_fetch_array($get_req_id);
		 if (empty($row)) { 
			$create_new_id = mysqli_query($connection,"INSERT INTO kp_req_id(req_id) VALUES(0)") or die("Could not create a new req id".mysqli_error($connection));
			$req_id =1; 
		}else{
			$last_req_id = $row['req_id'];
			$req_id = $last_req_id + 1;
		}
		$update_req = mysqli_query($connection,"UPDATE kp_req_id SET req_id='$req_id'") or die("Could not create a new purchase order number".mysqli_error($connection));
	$_SESSION["req_id"]=$req_id;
	$get_sale_items = mysqli_query($connection,"SELECT * FROM kp_sale_items WHERE sale_id='$sale_id'");

	while ($row = mysqli_fetch_assoc($get_sale_items)) {
		$item_id=$row['item_id'];
		$qty=$row['qty'];
	 	$create_req_items = mysqli_query($connection,"INSERT INTO kp_req_items(req_id,item_id,req_qty,req_user) VALUES('$req_id','$item_id','$qty','$user_id')") or die("Could not create a new req".mysqli_error($connection));
	}

	$create_req = mysqli_query($connection,"INSERT INTO kp_req(req_id,sale_id,req_user,req_date,req_type) VALUES('$req_id','$sale_id','$user_id',CURRENT_DATE,3)") or die("Could not create a new req".mysqli_error($connection));

	return true;
}
function credit_note($sale_id,$type,$user_id,$cr_amount,$dr_amount,$ret_id){
	global $connection;	 
	$get_note_id = mysqli_query($connection,"SELECT note_id FROM kp_note_id") or die("Could not get the last requisition id".mysqli_error($connection));
	$row = mysqli_fetch_array($get_note_id);
	 if (empty($row)) { 
		$create_new_id = mysqli_query($connection,"INSERT INTO kp_note_id(note_id) VALUES(0)") or die("Could not create a new note id".mysqli_error($connection));
		$note_id =1; 
	}else{
		$last_note_id = $row['note_id'];
		$note_id = $last_note_id + 1;
	}
	$_SESSION['note_id']=$note_id;
	$update_note = mysqli_query($connection,"UPDATE kp_note_id SET note_id='$note_id'") or die("Could not create a new purchase order number".mysqli_error($connection));
 
	$ret_amount= round(ret_total($ret_id),2);

	$create_req = mysqli_query($connection,"INSERT INTO kp_note(note_id,sale_id,ret_id,user_id,date,type,amount,cr_amount,dr_amount) VALUES('$note_id','$sale_id','$ret_id','$user_id',CURRENT_DATE,'$type','$ret_amount','$cr_amount','$dr_amount')") or die("Could not create a new note".mysqli_error($connection));
	 
	return true;
}
function undo_note_payment($ret_id){
	global $connection;
	$get_note_id = mysqli_query($connection,"SELECT note_id FROM kp_note WHERE ret_id='$ret_id'") or die("Could not get the return note id".mysqli_error($connection));
	$now = mysqli_fetch_array($get_note_id);
	$note_id=$now['note_id'];

	$get_sale_id = mysqli_query($connection,"SELECT pay_id,sale_id,amount_paid FROM kp_sale_cred_pay_hist WHERE note_id='$note_id'") or die(mysqli_error($connection));
	while ($s=mysqli_fetch_assoc($get_sale_id)) {
		$amount=$s['amount_paid'];
		$sale_id=$s['sale_id'];
		$pay_inv=mysqli_query($connection,"UPDATE kp_sales SET sale_bal=sale_bal+'$amount', pay_status=2, date_paid=CURRENT_DATE WHERE sale_id='$sale_id'");
	}
	$remove_credit = mysqli_query($connection,"DELETE FROM kp_sale_cred_pay_hist WHERE note_id='$note_id'") or die("Could not clear sale credit payment");
	return true;
}
function sale_note_payment($cust_id,$amount,$sale_id){
	global $connection;
	if ($amount==0) {
		
	}else{
		$pay_id = pay_id();
		$user_id=$_SESSION['user_id'];
		$get_note_id = mysqli_query($connection,"SELECT note_id FROM kp_note_id") or die("Could not get the last requisition id".mysqli_error($connection));
		$now = mysqli_fetch_array($get_note_id);
		$note_id=$now['note_id'];
		$get_sale_bal = mysqli_query($connection,"SELECT sale_bal FROM kp_sales WHERE sale_id='$sale_id' AND pay_status!=1") or die(mysqli_error($connection));
		$s=mysqli_fetch_assoc($get_sale_bal); 
		$sale_bal = $s['sale_bal'];
	 
		$create_history = mysqli_query($connection,"INSERT INTO kp_sale_cred_pay_hist( pay_id,note_id,sale_id,user_id,cust_id,sale_bal,amount_paid,day) VALUES('$pay_id','$note_id','$sale_id','$user_id','$cust_id','$sale_bal','$amount',CURRENT_DATE)") or die("Could not create a new pay hist IN GREATER". mysqli_error($connection));

		$field_values = array("pay_id","sale_id","user_id","cust_id","tendered","paid_total","pay_date","type");
	$result=array_merge( $field_values,$array);
	 
	$data_values = array($pay_id,"'".$invoices."'",$user_id,$cust_id,$total_paid,$total_paid,"'".$today."'",2);
	$result2=array_merge( $data_values,$array2); 

		$current_bal=$sale_bal-$amount;
		if ($current_bal==0) {
			$pay_inv=mysqli_query($connection,"UPDATE kp_sales SET sale_bal=sale_bal-'$amount', pay_status=1, pay_day=CURRENT_DATE WHERE sale_id='$sale_id'"); 
		}else{
			$pay_inv=mysqli_query($connection,"UPDATE kp_sales SET sale_bal=sale_bal-'$amount', pay_status=3, pay_day=CURRENT_DATE WHERE sale_id='$sale_id'"); 
		}
	}
 
	return true;
}
function sale_bal($sale_id){
	global $connection;
	$check_bal=mysqli_query($connection,"SELECT sale_bal FROM kp_sales WHERE  sale_id='$sale_id'"); 
	$on = mysqli_fetch_assoc($check_bal);
	$sale_bal = $on['sale_bal'];
	return $sale_bal;
}
function has_sn($cat_id){
	global $connection;
	$get_has= mysqli_query($connection,"SELECT has_sn FROM category WHERE cat_id='$cat_id'") or die(mysqli_error($connection));
	$n = mysqli_fetch_assoc($get_has);
	$val = $n['has_sn']; 
	return $val;
}
function check_imei($imei){
	global $connection;
	$get_imei= mysqli_query($connection,"SELECT item_imei FROM kp_item_imei WHERE item_imei='$imei'") or die(mysqli_error($connection));
	$n = mysqli_num_rows($get_imei);
	if ($n<1) {
		return true;
	}else{
		return false;
	}
}
function received_qty($po_id,$item_id){
	global $connection;
	$get_imei= mysqli_query($connection,"SELECT item_imei FROM kp_item_imei WHERE po_id='$po_id' AND item_id='$item_id'") or die(mysqli_error($connection));
	$n = mysqli_num_rows($get_imei);
	if ($n<1) {
		return 0;
	}else{
		return $n;
	}
}
function regulate_access(){
	global $connection;
	if (empty($_SESSION['staff_id']) OR !isset($_SESSION['staff_id']) OR empty($_SESSION['username']) OR !isset($_SESSION['username'])) {
		header("Location:../index.php?msg=2");
	}
}

// function page_restrict(){
// 	global $connection;
// 	if (empty($_SESSION['user_id'])) {
// 		header("Location:../../log_out.php");
// 	}
// }

function total_pending_orders(){
	global $connection;

	$pending_orders = mysqli_query($connection,"SELECT * FROM orders WHERE delivery_status=2") or die("No pending orders fetched");
	$total = mysqli_num_rows($pending_orders);
	

	echo $total;
}
// function customer_name($cust_id){
// 	global $connection;

// 	$get_name= mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$cust_id'") or die("No pending orders fetched");
// 	$n = mysqli_fetch_assoc($get_name);

// 	$name = $n['name']; 
	
//  return $name;
// }
// function get_cust($cust_id){
// 	global $connection;

// 	$get_name= mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$cust_id'") or die("No pending orders fetched");
// 	$n = mysqli_fetch_assoc($get_name);

// 	$name = $n['name']; 
	
//  return $name;
// }
// function get_mkt($mkt){
// 	global $connection;

// 	$get_name= mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$mkt'") or die("No users available");
// 	$n = mysqli_fetch_assoc($get_name);

// 	$name = $n['user_username']; 
// 	if (empty($name)) {
// 		$name= "-";
// 	}else{
// 		echo $name;
// 	}
// }
// function mkt_name($mkt){
// 	global $connection;

// 	$get_name= mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$mkt'") or die("No users available");
// 	$n = mysqli_fetch_assoc($get_name);

// 	$name = $n['user_username']; 
// 	if (empty($name)) {
// 		$name= "-";
// 	}else{
// 		echo $name;
// 	}
// }
function total_orders(){
	global $connection;
	$today = date('Y-m-d');

	$get_total_orders = mysqli_query($connection,"SELECT * FROM orders WHERE delivery_status=1");

	$total = mysqli_num_rows($get_total_orders);

	return $total;
}

function access_type(){
	global $connection;
	$access_type = $_SESSION['access_type'];

	if ($access_type == 1) {
		header("Location:index.php");
	}elseif ($access_type == 2) {
		header("Location:sales.php");
	}else{
		header("Location:../log_out.php");
	}


}
// function cust_bal($cust_id){
// 	global $connection;
// 	$check_payments = mysqli_query($connection,"SELECT bal FROM kp_customers WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
//     $py = mysqli_fetch_assoc($check_payments);
//     $bal = $py['bal'];
//     return $bal;
// }

function sale_amount($id){
	global $connection;

	$sale_amount = mysqli_query($connection,"SELECT SUM(total_amount) AS total  FROM kp_sales WHERE sale_id='$id'");
	$row = mysqli_fetch_assoc($sale_amount);
	$total = $row['total'];

	return $total; 

}
function total_item_sales($item_id){
	global $connection;

	$sale_amount = mysqli_query($connection,"SELECT SUM(total) AS total  FROM kp_sales WHERE item_id='$item_id'");
	$row = mysqli_fetch_assoc($sale_amount);
	$total = $row['total'];

	echo $total; 
}

function credit_discount(){
	global $connection;

	$sale_id = $_SESSION['sale_id'];
    $get_sum = mysqli_query($connection,"SELECT SUM(disc) AS disc_total FROM kp_sale_items WHERE sale_id='$sale_id'");
    $row_sum = mysqli_fetch_assoc($get_sum);

    $credit_discount = $row_sum['disc_total'];

    return $credit_discount;                                         
}

function ret_total($ret_id){
	global $connection; 
    $get_sum = mysqli_query($connection,"SELECT SUM(total) AS gtotal FROM kp_ret_items WHERE ret_id='$ret_id'");
    $row_sum = mysqli_fetch_assoc($get_sum);
    $total = $row_sum['gtotal'];
    return $total;                                         
}

function credit_total($sale_id){
	global $connection; 
    $get_sum = mysqli_query($connection,"SELECT SUM(total) AS grand_total FROM kp_sale_items WHERE sale_id='$sale_id'");
    $row_sum = mysqli_fetch_assoc($get_sum);
    $credit_total = $row_sum['grand_total'];
    return $credit_total;                                         
}
function deli_amount($sale_id){
	global $connection; 
    $get_deli = mysqli_query($connection,"SELECT amount FROM kp_logistics WHERE sale_id='$sale_id'");
    $row_deli = mysqli_fetch_assoc($get_deli);
    if (empty($row_deli)) {
    	$deli_total = 0;
    }else{
    	$deli_total = $row_deli['amount']; 
    }
    return $deli_total;                                         
}

function grand_total($sale_id){
	global $connection;
	$get_sum = mysqli_query($connection,"SELECT SUM(total) AS grand_total FROM kp_sale_items WHERE sale_id='$sale_id'");
    $row_sum = mysqli_fetch_assoc($get_sum);
    $grand_total = $row_sum['grand_total'];
    return $grand_total;                                         
}

function credit_paid($sale_id){
	global $connection;

	$paid_sum = mysqli_query($connection,"SELECT SUM(amount) AS paid_total FROM credit_payment WHERE sale_id='$sale_id'");
	$row = mysqli_fetch_assoc($paid_sum);

	$check_num = mysqli_query($connection,"SELECT * FROM credit_payment WHERE sale_id='$sale_id'");
	if (mysqli_num_rows($check_num) < 1) {
		$paid_total = 0;
	}else{
		$paid_total = $row['paid_total'];
	}
	return $paid_total;
}
function credit_balance($sale_id){
	global $connection;

	$sale_total = credit_total($sale_id);
	$paid_total = credit_paid($sale_id);

	$total_balance = $sale_total - $paid_total;

	return $total_balance;
}
function reorder_alerts(){
	global $connection;
	$get_reorder = mysqli_query($connection,"SELECT item_id FROM items WHERE reorder>=qty") or die(mysqli_error($connection)); 
        $rows=mysqli_num_rows($get_reorder);
          
	return $rows;
}
function sales_alerts(){
	global $connection;
$today = date('Y-m-d');
	
	$get_sales = mysqli_query($connection,"SELECT * FROM sales WHERE day='$today'") or die("Could not feth all the items");
     if (mysqli_num_rows($get_sales) < 1) {
         $sales=0;
                    
               }else{
        $sales=mysqli_num_rows($get_sales);
         }

	return $sales;
}
function requisition_alerts(){
	global $connection;

	$get_number = mysqli_query($connection,"SELECT * FROM requisitions WHERE apr_status=2");
	$reqalerts = mysqli_num_rows($get_number);

	return $reqalerts;
}
function purchase_alerts(){
	global $connection;

	$get_number = mysqli_query($connection,"SELECT po_id FROM po WHERE rec_status=2");
	$reqalerts = mysqli_num_rows($get_number);

	return $reqalerts;
}
function stock_out_alert(){
	global $connection;

	$get_number = mysqli_query($connection,"SELECT item_id FROM items WHERE qty<=0");
	$reqalerts = mysqli_num_rows($get_number);

	return $reqalerts;
}

function store_quantity($item_id){
	global $connection;

	$item_quantity = mysqli_query($connection,"SELECT qty FROM  store WHERE item_id='$item_id'");
	$row = mysqli_fetch_assoc($item_quantity);

	if (mysqli_num_rows($item_quantity) < 1) {
		$quantity = 0;
	}else{
		$quantity = $row['qty'];
	}

	

	return $quantity;
}
// function get_item($item_id){
// 	global $connection;
// 	$get_item= mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'");
// 	$row = mysqli_fetch_assoc($get_item);
// 	$name = strtoupper($row['stock_code'])." ".strtoupper($row['name']);
// 	return $name;

// }

// function get_bank_id($pay_id){ 
// 	global $connection; 
// 	$get_bank_id= mysqli_query($connection,"SELECT bank_id FROM kp_pay_mode WHERE  pay_id='$pay_id'") or die("Could not get the last pay id");
// 	$pow = mysqli_fetch_array($get_bank_id);
// 	$bank_id = $pow['bank_id'];
// 	return $bank_id;
// }

// function get_beba($sale_id){
// 	global $connection;
// 	$get_beba = "SELECT beba_id FROM kp_logistics WHERE sale_id =$sale_id";
// 	$get_beba_r = mysqli_query($connection , $get_beba) or die ("could  not get beba");
// 	if (mysqli_num_rows($get_beba_r)<1) {
// 		$name='........................................ ';
// 	}else{
// 	$bet = mysqli_fetch_assoc($get_beba_r);
// 	$beba_id = $bet['beba_id'];
// 	$beba_details = mysqli_query($connection,"SELECT name FROM kp_beba WHERE beba_id='$beba_id'");
// 	$cet = mysqli_fetch_assoc($beba_details);
// 	$name = $cet['name'];
// 	}
// 	return strtoupper($name);
// }


// function get_customer($cust_id){
// 	global $connection;
// 	$cust_details = mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$cust_id'");
// 	$cet = mysqli_fetch_assoc($cust_details);
// 	$cust_name = $cet['name'];
// 	return $cust_name;
// }

// function get_staff($user_id){
// 	global $connection;
// 	$details = mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$user_id'");
// 	$det = mysqli_fetch_assoc($details);
// 	$user_name = $det['user_username'];
// 	return $user_name;
// }

// function get_user($user_id){
// 	global $connection;
// 	$get_user= mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$user_id'");
// 	$row = mysqli_fetch_assoc($get_user);
// 	$name = strtoupper($row['user_username']);
// 	return $name;
// }
 
// function get_supplier($sup_id){
// 	global $connection;
// 	$get_supplier= mysqli_query($connection,"SELECT * FROM kp_suppliers WHERE sup_id='$sup_id'");
// 	$row = mysqli_fetch_assoc($get_supplier);
// 	$name = strtoupper($row['sup_name']);
// 	return $name;
// }
// function po_total($po_id){
// 	global $connection;
	  
// 	$total_po = mysqli_query($connection,"SELECT SUM(total) AS gtotal FROM kp_po_items WHERE po_id='$po_id'") or die("Error");
// 	$row = mysqli_fetch_assoc($total_po);
// 	$total = $row['gtotal'];
	 
// 	return $total;

// }
// function update_po($po_id){
// 	global $connection;
// 	$user_id=$_SESSION['user_id'];
// 	$po = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE rec_status=2 AND po_id='$po_id'") or die("Could not fetch the purchase orders");
// 	if ( mysqli_num_rows($po)==0) {
// 	     $update_po = mysqli_query($connection,"UPDATE kp_po SET rec_status=1,rec_staff='$user_id', rec_date=CURRENT_DATE WHERE po_id='$po_id' ");
// 	}
// }

function fetchitems(){
global $connection;
$selectBoxOption1 = '';
$sql1 = "SELECT item_id,name,stock_code FROM  kp_items";
$result = mysqli_query($connection , $sql1) or die('could not fetch items');
	$selectBoxOption1 .="<option value = '0' selected>"."----SELECT ITEM-----"."</option>";
while($row = mysqli_fetch_assoc($result)){   
    $selectBoxOption1 .="<option value = '".$row['item_id']."'>".$row['stock_code']." ".$row['name']."</option>"; 
}
echo $selectBoxOption1;
}

// function Insertdata($table,$field,$data){
// 	global $connection;
// 	$field_values= implode(',',$field);
// 	$data_values=implode(',',$data);
// 	$sql="INSERT INTO ".$table." (".$field_values.") VALUES (".$data_values.")"; 
// 	$result=$connection->query($sql);
//   	//echo $sql;
//   	return true;
	 
// }

function error_logs($loc,$action){
	global $connection;
	date_default_timezone_set("Africa/Nairobi");
	$day=date('Y-m-d')."-errors"; 
	$today=date('d-M-Y h:i:sa');
	 
	//The name of the file that we want to create if it doesn't exist.
	$file = '../../assets/logs/errors/'.$day.'.txt';
	
	//Use the function is_file to check if the file already exists or not.
	if(!is_file($file)){
	    //Some simple example content.
	    $contents =$today."|".$loc."|".$action;
	    //Save our content to the file.
	    file_put_contents($file, $contents);
	}else{

	$text = PHP_EOL.date('d-M-Y h:i:sa')."|".$loc."|".$action;
	file_put_contents($file, $text, FILE_APPEND);
	}

}
function qt_total($qt_id){
	global $connection;
	  
	$total_qt = mysqli_query($connection,"SELECT SUM(total) AS gtotal FROM kp_qt_items WHERE qt_id='$qt_id'") or die("Error");
	$row = mysqli_fetch_assoc($total_qt);
	$total = $row['gtotal'];
	 
	return $total;
}
function update_req($req_id){
	global $connection;
	$user_id=$_SESSION['staff_id'];
	$req = mysqli_query($connection,"SELECT * FROM kp_req_items WHERE rec_status=2 AND req_id='$req_id'") or die("Could not fetch the purchase orders");
	if ( mysqli_num_rows($req)==0) {
	     $update_req = mysqli_query($connection,"UPDATE kp_req SET rec_status=1,rec_staff='$user_id', rec_date=CURRENT_DATE WHERE req_id='$req_id' ");
	}
}

function sale_pay_status($sale_id){
	global $connection; 
	$sps = mysqli_query($connection,"SELECT pay_status FROM kp_sales WHERE sale_id='$sale_id'");
	$sow = mysqli_fetch_array($sps);
	if ($sow['pay_status']==1) {
	    return "PAID";
	}elseif ($sow['pay_status']==2) {
		return "NOT PAID";
	}
}
/* backup the db OR just a table */

// function cashier_torders($user_id,$today){
// 	global $connection;
// 	$torers = mysqli_query($connection,"SELECT COUNT(user_id) as torders FROM kp_sales WHERE user_id='$user_id' AND  day='$today'");
// 	$to = mysqli_fetch_assoc($torers); 
// 	return $to['torders'];
// }


// function mkt_summary($mktr,$today){
// 	global $connection;
// 	$mktorders = mysqli_query($connection,"SELECT SUM(sale_amount) as total,COUNT(mktr) as mktorders FROM kp_sales WHERE mktr='$mktr' AND  day='$today'");
// 	$to = mysqli_fetch_assoc($mktorders); 
// 	return array($to['mktorders'],$to['total']);
// }

// function cashier_payments($user_id,$today){
// 	global $connection;
 
// 	return array(10,20,100);
// }

function cust_store_credit($cust_id){
	global $connection;
	$wallet_bal = mysqli_query($connection,"SELECT amount FROM kp_sc WHERE cust_id='$cust_id'");
	$to = mysqli_fetch_assoc($wallet_bal); 
	$wall= mysqli_num_rows($wallet_bal);
	if ($wall<1) {
		$amount=0;
	}else{
		$amount=$to['amount'];
	}
	return $amount;
}

// function item_stores($item_id){
// 	global $connection;
// 	$stores = mysqli_query($connection,"SELECT store_id FROM kp_items WHERE item_id='$item_id'");
// 	$to = mysqli_fetch_assoc($stores); 
// 	$store_id=$to['store_id'];

// 	return $store_id;
// }
// function get_store($store_id){
// 	global $connection;
// 	$total=0;
// 	$get_items = mysqli_query($connection,"SELECT * FROM kp_store WHERE store_id='$store_id'") or die("Could not get any items");
// 	$row = mysqli_fetch_assoc($get_items);
 
// 	return $row['name'];
// }
 
?>