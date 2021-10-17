<?php
session_start();
include("../../inc/connection.php");
$id = $_GET['id'];
$day = $_GET['day'];

$closing_stock = mysqli_query($connection,"SELECT closing FROM kp_stock_take WHERE item_id='$id' AND day='$day'");
$open = mysqli_fetch_assoc($closing_stock);
$closing =$open['closing']; 

$delete = mysqli_query($connection,"DELETE FROM kp_stock_take WHERE item_id='$id' AND day='$day'");


$update_items = mysqli_query($connection,"UPDATE kp_items SET take=2,qty='$closing' WHERE item_id='$id'");


if (!$delete OR !$update_items) {
	echo "Failed to delete";
}else{
	header("Location:take.php?day=".$day);
}

?>