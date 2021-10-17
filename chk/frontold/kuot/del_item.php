<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id']; 
$item_id = $_REQUEST['item_id'];

// $check_item_no = mysqli_query($connection,"SELECT qty FROM kp_s_items WHERE item_id='$item_id' AND sale_id='$sale_id'") or die(mysqli_error($connection));
// $q = mysqli_fetch_assoc($check_item_no);
// $qty = $q['qty'];
// $update_store = mysqli_query($connection,"UPDATE kp_items SET qty=qty+'$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));

$delete = mysqli_query($connection,"DELETE FROM kp_qt_items WHERE item_id='$item_id' AND qt_id='$qt_id' ") or die("could not delete sale item". mysqli_error($connection));
 
if(!$delete){
	echo "did not delete";
}else{
	$action="DELETED|".$qty."|".get_item($item_id)."|QUOTE|".$qt_id;
	logs($action,"../../"); 
}

?>
