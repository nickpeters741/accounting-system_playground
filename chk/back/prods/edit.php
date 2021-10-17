<?php  
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
	$id = $_POST["id"];  
	$field = $_POST["field"];  
	$text = $_POST["text"];  
	$column_name = $_POST["column_name"];  
	$sql = "UPDATE kp_items SET ".$column_name."='".$text."' WHERE item_id='".$id."'";  
	if(mysqli_query($connection, $sql))  
	{  
		$item_name= get_item($id); 
		$action="EDITED|-|-|ITEM DETAILS FOR |". $item_name;
		logs($action,"../../"); 
		echo get_item($id)." ".$field.' Updated Successfully!!!!';  
	}  
 ?>