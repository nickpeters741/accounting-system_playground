<?php
session_start();
include('../../inc/connection.php');
require_once('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$sale_id = $row['sale_id'];
echo grand_total($sale_id) ;
 ?>