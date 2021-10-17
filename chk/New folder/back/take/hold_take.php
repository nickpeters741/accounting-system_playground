<?php
session_start();
include("../../inc/connection.php");
$id = $_GET['id'];  
$day = $_GET['day'];  
$update_take = mysqli_query($connection,"UPDATE kp_stock_take_status SET take_status=3 WHERE stat_id='$id'");
if ($update_take) {
	header("Location:init_page.php");
}else{
	header("Location:take.php?id=".$id."&day=".$day);
}
  

?>