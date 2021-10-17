<?php
session_start();
include('../../inc/connection.php');
require_once('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$lpo_id = $row['lpo_id'];
echo column_total('kp_lpo_items','total',"lpo_id='$lpo_id'") ;
 ?>