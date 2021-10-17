<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 

if (isset($_REQUEST['id'])) {
	$id = $_REQUEST['id'];  
	$delete = mysqli_query($connection,"DELETE FROM kp_po_items WHERE id='$id' AND po_id='$po_id'") or die(mysqli_error($connection));
	if (!$delete) {
		echo "Failed";
	}else{
		$action="DELETED ".get_item($item_id)." FROM PURCHASE ORDER NO | ".$po_id;
		$url="../../";
		logs($action,$url);
	}
}


?>