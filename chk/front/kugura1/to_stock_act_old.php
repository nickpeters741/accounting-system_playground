<?php
session_start();
include('../../inc/connection.php');  
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id'];

$item_id=$_POST['id']; 

$qty=$_POST['qty'];  

$get_po_details = mysqli_query($connection,"SELECT * FROM kp_grn_items WHERE grn_id='$grn_id' AND item_id='$item_id'") or die("Could not get the purchase details ");
$row = mysqli_fetch_assoc($get_po_details);
$rec_qty = $row['qty'];

if ($qty==0) {
	header("Location:po_view.php");  
}elseif ($qty!=$rec_qty){ 
	header("Location:po_view.php"); 
}else{
	$update_track = mysqli_query($connection,"INSERT INTO kp_stock_track(item_id,po_id,user_id,qty,status,day) VALUES('$item_id','$po_id','$user_id','$qty','IN',CURRENT_DATE)") or die(mysqli_error($connection)."Failed to update the stock track");
	if (!$update_track) {
		echo "Failed to update track";
	}else{ 
		$edit_qty = "UPDATE kp_items SET qty=qty+'$qty'  WHERE item_id='$item_id'";
		$edit_qty_r = mysqli_query($connection,$edit_qty) or die(mysqli_error($connection));
	}
}

// $total_qty=all_stores_total($item_id);
// $edit_item = "UPDATE kp_items SET qty='$total_qty' WHERE item_id='$item_id'";
// $edit_item_r = mysqli_query($connection,$edit_item) or die(mysqli_error($connection));

$update = mysqli_query($connection,"UPDATE kp_po_items SET s2s=1 WHERE po_id='$po_id' AND item_id='$item_id'");
$update = mysqli_query($connection,"UPDATE kp_grn_items SET s2s=1 WHERE grn_id='$grn_id' AND item_id='$item_id'");
if (!$update) {
	echo "Failed to update order items";
}else{
	// $check = mysqli_query($connection,"SELECT po_id FROM kp_po_items WHERE  s2s=2 AND po_id='$po_id'");
	// if (mysqli_num_rows($check) < 1) {
	// 	mysqli_query($connection,"UPDATE kp_po SET rec_status=1,rec_staff='$user_id' WHERE po_id='$po_id'") or die(mysqli_error($connection)."Failed to update the po");
	// 	header("Location:rec_page.php?msg=1");
	// }else{
	header("Location:rec_page.php"); 
	//}
}
  