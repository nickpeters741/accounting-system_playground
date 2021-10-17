<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];
$qty= $_REQUEST['qty']; 
$item_id= $_REQUEST['item_id'];  
$status= $_REQUEST['status']; 
$stacomment= $_REQUEST['stacomment'];
$reason= $_REQUEST['reason'];
// $imei = $_REQUEST['imei'];
// if ($imei==0) {
// 	$imei="";
// }
$comment= ""; 
$optradio= "";  
$get_price = mysqli_query($connection , "SELECT qty,price,disc FROM kp_sale_items WHERE sale_id='$sale_id' AND item_id='$item_id'") or die(mysqli_error($connection));
$pr = mysqli_fetch_assoc($get_price);
$price = $pr['price'];
$disc = $pr['disc'];
$ord_qty = $pr['qty'];
$amount=$qty*$price;
 
$get_sale_Det = mysqli_query($connection , "SELECT cust_id,type FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
$pr = mysqli_fetch_assoc($get_sale_Det);
$cust_id = $pr['cust_id'];
$sale_type = $pr['type']; 

$get_ret_item = mysqli_query($connection , "SELECT ret_id FROM kp_ret_items WHERE ret_id='$ret_id' AND item_id='$item_id'") or die(mysqli_error($connection));
$pr = mysqli_num_rows($get_ret_item);

if ($pr>1){
?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Warning!!! Item Already return in this return', "Warning");  
	</script>
	<?php
}else{
if (empty($qty)){
	?>
	 <div class="alert alert-warning">
    <p>You cant return empty</p>
  </div>
	<?php
 	 
}else{
	if ($ord_qty<$qty){
?>
<div class="alert alert-warning">
    <p>Customer cant return more than what was Bought</p>
 </div>
<?php
	}else{
		$total=$qty*$price;
		$return = "INSERT INTO kp_ret_items(ret_id,sale_id,item_id,qty,price,total,prod_status,ret_user_comment,reason) VALUES('$ret_id','$sale_id','$item_id','$qty','$price','$total','$status','$stacomment','$reason')";
		$return_r = mysqli_query($connection,$return) or die("Error ceatng return".mysqli_error($connection));

		$update = "UPDATE kp_sale_items SET ret_status=1 WHERE sale_id='$sale_id' AND item_id='$item_id' ";
		$update_r = mysqli_query($connection,$update) or die("Error updating sale items".mysqli_error($connection));


		$action="RETURNED |".$qty." |". get_item($item_id)."|SALE|".$sale_id;
		logs($action,"../../");	
 	
?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Success!!! Returned Successfully', "success");
	    location.reload();  
	</script> 
<?php
}
} 
}
 
?>