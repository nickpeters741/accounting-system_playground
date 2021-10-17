<?php
include('../../inc/connection.php');
if (isset($_REQUEST['staff_id'])) {
	$staff_id = $_REQUEST['staff_id'];
	$confirmpassword = $_REQUEST['confirmpassword'];

	$edit_pass = "UPDATE kp_users SET user_password='$confirmpassword' WHERE user_id='$staff_id' " or die("Error edition the file");
	$edit_pass_r = mysqli_query($connection,$edit_pass) or die("error on 18");
	if (!$edit_pass_r) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Occured Try Again.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'user.php';
			}, 100);
		</script>
<?php
}else{
?>
<div class="alert alert-info">
	<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Password Edited SUccessfully.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'user.php';
			}, 100);
		</script>
<?php
	}
}
?>