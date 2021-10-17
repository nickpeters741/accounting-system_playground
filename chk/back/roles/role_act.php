<?php
include('../../inc/connection.php');
 
	$name = $_REQUEST['name'];
	$desc = $_REQUEST['desc'];
	$panel = $_REQUEST['panel'];
	$dash = $_REQUEST['dash'];
	$check=implode(", ", $_REQUEST['perm']); 

	if (empty($name) OR empty($panel) ) {
		//echo $fname;
		?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Fill all the required Fields.</div> 
	<?php
	}else{
		$new_role= "INSERT INTO kp_roles(name,description,access_panel,access_dash,front_perm) VALUES ('$name','$desc','$panel','$dash','$check')";
		$new_role_r = mysqli_query($connection,$new_role) or die(mysqli_error($connection));
		if (!$new_role_r) {?>
		<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Failed to save Try again or contact admin...</div>
		<?php
	      }else{
	    ?>
		<div class="alert alert-success">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Priviledge Succesfully Added.
	</div>
	<script type="text/javascript">
		window.setTimeout(function(){
			window.location.href = 'roles.php';
		}, 100);
	</script>
	<?php 
	}
}
?>