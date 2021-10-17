<?php

include('../../inc/connection.php');
	$user_id = $_REQUEST['id']; 
	$role = $_REQUEST['roles']; 	
	$username = $_REQUEST['username']; 

	if (empty($username)) {
 ?>
 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> FIll All The Fields.</div>
	<script type="text/javascript">
		window.setTimeout(function(){
			window.location.href = 'user.php';
		}, 100);
	</script>
	<?php
	}else{
		$edit_user = "UPDATE kp_users SET role_id='$role', username='$username' WHERE user_id='$user_id'" ;
	    $edit_user_r = mysqli_query($connection,$edit_user) or die(mysqli_error($connection));
	  ?>
		 	<div class="alert alert-success">
		 		<a href="#" class="close" data-dismiss="alert">&times;</a>
		 		<strong>Warning!</strong> CUutomer  Successfully Edited.
		 	</div>
		 	<script type="text/javascript">
		 		window.setTimeout(function(){
		 			window.location.href = 'user.php';
		 		}, 100);
		 	</script>

		<?php
	}




?>