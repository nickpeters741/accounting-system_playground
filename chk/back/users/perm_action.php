
<?php
include('../../inc/connection.php'); 
 $user_id=$_POST['id'];
    $check=implode(", ", $_POST['menu']);
    print_r($check);

    $edit_user = "UPDATE kp_users SET permissions='$check' WHERE user_id='$user_id'"  or die("Error o 25");
	$edit_user_r = mysqli_query($connection,$edit_user) or die(mysqli_error($connection));
    
    if (!$edit_user_r) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Occured Try Again.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'user.php';
			}, 10);
		</script>
<?php
}else{
?>
<div class="alert alert-info">
	<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'user.php';
			}, 10);
		</script>
<?php
	}
?>