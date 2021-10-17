<?php
session_start();
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id']; 
 
$delete = "DELETE FROM kp_qt_items WHERE qt_id='$qt_id'";
$delete_r = mysqli_query($connection,$delete) or die("Could not remove sale items");

$delete = "DELETE FROM kp_qt_status WHERE qt_id='$qt_id'";
$delete_or = mysqli_query($connection,$delete) or die("Could not clear order status");

    
if (!$delete_r OR !$delete_or) {
	header('Location:qt_page.php');
}else{ 
    $action="CANCELLED|-|-|-|QUOTE NO".$qt_id;
    logs($action,"../../");  
    header('Location:../dash/'.$dash);
}
 
?>