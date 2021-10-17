<?php
session_start();
include('../../inc/connection.php');
$name = mysqli_real_escape_string($connection,$_POST['name']); 
$link = mysqli_real_escape_string($connection,$_POST['link']);
$parent = mysqli_real_escape_string($connection,$_POST['parent']);
$icon = mysqli_real_escape_string($connection,$_POST['icon']);
$level = mysqli_real_escape_string($connection,$_POST['level']);
$hsub = mysqli_real_escape_string($connection,$_POST['hsub']);
$panel = mysqli_real_escape_string($connection,$_POST['panel']);
$modalr = mysqli_real_escape_string($connection,$_POST['modalr']);
$modal_func = mysqli_real_escape_string($connection,$_POST['modal-func']);  
	 
$new_ac_type= "INSERT INTO kp_menu(name,link,level,sub,parent,icon,panel,modal,modal_function) VALUES('$name','$link','$level','$hsub','$parent','$icon','$panel','$modalr','$modal_func')";
$new_ac_type_r = mysqli_query($connection,$new_ac_type) or die("Error:".mysqli_error($connection));
if (!$new_ac_type_r) {
	echo "Failed to update the district";
}else{
	header("Location:menu.php?pnl=".$panel);	
}
?>