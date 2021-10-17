<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 

$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id']; 
$dash = $row['dashboard']; 

$sql1 = "UPDATE kp_qt_status SET status=3 WHERE user_id='$user_id' AND qt_id='$qt_id'";
$result = mysqli_query($connection , $sql1) or die('could suspend make sale');
 
 if (!$result) {
 	 
 }else{ 
 	clear_thesion_ids($user_id);
	$action="HELD|-|-|-|QUOTATION|".$qt_id;
	logs($action,"../../");  
	header("Location:../dash/".$dash);
 }
?>