<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$pin = $_REQUEST['pin'];
$mkt = $_REQUEST['mkt'];

$user_id=$_SESSION['user_id'];  
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];

 if (empty($_REQUEST['pin'])) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Danger!!! Password Cannot be Empty', "danger");  
</script>
<?php
}else{
	$verify = mysqli_query($connection,"SELECT * FROM kp_users WHERE cabi='$pin'") or die("Could not verify");
	if (mysqli_num_rows($verify) < 1) {
		$action="ENTERED WRONG PASSWORD|-|-|-|IN MARKETER CHANGE FOR SALE |". $sale_id;
		logs($action,"../../"); 
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Danger!!! Wrong Password, Trials are Documented', "danger");  
	</script>
    <?php
	}else{
		$update = mysqli_query($connection,"UPDATE kp_sale_status SET mkt='$mkt' WHERE sale_id='$sale_id'") or die("Could not update");
		$update = mysqli_query($connection,"UPDATE kp_thesion SET mkt='$mkt' WHERE user_id='$user_id'") or die("Could not update");
	
		 $action="CHANGED|-|-|-|SALE MARKETER TO |". get_user($mkt);
		logs($action,"../../"); 
	
	?>
	<script type="text/javascript">
		$("#salesper").text('SALES PERSON: '+'<?php echo get_user($mkt); ?>');
		var hulla = new hullabaloo();
		hulla.send('Success!!! Sales person updated successfully', "success"); 

	    $('#modal2').modal('toggle');
	    $('#modal').modal('toggle');
	</script>
    <?php
}
}
?>