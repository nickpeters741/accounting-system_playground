<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['sub_id'])) {
	$sub_id = $_REQUEST['sub_id'];
	$id = $_REQUEST['id'];
	$delete = mysqli_query($connection,"DELETE FROM kp_sub_cat WHERE sub_id='$id'") or die("Could not delete the customer");
	if (!$delete) {
		?>
		 <div class="alert alert-danger">
		 	<a href="#" class="close" data-dismiss="alert">&times;</a>
		 	<strong>Warning!</strong> Error Deleting Category Details.
		 </div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'sub.php';
			}, 100);
		</script>

		<?php
	}else{
		$edit_item = "UPDATE kp_items SET sub_id='$id' WHERE sub_id='$sub_id'";
	$edit_item_r = mysqli_query($connection,$edit_item) or die(mysgli_error($connection));
?>
		 <div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'sub.php';
			}, 100);
		</script>
		<?php
	}
}
?>