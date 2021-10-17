<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$user_id=$_SESSION['user_id'];
$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
$bank =$_REQUEST['bank'];
$color = $_REQUEST['color'];   
$has_ref = $_REQUEST['has_ref']; 
$has_change = $_REQUEST['has_change']; 
if (empty($name) OR empty($color) OR $bank==0) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Make Sure You fill All fields !!!!", "danger"); 
	</script>
	<?php
}elseif (check_duplicate('kp_pay_mode','name',$name)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Another Mode with same name exists !!!!", "danger"); 
	</script>
	<?php
}else{ 
	$update_settings= "INSERT INTO kp_pay_mode(name,bank_id,btn_color,has_ref,has_change,created_by) VALUES('$name','$bank','$color','$has_ref','$has_change','$user_id')";
	$update_settings_r = mysqli_query($connection,$update_settings) or die("Error:!!".mysqli_error($connection));
	if (!$update_settings_r) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Payment Mode not Created!!!!", "danger"); 
		</script>
		<?php
	}else{
	 	$id =mysqli_insert_id($connection);
	 	$column_qty="ALTER TABLE kp_sale_payment ADD `mode".$id."` DECIMAL(10,2) NOT NULL;";
		$update_items_r = mysqli_query($connection,$column_qty) or die(mysqli_error($connection));
		if ($has_ref==1) {
			$column_qty="ALTER TABLE kp_sale_payment ADD `moderef".$id."` VARCHAR(22) NOT NULL;";
			$update_items_r = mysqli_query($connection,$column_qty) or die(mysqli_error($connection)); 
		}
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send("Payment Mode Created Successfully!!!!", "success"); 
		</script>
		<?php
	}
}	
?>