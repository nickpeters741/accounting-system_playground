<?php
session_start();
include('../../inc/connection.php');


	$perc = mysqli_real_escape_string($connection,$_REQUEST['perc']);
	$min = mysqli_real_escape_string($connection,$_REQUEST['min']);   

	 
	 
$update_settings= "UPDATE settings SET points_perc='$perc',points_minimum='$min'";
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