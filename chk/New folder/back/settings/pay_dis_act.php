<?php
session_start();
include('../../inc/connection.php');
include('funcs.php');
if (isset($_REQUEST['pay_id'])) {
	$pay_id = $_REQUEST['pay_id'];
	$delete = mysqli_query($connection,"UPDATE kp_pay_mode SET del_status=1 WHERE pay_id='$pay_id'") or die("Could not delete the customer"); 
	if (!$delete) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Payment Mode not Disabled!!!!", "danger"); 
	</script>
	<?php
	 }else{
		?>
	<script type="text/javascript">
		var pay_id='<?php echo $pay_id; ?>'
	            $('#row'+pay_id).remove();
		var hulla = new hullabaloo();
	    hulla.send("Payment Mode Disabled Successfully!!!!", "success"); 
	</script>
	<?php
	}
}
?>