<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['cust_id'])) {
	$cust_id = $_REQUEST['cust_id'];
	$delete = mysqli_query($connection,"UPDATE kp_customers SET del_status=1 WHERE cust_id='$cust_id'") or die("Could not delete the customer".mysqli_error($connection));
	if (!$delete) {
		?>
		 <div class="alert alert-danger">
		 	<a href="#" class="close" data-dismiss="alert">&times;</a>
		 	<strong>Warning!</strong> Error Deleting Customer Details.
		 </div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'customers.php';
			}, 10);
		</script>
		<?php
	}else{
?>
		<div class="alert alert-Success">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Success!</strong> Successfully Deleted.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'customers.php';
			}, 10);
		</script>
		<?php
	}
}
?>