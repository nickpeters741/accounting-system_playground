<?php
session_start();
include("../../inc/connection.php");
include('../../inc/gen_funcs.php');
if (isset($_POST['name'])) {
	$staff_id = $_POST['staff_id']; 
	$name = strtoupper($_POST["name"]);
	$nid = $_POST["id"];
	$email = $_POST["email"];
	$phone = $_POST['phone'];
	$nhif = $_POST['nhif'];
	$nssf = $_POST['nssf'];
	$pin = $_POST['pin'];
	$alias = $_POST['alias'];
	$address = $_POST['address'];
	$residence = $_POST['residence'];
	 

	if (empty($name) or empty($phone)  or empty($address) or empty($nid) ) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Warning!</strong> FIll All The Fields.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'staff.php';
			}, 100);
		</script>
		<?php
	}else{
		
		$edit_customer = "UPDATE kp_staff SET  staff_name='$name',staff_nid='$nid',staff_phone='$phone',staff_email='$email',staff_address='$address',staff_residence='$residence',staff_nhif='$nhif',staff_nssf='$nssf',staff_kra_pin='$pin',staff_updated_date=CURRENT_TIMESTAMP WHERE staff_id='$staff_id' " or die("Error o 25");
	    $edit_customer_r = mysqli_query($connection,$edit_customer) or die(mysqli_error($connection));
	    if (!$edit_customer_r) {
	    	//echo "Error editing";
	    	?>
	    	<div class="alert alert-danger">
	    		<a href="#" class="close" data-dismiss="alert">&times;</a>
	    		<strong>Warning!</strong> Error Editing Customer Details.
	    	</div>
	    	<script type="text/javascript">
	    		window.setTimeout(function(){
	    			window.location.href = 'staff.php';
	    		}, 100);
	    	</script>
	    	<?php
	    }else{
	    	$action="EDITED|-|-|STAFF DETAILS FOR |".get_staff($staff_id);
	    	logs($action,"../../");
	    	?>
	    	<div class="alert alert-success">
	    		<a href="#" class="close" data-dismiss="alert">&times;</a>
	    		<strong>Warning!</strong> CUutomer  Successfully Edited.
	    	</div>
	    	<script type="text/javascript">
	    		window.setTimeout(function(){
	    			window.location.href = 'staff.php';
	    		}, 100);
	    	</script>
	    	<?php
	    }
	}
}
?>