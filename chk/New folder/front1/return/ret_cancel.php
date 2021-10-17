<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];
$dash = $row['dashboard'];
 
$update_items = mysqli_query($connection,"DELETE FROM kp_ret_items WHERE ret_id='$ret_id'") or die(mysqli_error($connection));

$reset_status = mysqli_query($connection,"UPDATE kp_sale_items SET ret_status=2  WHERE sale_id='$sale_id'") or die("Error".mysqli_error($connection));

$update_items = mysqli_query($connection,"DELETE FROM kp_ret_status WHERE ret_id='$ret_id'") or die(mysqli_error($connection));

if (!$reset_status OR !$update_items) {
	echo "Failed!! contact the developer for this kind of error";
}else{
	$action="CANCELLED|-|-|-|  RETUN NO".$ret_id;
	logs($action,"../../"); 
	header("Location:../dash/".$dash);
}