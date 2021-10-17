<?php
	session_start();
	include('../../inc/connection.php');
	$id = $_REQUEST['id'];
	$role = $_REQUEST['role'];
	$delete = mysqli_query($connection,"DELETE FROM kp_roles WHERE role_id='$id'") or die("Could not delete the role");
	if (!$delete) {
?>
<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting Customer Details.</div>
<script type="text/javascript">
	window.setTimeout(function(){
		window.location.href = 'roles.php';
	}, 100);
</script>
<?php
	}else{
		$update_role = "UPDATE kp_users SET user_role_id='$role' WHERE user_role_id='$id'";
		$update_role_r = mysqli_query($connection,$update_role) or die(mysgli_error($connection));
?>
<div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
<script type="text/javascript">
	window.setTimeout(function(){
		window.location.href = 'roles.php';
	}, 100);
</script>
<?php
	}
?>