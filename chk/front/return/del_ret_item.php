<?php
session_start();
include('../../inc/connection.php');
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];
// $ret_id = $_SESSION['ret_id'];
// $sale_id = $_SESSION['sale_id'];
$item_id = $_REQUEST['item_id'];
 
$delete = mysqli_query($connection,"DELETE FROM kp_ret_items WHERE item_id='$item_id' AND ret_id='$ret_id' ") or die("could not delete sale item". mysqli_error($connection));
$update = "UPDATE kp_sale_items SET ret_status=2 WHERE sale_id='$sale_id' AND item_id='$item_id'";
		$update_r = mysqli_query($connection,$update) or die("Error updating sale items".mysqli_error($connection));
  
if(!$delete){
	echo "did not delete";
}

?>
