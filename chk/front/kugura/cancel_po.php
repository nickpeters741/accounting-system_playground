<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 
 if ($po_id==0) {
  //header("Location: init_page.php");
}else{
$update_items = mysqli_query($connection,"DELETE FROM kp_po_items WHERE po_id='$po_id'") or die(mysqli_error($connection));

$reset_status = mysqli_query($connection,"DELETE FROM kp_po_status WHERE po_id='$po_id'") or die("Error");

if (!$reset_status OR !$update_items) {
	echo "Failed!! contact the developer for this kind of error";
}else{
	$update_thesion= mysqli_query($connection,"UPDATE kp_thesion SET po_id=0,datime=CURRENT_TIMESTAMP WHERE user_id='$user_id'") or die(mysqli_error($connection));
	$action="CANCELING SUCCESSFUL FOR PURCHASE ORDER NO | ".$po_id;
	$url="../../";logs($action,$url);
	
	header("Location:init_page.php");
}
}