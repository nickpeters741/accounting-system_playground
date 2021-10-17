<?php
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
if (isset($_REQUEST['item'])) {
	session_start();
	$user_id = $_SESSION['user_id'];
	$item = $_REQUEST['item'];
	$qty = $_REQUEST['qty'];


	if (empty($item) ) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Item  is a must.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'output.php';
			}, 200);
		</script>

	<?php
	}else{
		$current_stock = get_currentstock($item);
		$newqty = $current_stock + $qty;

		$update_item = "UPDATE kp_production_items SET  qty = '$newqty' WHERE item_id ='$item'";
		echo $update_item;
		$update_item_r = mysqli_query($connection,$update_item) or die("Error inserting ". mysqli_error($connection));
		if (!$update_item_r) {?>
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Failed to upload Try again...
			</div>
			<?php
		}else{?>
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong>Stock Succesfully Added.
		</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = 'output.php';
			}, 100);
		</script>
		<?php
		}
	}
}
?>