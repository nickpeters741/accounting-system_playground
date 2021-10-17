<?php
session_start();
include('../../inc/connection.php'); 
include('sale_funcs.php'); 

$user_id = $_SESSION['user_id'];
$id = $_REQUEST['id'];

$check_item_no = mysqli_query($connection,"SELECT qty,item_id,sale_id FROM kp_sale_items WHERE id='$id'") or die(mysqli_error($connection));
$q = mysqli_fetch_assoc($check_item_no);
$qty = $q['qty'];
$item_id = $q['item_id'];
$sale_id = $q['sale_id'];
$update_store = mysqli_query($connection,"UPDATE kp_items SET qty=qty+'$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));

$delete = mysqli_query($connection,"DELETE FROM kp_sale_items WHERE id='$id' ") or die("could not delete sale item". mysqli_error($connection));

$tracking = mysqli_query($connection,"DELETE FROM kp_stock_track WHERE item_id='$item_id' AND sale_id='$sale_id'") or die("Error stock tracking ". mysqli_error($connection));

if(!$delete){
	echo "did not delete";
}else{
	$action="DELETED|".$qty."|".get_item($item_id)."|SALE|".$sale_id;
	logs($action,"../../"); 
}

?>
