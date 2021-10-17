<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$cust_id = $_REQUEST['cust'];
$st = $_REQUEST['st'];

if ($st=='NEW') {
	$check_status=mysqli_query($connection,"SELECT qt_id FROM kp_qt_status WHERE  user_id='$user_id' AND cust_id='$cust_id'");
	if (mysqli_num_rows($check_status) > 0) {
		$on = mysqli_fetch_assoc($check_status);
		$qt_id = $on['qt_id']; 
	}else{ 
		$check_id=mysqli_query($connection,"SELECT qt_id FROM kp_qt_id");
		if (mysqli_num_rows($check_id) > 0) {	
			$update_petty = mysqli_query($connection,"UPDATE kp_qt_id SET qt_id=qt_id+1") or die(mysqli_error($connection));
		}else{
			$create_quote_id = "INSERT INTO kp_qt_id(qt_id) VALUES(1)";
			$create_quote_id_r = mysqli_query($connection,$create_quote_id) or die("Could not create a new qt_id");	
		}

		$get_qt_r = mysqli_query($connection,"SELECT qt_id FROM kp_qt_id") or die("Could not get the last qt_id");
		$row = mysqli_fetch_array($get_qt_r);
		
		$qt_id = $row['qt_id'];

		$create_qt_status = "INSERT INTO kp_qt_status(qt_id,user_id,cust_id) VALUES('$qt_id','$user_id','$cust_id')";
		$create_qt_status_r = mysqli_query($connection,$create_qt_status) or die("Could not create a quote status");

	}
}elseif ($st="CONT") {
	$qt_id=$_REQUEST['id'];
}else{

}
	if (empty($qt_id) OR $qt_id==0) {
		echo "ERROR";
	}else{
 
		$column='qt_id';
		$value=$qt_id;
		$folder='front/kuot/';
		$page= $folder.basename($_SERVER['PHP_SELF']);
		update_thesion($column,$value,$page);

		update_thesion('cust_id',$cust_id,$page);

	 	?>
	 	 <script type="text/javascript">
         window.location = "qt_page.php";
    </script>	 	
	 	<?php
	}
?>