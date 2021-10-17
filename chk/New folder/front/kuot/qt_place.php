<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$qt_id = $row['qt_id'];
$cust_id = $row['cust_id'];
$cust_bal=get_column('kp_customers','bal',"cust_id='$cust_id'");
  
$vatt=$_REQUEST['vatt'];  
$amount=$_REQUEST['tt'];
$perc=$_REQUEST['perc']; 
$tax_type=$_REQUEST['vat_type']; 
$vatable=$_REQUEST['vatable'];

$create_qt = mysqli_query($connection,"INSERT INTO kp_qt(qt_id,cust_id,user_id,day,amount,cf_bal,tax_type,tax_perc,vatable,vat) VALUES('$qt_id','$cust_id','$user_id',CURRENT_DATE,'$amount','$cust_bal','$tax_type','$perc','$vatable','$vatt')") or die(mysqli_error($connection));

$update_items = mysqli_query($connection,"UPDATE kp_qt_items SET status=1 WHERE qt_id='$qt_id'") or die(mysqli_error($connection));

$clear_qt_status = mysqli_query($connection,"DELETE FROM kp_qt_status  WHERE qt_id='$qt_id'") or die("Error");

if (!$create_qt OR !$update_items) {
	echo "Failed";
}else{
	?>
	<script type="text/javascript">
		$('#qt-modal').modal('hide');	
		window.location.href = "qt_print.php?id="+'<?php echo $qt_id; ?>';
	</script>
	<?php
}