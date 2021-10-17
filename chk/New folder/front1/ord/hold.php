<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$type = $row['sale_type'];
$cust_id = $row['cust_id'];

$sql1 = "UPDATE kp_sale_status SET status=3 WHERE user_id='$user_id' AND sale_id='$sale_id' AND cust_id='$cust_id' AND type='$type' ";
$result = mysqli_query($connection , $sql1) or die('could suspend make sale');
if (!$result){
	
}else{ 
 	clear_thesion_ids($user_id);
	$action="HELD|-|-|-|SALE|".$sale_id;
	logs($action,"../../");  
	header("Location:../dash/".$_SESSION['dash']);
}
?>