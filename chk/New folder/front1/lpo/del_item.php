<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$lpo_id = $row['lpo_id']; 

$id = $_REQUEST['id'];
$item_id=get_column('kp_lpo_items','item_id',"id='$id'"); 

$delete = mysqli_query($connection,"DELETE FROM kp_lpo_items WHERE id='$id' ") or die("could not delete lpo item". mysqli_error($connection));
 
if(!$delete){
	echo "did not delete";
}else{
	$action="DELETED|".$qty."|".get_item($item_id)."|FROM LPO NO |".$lpo_id;
	logs($action,"../../"); 
}

?>
