<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];

$sql1 = "UPDATE kp_ret_status SET status=3 WHERE user_id='$user_id' AND sale_id='$sale_id' AND ret_id='$ret_id'";
$result = mysqli_query($connection , $sql1) or die('could suspend make sale');
 
 if (!$result) {
 	 
 }else{ 
 	$action="HELD|-|-|-|  RETUN NO".$ret_id;
	logs($action,"../../");  
 	header("Location:../dash");
 }
?>