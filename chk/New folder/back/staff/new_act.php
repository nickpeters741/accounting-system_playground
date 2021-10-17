<?php
include('../../inc/connection.php');
$errorMSG = "";
/* NAME */
if (empty($_POST["name"])) {
?> 
<script type="text/javascript">
	$("#error-name").html("Name is required");
	$("#error-name").show();
</script>
<?php
$errorMSG = "1";
} else {
	$name = strtoupper($_POST["name"]);
}
/* NATIONAL ID */
if (empty($_POST["id"])) {
?> 
<script type="text/javascript">
	$("#error-nid").html("National id/Passport is required");
	$("#error-nid").show();
</script>
<?php
$errorMSG = "1";
} else {
	$nid = $_POST["id"];
}
/* EMAIL */
if (empty($_POST["email"])) {
 ?> 
<script type="text/javascript">
	$("#error-email").html("Email is required");
	$("#error-email").show();
</script>
<?php
$errorMSG = "1";
} else if(!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
 ?> 
<script type="text/javascript">
	$("#error-email").html("Invalid email format");
	$("#error-email").show();
</script>
<?php
$errorMSG = "1";
}else {
	$email = $_POST["email"];
}
if (empty($_POST["phone"])) {
?> 
<script type="text/javascript">
	$("#error-phone").html("Phone is required");
	$("#error-phone").show();
</script>
<?php
$errorMSG = "1";
} else {
	$phone = $_POST['phone'];
}
if(empty($errorMSG)){
	$nhif = $_POST['nhif'];
	$nssf = $_POST['nssf'];
	$pin = $_POST['pin'];
	// $nck = $_POST['nurse-no'];
	$alias = $_POST['alias'];
	$address = $_POST['address'];
	$residence = $_POST['residence'];
	$next_name = strtoupper($_POST["next-name"]);
	$next_phone = $_POST['next-phone'];
	$next_address = strtoupper($_POST['next-address']);
	$next_residence = strtoupper($_POST['next-residence']);

	$new_customer = "INSERT INTO kp_staff(staff_name,staff_nid,staff_phone,staff_email,staff_address,staff_residence,staff_hire_date,staff_kin_name,staff_kin_phone,staff_kin_address,staff_kin_residence,staff_nhif,staff_nssf,staff_kra_pin) VALUES('$name','$nid','$phone','$email','$address','$residence',CURRENT_TIMESTAMP,'$next_name','$next_phone','$next_address','$next_residence','$nhif','$nssf','$pin')";
	$new_customer_r = mysqli_query($connection,$new_customer) or die("Could not add ".$name." Details"."<br>WHY!!!: ". mysqli_error($connection));
	if (!$new_customer_r) { 
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Warning!</strong> Error Uploading Staff Details.
</div> 
<?php 
}else{
?>
<div class="alert alert-success">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Success!</strong>Customer Succesfully Added.
</div>
<script type="text/javascript">
	window.setTimeout(function(){
		window.location.replace(document.referrer);
	}, 100);
</script>
<?php 
}
exit;
} 	
 ?>