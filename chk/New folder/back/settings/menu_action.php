<?php
session_start();
include('../../inc/connection.php');


	$name = mysqli_real_escape_string($connection,$_POST['name']);
	//$description = mysqli_real_escape_string($connection,$_POST['description']);
	$link = mysqli_real_escape_string($connection,$_POST['link']);
	$parent = mysqli_real_escape_string($connection,$_POST['parent']);
	$icon = mysqli_real_escape_string($connection,$_POST['icon']);
	$level = mysqli_real_escape_string($connection,$_POST['level']);
	 $hsub = mysqli_real_escape_string($connection,$_POST['hsub']); 
	 
	 
		$new_ac_type= "INSERT INTO kp_menu(name,link,level,sub,parent,icon) VALUES('$name','$link','$level','$hsub','$parent','$icon')";
		$new_ac_type_r = mysqli_query($connection,$new_ac_type) or die("Error:".mysqli_error($connection));
 
if (!$new_ac_type_r) {
			echo "Failed to update the district";
		
		}else{
		
		header("Location:new_menu.php?msg=1");	
		}
	


?>