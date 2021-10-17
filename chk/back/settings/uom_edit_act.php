<?php
session_start();
include('../../inc/connection.php');
$user_id=$_SESSION['user_id'];
$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
$qty = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['qty']));
$id =$_REQUEST['id'];     
if (empty($name)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Name Cannot be empty !!!!", "danger"); 
	</script>
	<?php  
}elseif (empty($qty)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("qty Cannot be empty !!!!", "danger"); 
	</script>
	<?php  
}else{ 
	$update_tax= "UPDATE kp_uom SET name='$name',qty='$qty' WHERE uom_id='$id'";
	$update_tax_r = mysqli_query($connection,$update_tax) or die("Error:!!".mysqli_error($connection));
	if (!$update_tax_r) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("Tax not Edited!!!!", "danger"); 
		</script>
		<?php
	}else{
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send("Tax edited Successfully!!!!", "success"); 
		</script>
		<?php
	}
}	
?>