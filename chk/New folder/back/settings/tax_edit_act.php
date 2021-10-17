<?php
session_start();
include('../../inc/connection.php');
$user_id=$_SESSION['user_id'];
$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
$code = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['code']));
$percent =$_REQUEST['percent'];
$id =$_REQUEST['id'];     
if (empty($name)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Name Cannot be empty !!!!", "danger"); 
	</script>
	<?php  
}elseif (empty($code)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Code Cannot be empty !!!!", "danger"); 
	</script>
	<?php  
}elseif (empty($percent)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Percentage Cannot be Empty!!!!", "danger"); 
	</script>
	<?php
}else{ 
	$update_tax= "UPDATE kp_tax SET name='$name',percent='$percent',code='$code' WHERE tax_id='$id'";
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