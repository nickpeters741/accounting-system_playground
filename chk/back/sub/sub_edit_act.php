<?php
include('../../inc/connection.php');
if (isset($_REQUEST['name'])) {

	$name =strtoupper($_REQUEST['name'] );
	$cat_id = $_REQUEST['cat_id'];
 	$desc = strtoupper($_REQUEST['desc'] ); 
 	$code = strtoupper($_REQUEST['code'] );
 	$sub_id = $_REQUEST['sub_id'];

	if ( empty($name) or empty($cat_id) ) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Warning!</strong> Please Fill All The Fields.
</div>
<?php
	}else{ 
		$edit_sub = "UPDATE kp_sub_cat SET name='$name',sub_desc='$desc',cat_id='$cat_id',code='$code' WHERE sub_id='$sub_id'" or die("Error edition the sub category");
		$edit_sub_r = mysqli_query($connection,$edit_sub) or die("error on 18".mysqli_error($connection));
 
	if (!$edit_sub_r) {
			?>

		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Failed!</strong> Failed To Edited.
		</div>
		<!-- <script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script> -->

		<?php
		}else{
			?>

		<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Success Edited.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'sub.php';

                        }, 100);
		</script>

		<?php
		}
	}

}
?>