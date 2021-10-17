<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$user_id=$_SESSION['user_id'];
if ($_REQUEST['st']==1) {
	$pin = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['pin']));
	$vat = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['vat']));
	$type = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['type']));
	if (empty($pin) OR empty($vat)) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Make Sure You fill All fields !!!!", "danger"); 
		</script>
		<?php
	}else{
		$set_print= "UPDATE kp_settings_gen SET kra_pin='$pin',vat='$vat',tax_type='$type'";
		$set_print_r = mysqli_query($connection,$set_print) or die(mysqli_error($connection)); 
	}
}elseif ($_REQUEST['st']==2) {
	$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
	$percent = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['percent'])); 
	$code = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['code']));

	echo $name." pv=".$percent." code=".$code;
	if (empty($name) OR empty($percent) OR empty($code)) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Make Sure You fill All fields while adding tax!!!!", "danger"); 
		</script>
		<?php
	}elseif (check_duplicate('kp_tax','code',$code)) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Another Mode with same code exists !!!!", "danger"); 
		</script>
		<?php
	}elseif (check_duplicate('kp_tax','name',$name)) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Another Mode with same name exists !!!!", "danger"); 
		</script>
		<?php
	}elseif (check_duplicate('kp_tax','percent',$percent)) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Another Mode with same Percentage exists !!!!", "danger"); 
		</script>
		<?php
	}else{ 
		$update_settings= "INSERT INTO kp_tax(name,percent,user_id) VALUES('$name','$percent','$user_id')";
		$update_settings_r = mysqli_query($connection,$update_settings) or die("Error:!!".mysqli_error($connection));
		if (!$update_settings_r) {
			?> 
			<script type="text/javascript"> 
				var hulla = new hullabaloo();
			    hulla.send("Payment Mode not Created!!!!", "danger"); 
			</script>
			<?php
		}else{ 
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
			    hulla.send("Payment Mode Created Successfully!!!!", "success"); 
			</script>
			<?php
		}
	} 
}else{
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Refresh Page !!!!", "danger"); 
	</script>
	<?php
}

?>