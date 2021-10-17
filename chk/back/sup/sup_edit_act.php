<?php
include('../../inc/connection.php');
include('../clude/funcs.php');
   
if (isset($_REQUEST['name'])) {

	$sup_name =$_REQUEST['name'];
	$sup_phone = $_REQUEST['sup_phone'];
	$sup_id = $_REQUEST['sup_id'];
	$sup_email = $_REQUEST['sup_email'];
	$sup_address = $_REQUEST['sup_address'];
	$sup_loc = $_REQUEST['sup_loc'];
	$sup_pin = $_REQUEST['sup_pin'];
	$sup_vat = $_REQUEST['sup_vat'];

	if ( empty($sup_name) OR empty($sup_id)  OR empty($sup_phone)) {
		?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Please Fill All The Fields.</div>
	 <?php
	}else{

		$edit_item = "UPDATE kp_suppliers SET sup_name='$sup_name',sup_phone='$sup_phone',sup_email='$sup_email',sup_address='$sup_address',sup_pin='$sup_pin',sup_vat='$sup_vat',sup_location='$sup_loc' WHERE sup_id='$sup_id' " or die("Error edition the file");
		$edit_item_r = mysqli_query($connection,$edit_item) or die("error on 18".mysqli_error($connection));
 
	if (!$edit_item_r) {
		$action="FAILED TO EDIT SUPPLIER | ";
		    $url="../../";
		    logs($action,$url);
			?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Failed!</strong> Failed To Edited.</div>
	  <?php
		}else{
			$action="EDITED SUPPLIER AS NAME:".$sup_name." PHONE:".$sup_phone." EMAIL:".$sup_email." ADDRESS:".$sup_address." PIN:".$sup_pin ."VAT:".$sup_vat." LOCATION:".$sup_loc." | ";
		    $url="../../";
		    logs($action,$url);
			?>

		<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Edited.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
			 	window.location.href = 'sup.php';
			}, 100);
		</script>

		<?php
		}
	}

}
?>