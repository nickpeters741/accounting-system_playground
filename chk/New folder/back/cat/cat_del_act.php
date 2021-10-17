<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['cat_id'])) {
	$cat_id = $_REQUEST['cat_id'];
	$id = $_REQUEST['id'];
	$delete = mysqli_query($connection,"DELETE FROM kp_category WHERE cat_id='$cat_id'") or die("Could not delete the customer");
	if (!$delete) {
		?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting staff Details.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
	}else{
		$edit_item = "UPDATE kp_items SET cat_id='$id' WHERE cat_id='$cat_id'";
	$edit_item_r = mysqli_query($connection,$edit_item) or die(mysgli_error($connection));
?>
		 <div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
	}
}



?>