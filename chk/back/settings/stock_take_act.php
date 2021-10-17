<?php
session_start();
include('../../inc/connection.php'); 
$days = mysqli_real_escape_string($connection,$_REQUEST['days']);   

	 
	 
$update_settings= "INSERT INTO kp_stock_take_set (id,take_interval,last_take) VALUES (1,'$days',CURRENT_DATE) ON DUPLICATE KEY UPDATE take_interval='$days',last_take=CURRENT_DATE";
$update_settings_r = mysqli_query($connection,$update_settings) or die("Error:!!".mysqli_error($connection));
 
if (!$update_settings_r) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Failed</strong> Failed to update.
</div>
<?php
}else{
	?>
<div class="alert alert-success">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Success!</strong> Successfully Updated.
</div>
<?php
}
 
?>