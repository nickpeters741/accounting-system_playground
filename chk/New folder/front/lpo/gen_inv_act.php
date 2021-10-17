<?php
session_start();
include('../../inc/connection.php');   

include('funcs.php'); 
$user_id = $_SESSION['user_id']; 
$action="LOADED|-|-|-|CONFIRM INVOICE GENERATE FOR LPO NO |".$lpo_id;
logs($action,"../../"); 
$no=0; 

$lpo_id = $_REQUEST['id']; 
echo $lpo_id;
$cust_id=get_column('kp_lpo','cust_id',"lpo_id='$lpo_id'"); 
$_SESSION['sale']=1; 
$sale_type=2;
$cust_id=$_POST['cust_id'];
$mkt=$_SESSION['user_id'];
$day=today();
$sale_id=last_id($sale_type,$cust_id,$mkt,$day);
sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day);
$get_lpo_items = "SELECT * FROM kp_lpo_items WHERE lpo_id='$lpo_id'";
$get_lpo_items_r = mysqli_query($connection,$get_lpo_items) or die("Could not get the order numbers");
while ($o = mysqli_fetch_assoc($get_lpo_items_r)) {
	$item_id=$o['item_id'];
	$qty=$o['qty'];
	$price=$o['price'];
	$total=$o['total'];
	echo "INSERT INTO kp_sale_items(sale_id,item_id,qty,price,total,day) VALUES('$sale_id','$item_id','$qty','$price','$total','$day')";
	$create_new_id = mysqli_query($connection,"INSERT INTO kp_sale_items(sale_id,item_id,qty,price,total,day) VALUES('$sale_id','$item_id','$qty','$price','$total','$day')") or die(mysqli_error($connection)."Could not create a new order status");
}
?>
<script type="text/javascript">
	 window.location = "../ord/order.php";
</script>
<?php 
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
			$create_new_id = mysqli_query($connection,"INSERT INTO kp_sale_id(sale_id) VALUES(0)") or die("Could not create a new sale id");
			$sale_id = 1;
		}else{
			$last_sale_id = $row['sale_id'];
			$sale_id = $last_sale_id + 1;
		}
		$create_order_status = "INSERT INTO kp_sale_status(sale_id,user_id,cust_id,mkt,type,day) VALUES('$sale_id','$user_id','$cust_id','$mkt','$sale_type','$day')";
		$create_order_status_r = mysqli_query($connection,$create_order_status) or die("Could not create a new sale status");

		$create_last_order_no = "UPDATE kp_sale_id SET sale_id='$sale_id'";
		$create_last_order_no_r = mysqli_query($connection,$create_last_order_no) or die("Could not create a new order number");
	}
	return $sale_id;
}
?>