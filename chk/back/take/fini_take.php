<?php
session_start();
include('../../inc/connection.php'); 

$sql = "TRUNCATE TABLE kp_stock_take_status";
	$empty_s = mysqli_query($connection,$sql)  or die("Error Copy to store.:".mysqli_error($connection)); 
if (!$empty_s) {
	echo "Failed to delete";
}else{
	header("Location:../dash/".$_SESSION['dash']);
}

 
?> 