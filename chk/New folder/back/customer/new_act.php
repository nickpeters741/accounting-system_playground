<?php
include('../../inc/connection.php');
if (isset($_REQUEST['name'])) {
	$name = $_REQUEST['name'];
	$alias = $_REQUEST['alias'];
	$phone = $_REQUEST['phone'];
	$address = $_REQUEST['address'];
	$email = $_REQUEST['email'];
	$location = $_REQUEST['location'];

	if (empty($name) ) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Customer Name is a must.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'customers.php';
			}, 200);
		</script>
	<?php
	}elseif (empty($phone) ) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Customer must have a phone number.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'customers.php';
			}, 200);
		</script>
	<?php
	}else{
		$new_customer = "INSERT INTO kp_customers(alias,name,phone,email,address,location) VALUES('$alias','$name','$phone','$email','$address','$location')";
		$new_customer_r = mysqli_query($connection,$new_customer) or die("Error inserting ". mysqli_error($connection));
		if (!$new_customer_r) {?>
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Failed to upload Try again...
			</div>
			<?php
		}else{?>
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Customer Succesfully Added.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'customers.php';
			}, 100);
		</script>
		<?php
		}
	}
}
?>