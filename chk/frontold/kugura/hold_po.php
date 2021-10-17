<?php
session_start();
include('../../inc/connection.php');  
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
  
$sql1 = "UPDATE kp_po_status SET po_status=3 WHERE po_user_id='$user_id' AND po_id='$po_id'";
$result = mysqli_query($connection , $sql1) or die('could suspend purchase');
 
if (!$result) { 
 	$action="FAILED TO HOLD PURCHASE NO | ".$po_id;
	$url="../../";
	logs($action,$url);
}else{ 
 	$action="HOLDING SUCCESSFUL FOR PURCHASE ORDER NO | ".$po_id;
	$url="../../";logs($action,$url);
	$update_thesion= mysqli_query($connection,"UPDATE kp_thesion SET po_id=0,datime=CURRENT_TIMESTAMP") or die(mysqli_error($connection));
	unset($_SESSION['po_id']); 
 	header("Location:init_page.php");
 }
?>