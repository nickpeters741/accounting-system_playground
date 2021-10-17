<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$cust_id = $_REQUEST['cust'];
$st = $_REQUEST['st'];

if ($st=='NEW') { 
	$check_status=mysqli_query($connection,"SELECT lpo_id FROM kp_lpo_status WHERE  user_id='$user_id' AND cust_id='$cust_id'");
	if (mysqli_num_rows($check_status) > 0) {
		$on = mysqli_fetch_assoc($check_status);
		$lpo_id = $on['lpo_id']; 
	}else{ 
		$check_id=mysqli_query($connection,"SELECT lpo_id FROM kp_lpo_id");
		if (mysqli_num_rows($check_id) > 0) {	
			$update_id = mysqli_query($connection,"UPDATE kp_lpo_id SET lpo_id=lpo_id+1") or die(mysqli_error($connection));
		}else{
			$create_id = "INSERT INTO kp_lpo_id(lpo_id ) VALUES(1)";
			$create_id_r = mysqli_query($connection,$create_id) or die("Could not create a new lpo_id");	
		}

		$get_qt_r = mysqli_query($connection,"SELECT lpo_id FROM kp_lpo_id") or die("Could not get the last lpo_id");
		$row = mysqli_fetch_array($get_qt_r);
		
		$lpo_id = $row['lpo_id'];

		$create_status = "INSERT INTO kp_lpo_status(lpo_id,user_id,cust_id) VALUES('$lpo_id','$user_id','$cust_id')";
		$create_status_r = mysqli_query($connection,$create_status) or die("Could not create a quote status");

	}
}elseif ($st="CONT") {
	$lpo_id=$_REQUEST['id'];
	$cust_id=$_REQUEST['cust'];
}else{
	$lpo_id=0;
}
	if (empty($lpo_id) OR $lpo_id==0) {
		echo "ERROR";
	}else{
 
		$column='lpo_id';
		$value=$lpo_id;
		$folder='front/lpo/';
		$page= $folder.basename($_SERVER['PHP_SELF']);
		update_thesion($column,$value,$page);

		update_thesion('cust_id',$cust_id,$page);

	 	?>
	 	 <script type="text/javascript">
         window.location = "lpo_page.php";
    </script>	 	
	 	<?php
	}
?>