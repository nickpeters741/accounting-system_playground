<?php

include('../../inc/connection.php');
if (isset($_REQUEST['name'])) {
	$cust_id = $_REQUEST['cust_id'];
	$name = $_REQUEST['name'];
	$alias = $_REQUEST['alias'];
	$phone = $_REQUEST['phone'];
	$address = $_REQUEST['address'];
	$location = $_REQUEST['location'];
	$email = $_REQUEST['email'];
	if (empty($name) or empty($phone)) {
	?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> FIll All The Fields.
	</div>
	<script type="text/javascript">
		window.setTimeout(function(){
			window.location.href = 'customers.php';
		}, 100);
	</script>
<?php
	}else{
		$edit_customer = "UPDATE kp_customers SET name='$name',email='$email',alias='$alias',phone='$phone',address='$address', location='$location' WHERE cust_id='$cust_id' " or die("Error o 25");
	    $edit_customer_r = mysqli_query($connection,$edit_customer) or die(mysqli_error($connection));
	    if (!$edit_customer_r) {
	    	//echo "Error editing";
	    	?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Editing Customer Details.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'customers.php';

                        }, 10);
		</script>

		<?php
	    }else{
	    	//header("Location:customers.php?msg=2");
	    	?>
		 <div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Customer  Successfully Edited.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'customers.php';

                        }, 10);
		</script>

		<?php
	    }
	}
}



?>