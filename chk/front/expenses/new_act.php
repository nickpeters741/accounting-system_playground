<?php
include('../../inc/connection.php');
if (isset($_REQUEST['exp_type'])) {
	session_start();
	$user_id = $_SESSION['user_id'];
	$exp_type = $_REQUEST['exp_type'];
	$exp_amnt = $_REQUEST['exp_amnt'];
	$exp_date = $_REQUEST['exp_date'];


	if (empty($exp_type) ) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Expense Type  is a must.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'expenses.php';
			}, 200);
		</script>

	<?php
	}else{
		$exp_mnth  = date("m",strtotime($exp_date));
		$exp_yr = date("y",strtotime($exp_date));
		$new_customer = "INSERT INTO kp_expenses(type,amnt,exp_date,user_id,status,payment_status,exp_mnth,exp_yr) VALUES('$exp_type','$exp_amnt','$exp_date','$user_id','1','1','$exp_mnth','$exp_yr')";
		$new_customer_r = mysqli_query($connection,$new_customer) or die("Error inserting ". mysqli_error($connection));
		if (!$new_customer_r) {?>
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Failed to upload Try again...
			</div>
			<?php
		}else{?>
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Expense Succesfully Added.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'expenses.php';
			}, 100);
		</script>
		<?php
		}
	}
}
?>