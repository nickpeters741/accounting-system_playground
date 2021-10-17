<?php
session_start();
include('../../inc/connection.php');
	$pin = mysqli_real_escape_string($connection,$_POST['pin']); 

	$logo = mysqli_real_escape_string($connection,$_POST['logo']); 

	$mpesa_select = mysqli_real_escape_string($connection,$_POST['mpesa-select']); 

	$thank = mysqli_real_escape_string($connection,$_POST['thank']); 

	$kra_pin = strtoupper(mysqli_real_escape_string($connection,$_POST['kra-pin']));

	$mpesa_select = mysqli_real_escape_string($connection,$_POST['mpesa-select']); 

	$tax = mysqli_real_escape_string($connection,$_POST['tax']); 



$check_gen =mysqli_query($connection,"SELECT * FROM kp_settings_print WHERE print_doc=1");

if (mysqli_num_rows($check_gen)<1) {

	$set_print= "INSERT INTO kp_settings_print(print_doc, show_logo,pin,tax, mpesa, thankyou_note) VALUES (1,'$logo','$pin','$tax','$mpesa_select','$thank')";

$set_print_r = mysqli_query($connection,$set_print);



	if (!$set_print_r) {

?>

<div class="alert alert-danger">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Failed</strong> Failed to insert details.

</div>

<?php

}else{

	?>

<div class="alert alert-success">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Success!</strong> Successfully Inserted.

</div>

<?php

}



}else{

	$update_print= "UPDATE kp_settings_print SET print_doc=1, show_logo='$logo', pin='$pin',tax='$tax', mpesa='$mpesa_select',thankyou_note='$thank'";

$update_print_r = mysqli_query($connection,$update_print);

if (!$update_print_r) {

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

}

	 

	 



 

if (!$set_print_r) {

	

if (!$update_print_r) {

	echo mysqli_error($connection)

?>

<div class="alert alert-danger">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Warning!</strong>Thermal receipt not set.

</div>

<?php

}else{

?>

<div class="alert alert-Successful">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Successfully!</strong>Thermal receipt set.

</div>

<?php

}

}else{

?>

<div class="alert alert-Successful">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Successfully!</strong>Thermal receipt set.

</div>

<?php

}

	





?>