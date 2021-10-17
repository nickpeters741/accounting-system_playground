<?php
session_start();

include('../../inc/connection.php');
 	$user_id=$_SESSION['user_id'];
 	$name = $_REQUEST['name'];
 	$bank_name = $_REQUEST['bank_name'];
 	$branch = $_REQUEST['branch'];
 	$acc_no = $_REQUEST['acc_no'];
 	$bal = $_REQUEST['bal'];
 	$loc = $_REQUEST['loc'];
	
	if (empty($name)) {?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Please Fill All The Fields.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){
			 	window.location.href = 'banks.php';
			 }, 200);
		</script>

		<?php
	}else{

		$new_cat = "INSERT INTO kp_banks(acc_name,acc_no,bank_name,branch,bal,location,created_by) VALUES('$name','$acc_no','$bank_name','$branch','$bal','$loc','$user_id')" or die("error");
		$new_cat_r = mysqli_query($connection,$new_cat) or die("error uploading the details". mysqli_error($connection));

		if (!$new_cat_r) {
			
		}else{  
				?>

		 <div class="alert alert-success">
		<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Added.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'banks.php';
			}, 100);
		</script>
		<?php
	}
}

?>
