<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$folder="back/kugura/";

if (isset($_GET['cont'])) {
	$po_id = $_GET['id'];
	$page= $folder.basename($_SERVER['PHP_SELF']);
	$column="po_id"; 
	update_thesion($column,$po_id,$page);
	$action="CONTINUED LPO NO| ".$po_id;
	$url="../../";
	header("Location: new_po.php");
}else{
	$check_id=mysqli_query($connection,"SELECT po_id FROM kp_po_status WHERE  po_user_id='$user_id' AND po_status=2");
	if (mysqli_num_rows($check_id) > 0) {
		$on = mysqli_fetch_assoc($check_id);
		$po_id = $on['po_id']; 
	}else{ 
		$get_id=mysqli_query($connection,"SELECT po_id FROM kp_po_id");
		if (mysqli_num_rows($get_id) > 0) {
			$update_po = mysqli_query($connection,"UPDATE kp_po_id SET po_id=po_id+1") or die("Could not create a new purchase order number");
		}else{
			$create_id = "INSERT INTO kp_po_id(po_id) VALUES(1)";
			$create_id_r = mysqli_query($connection,$create_id) or die("Could not create a new purchase number"); 
		}
		
		$get_po_r = mysqli_query($connection,"SELECT po_id FROM kp_po_id") or die("Could not get the last purchase id");
		$row = mysqli_fetch_array($get_po_r);
		
		$po_id = $row['po_id'];

		$create_po_status = "INSERT INTO kp_po_status(po_id,po_user_id) VALUES('$po_id','$user_id')";
		$create_po_status_r = mysqli_query($connection,$create_po_status) or die("Could not create a new purchase number"); 
	} 

	$page= $folder.basename($_SERVER['PHP_SELF']);
	$column="po_id"; 
	update_thesion($column,$po_id,$page);
	$action="INITIALISED LPO NO| ".$po_id;
	$url="../../";
	header("Location: new_po.php");
}
?>