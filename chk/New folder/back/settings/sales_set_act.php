<?php
session_start();

include('../../inc/connection.php'); 

$po_id = mysqli_real_escape_string($connection,$_POST['po_id']);

$sale_id = mysqli_real_escape_string($connection,$_POST['sale_id']);

$req_id = mysqli_real_escape_string($connection,$_POST['req_id']);

$petty_id = mysqli_real_escape_string($connection,$_POST['petty_id']); 



 

if (empty($po_id) OR empty($sale_id) OR empty($req_id) OR empty($petty_id)) {

	 

?>

<div class="alert alert-danger">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Failed</strong> Make sure fields not empty and if starting 0 enter 00.

</div>

<?php

}else{ 

$update_sale = mysqli_query($connection,"UPDATE kp_sale_id SET sale_id='$sale_id'") or die(mysqli_error($connection));	

if (!$update_sale) {

?>

<div class="alert alert-danger">

	<a href="#" class="close" data-dismiss="alert">&times;</a>

	<strong>Failed</strong> Failed to update Sale id.

</div>

<?php

}else{

    $update_petty = mysqli_query($connection,"UPDATE kp_petty_id SET petty_id='$petty_id'") or die(mysqli_error($connection));

    if (!$update_petty) {

?>

<div class="alert alert-danger">

    <a href="#" class="close" data-dismiss="alert">&times;</a>

    <strong>Failed</strong> Failed to update Petty id.

</div>

<?php

}else{

$update_po = mysqli_query($connection,"UPDATE kp_po_id SET po_id='$po_id'") or die(mysqli_error($connection));

if (!$update_po) {

?>

<div class="alert alert-danger">

    <a href="#" class="close" data-dismiss="alert">&times;</a>

    <strong>Failed</strong> Failed to update PO id.

</div>

<?php

}else{

$update_req = mysqli_query($connection,"UPDATE kp_req_id SET req_id='$req_id'") or die(mysqli_error($connection));

if (!$update_req) {

?>

<div class="alert alert-danger">

    <a href="#" class="close" data-dismiss="alert">&times;</a>

    <strong>Failed</strong> Failed to update Req id.

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

}

}

}

	 

  



 

?>