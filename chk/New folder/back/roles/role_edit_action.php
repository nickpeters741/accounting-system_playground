<?php
include('../../inc/connection.php');
if (isset($_POST['role-edit'])) {
	$dash= $_POST['dash'];
	$panel= $_POST['panel'];
	$name = $_POST['name'];
	$desc = $_POST['desc'];
	$role_id = $_POST['role_id']; 
	$check=implode(", ", $_POST['perm']); 


	if (empty($name) OR empty($desc)) {
		header("Location:roles.php?msg=3");
	}else{
		$edit_priv = "UPDATE kp_roles SET role_name='$name',role_description='$desc',role_access_panel='$panel',access_dash='$dash',front_perm='$check' WHERE role_id='$role_id ' " or die("Error o 25");
	    $edit_priv_r = mysqli_query($connection,$edit_priv) or die(mysqli_error($connection)." "."Error editing the roles profile");
	    if (!$edit_priv_r) {
	    	echo "Error editing";
	    }else{
	    	header("Location:roles.php?msg=2");
	    }
	}
}else{
	//you can as well have an error page with this page has tobe called from  partilar page
	header("Location:back/roles/roles.php");
}



?>