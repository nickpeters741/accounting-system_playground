<?php
include('../../inc/connection.php');
include('funcs.php');
if (isset($_REQUEST['staff'])) {
	$staff = $_REQUEST['staff']; 
	$username = $_REQUEST['username'];
	$cpass = $_REQUEST['cpass'];

	$roles = $_REQUEST['role']; 


	

	if (empty($staff) ) {
		 
		?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Fill all the required Fields.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'user.php';
			}, 100);
		</script>
	<?php
	}else{
	$new_user = "INSERT INTO kp_users(staff_id,username,cabi,role_id) VALUES('$staff','$username','$cpass','$roles')" or die("Error creating the staff profile");
		$new_user_r = mysqli_query($connection,$new_user) or die(mysqli_error($connection));
		if (!$new_user_r) {
			?>
		<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Failed to upload Try again...</div>
		<?php 
		}else{
			Updatedata("kp_users","staff_user_status=1 WHERE staff_id='$staff_id'");
			?>
		<div class="alert alert-success">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Customer Succesfully Added.
	</div>
	<script type="text/javascript">
		window.setTimeout(function(){
			window.location.href = 'user.php';
		}, 100);
	</script>
<?php 
		}
	}
}
?>