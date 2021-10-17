<?php 
include('../../inc/connection.php');

include('../../inc/gen_funcs.php'); 
include('../clude/funcs.php');
$imei = $_REQUEST['imei']; 
$item_id = $_REQUEST['item']; 
if (empty($imei)) {
?>
<div class="alert alert-danger">
  <strong>SCAN IMEI</strong>
</div>
  <?php
}else{ 
 	$get_item = mysqli_query($connection,"SELECT * FROM kp_items WHERE barcode=".$imei) or die(mysqli_error($connection)); 
	if (mysqli_num_rows($get_item)==0) {
		$check_imei = mysqli_query($connection,"SELECT imei,item_id,take FROM kp_items_imei WHERE imei=".$imei) or die(mysqli_error($connection));
		$ci=mysqli_fetch_assoc($check_imei);
 
		if ($ci['item_id']==1) {
				?>
			<div class="alert alert-warning">
			  <strong>IMEI ALREADY SCANNED!!!!<BR>SCAN ANOTHER PHONE</strong>
			</div>
		<?php
		}elseif (mysqli_num_rows($check_imei)==0) {
				?>
			<div class="alert alert-danger">
			  <strong>IMEI NOT IN THE STOCK!!!!<BR>RAISE A REQUISITION </strong>
			</div>
		<?php
		}elseif ($ci['item_id']!=$item_id) {
			?>
			<div class="alert alert-danger">
			  <strong>YOU SCANNED ANOTHER PHONE'S IMEI!!!!<BR><?php echo get_item($ci['item_id']); ?> <BR> MAKE SURE YOU HAVE THE RIGHT BOX</strong>
			</div>
		<?php
		}else{
			$con_imei = mysqli_query($connection,"UPDATE kp_items_imei SET take=1  WHERE imei=".$imei) or die(mysqli_error($connection));
			if ($con_imei) {
				?> 
			<div class="alert alert-success">
			  <strong> PHONE IMEI SUCCSSFULLY CONFIRMED!!! SCAN NEXT  </strong>
			</div>
		<?php 
			}else{
				?> 
			<div class="alert alert-danger">
			  <strong> CONTACT DEV ASAP!!!</strong>
			</div>
		<?php 
			} 
		
			}
	}else{ 
	?> 
		<div class="alert alert-warning">
		  <strong> YOU SCANNED THE BARCODE!!! SCAN THE IMEI  </strong>
		</div>
<?php
	}
}
?> 
 