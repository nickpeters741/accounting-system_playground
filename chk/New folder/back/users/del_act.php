<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['user_id'])) {
	$user_id = $_REQUEST['user_id'];
	$delete = mysqli_query($connection,"UPDATE users SET del_status=1 WHERE user_id='$user_id'") or die("Could not delete the customer");
	if (!$delete) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Warning!</strong> Error Deleting staff Details.
</div>
<script type="text/javascript">
	window.setTimeout(function(){
		window.location.href = 'user.php';
	}, 100);
</script>
<?php
	}else{
?>
<div class="alert alert-Success">
	<strong>User Successfully Deleted.</strong>
</div>
<script type="text/javascript">
	window.setTimeout(function(){
		window.location.href = 'user.php';
	}, 100);
</script>
<?php
	}
}
?>