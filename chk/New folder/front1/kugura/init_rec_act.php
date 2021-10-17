<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];

$po_id = $_GET['id'];

$folder="back/kugura/";

if (isset($_GET['cont'])) {
	$grn_id = $_GET['gid'];
	$page= $folder.basename($_SERVER['PHP_SELF']);
	$column="grn_id"; 
	update_thesion($column,$grn_id,$page);
	$column="po_id"; 
	update_thesion($column,$po_id,$page);
	$action="CONTINUED GRN NO| ".$grn_id;
	$url="../../";
	header("Location: rec_page.php");
}else{
	$check_id=mysqli_query($connection,"SELECT grn_id FROM kp_grn_status WHERE  user_id='$user_id' AND po_id='$po_id'");
	if (mysqli_num_rows($check_id) > 0) {
		$on = mysqli_fetch_assoc($check_id);
		$grn_id = $on['grn_id']; 
	}else{ 
		$get_id=mysqli_query($connection,"SELECT grn_id FROM kp_grn_id");
		if (mysqli_num_rows($get_id) > 0) {
			$update_po = mysqli_query($connection,"UPDATE kp_grn_id SET grn_id=grn_id+1") or die("Could not create a new purchase order number");
		}else{
			$create_id = "INSERT INTO kp_grn_id(grn_id) VALUES(1)";
			$create_id_r = mysqli_query($connection,$create_id) or die("Could not create a new purchase number"); 
		}
		
		$get_po_r = mysqli_query($connection,"SELECT grn_id FROM kp_grn_id") or die("Could not get the last purchase id");
		$row = mysqli_fetch_array($get_po_r);
		
		$grn_id = $row['grn_id'];

		$create_po_status = "INSERT INTO kp_grn_status(grn_id,user_id,po_id) VALUES('$grn_id','$user_id','$po_id')";
		$create_po_status_r = mysqli_query($connection,$create_po_status) or die("Could not create a new purchase number"); 
	} 

	$page= $folder.basename($_SERVER['PHP_SELF']);
	$column="grn_id"; 
	update_thesion($column,$grn_id,$page);
	$column="po_id"; 
	update_thesion($column,$po_id,$page);
	$action="INITIALISED GRN NO| ".$grn_id;
	$url="../../";
	header("Location: rec_page.php");
}
?>