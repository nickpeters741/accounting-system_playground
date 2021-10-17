<?php
include('../../inc/connection.php');
if (isset($_REQUEST['name'])) {

	$name =strtoupper($_REQUEST['name']);
	$cat_id = $_REQUEST['cat_id'];
	$code = strtoupper($_REQUEST['code']);

	$desc = strtoupper($_REQUEST['desc']);

	if ( empty($name) or empty($cat_id) or empty($code)) {
		?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Please Fill All The Fields.</div>
		 
		<?php
	}else{

		$edit_item = "UPDATE kp_category SET name='$name',code='$code',cat_description='$desc' WHERE cat_id='$cat_id'" or die("Error edition the file");
		$edit_item_r = mysqli_query($connection,$edit_item) or die("error on 18".mysqli_error($connection));
 
	if (!$edit_item_r) {
			?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Failed!</strong> Failed To Edited. Contact Administrator</div>
		 
		<?php
		}else{
			?>

		<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Success Edited.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
		}
	}

}
?>