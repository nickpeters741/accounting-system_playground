<?php
session_start();
include('../../inc/connection.php');
$user_id=$_SESSION['user_id'];
$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
$bank =$_REQUEST['bank'];
$id =$_REQUEST['id'];
$color = $_REQUEST['color'];
$has_ref = $_REQUEST['has_ref2']; 
$has_change = $_REQUEST['has_change2'];     

if (empty($name)) {
?> 
<script type="text/javascript"> 
	var hulla = new hullabaloo();
    hulla.send("Name Cannot be empty !!!!", "danger"); 
</script>
<?php 	# code...
}elseif (empty($color)) {
?> 
<script type="text/javascript"> 
	var hulla = new hullabaloo();
    hulla.send("Color Cannot be Empty!!!!", "danger"); 
</script>
<?php 	# code...
}elseif ($bank==0) {
?> 
<script type="text/javascript"> 
	var hulla = new hullabaloo();
    hulla.send("Bank have to be Selected!!!!", "danger"); 
</script>
<?php 	# code...
}else{ 
	 
$update_settings= "UPDATE kp_pay_mode SET name='$name',bank_id='$bank',btn_color='$color',has_ref='$has_ref',has_change='$has_change' WHERE pay_id='$id'";
$update_settings_r = mysqli_query($connection,$update_settings) or die("Error:!!".mysqli_error($connection));
 
if (!$update_settings_r) {
?> 
<script type="text/javascript"> 
	var hulla = new hullabaloo();
    hulla.send("Payment Mode not Edited!!!!", "danger"); 
</script>
<?php
 }else{
	?>
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send("Payment Mode edited Successfully!!!!", "success"); 
</script>
<?php
}
 }	
?>