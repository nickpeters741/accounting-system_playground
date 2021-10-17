<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['menu_id'])) {
	$menu_id = $_REQUEST['menu_id'];
	$menu = $_REQUEST['menu'];
	$pnl = $_REQUEST['pnl'];
	$delete = mysqli_query($connection,"DELETE FROM kp_menu WHERE menu_id='$menu_id'") or die("Could not delete the customer");
	if (!$delete) {
		?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting Menu .</div>
		<script type="text/javascript">
			window.setTimeout(function(){
				var pnl ='<?php echo $pnl; ?>'
                window.location.href = 'menu.php?pnl='+pnl;

                        }, 100);
		</script>

		<?php
	}else{
		$edit_item = "UPDATE kp_menu SET parent='$menu' WHERE parent='$menu_id'";
		$edit_item_r = mysqli_query($connection,$edit_item) or die(mysgli_error($connection));
?>
		 <div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
							var pnl ='<?php echo $pnl; ?>'
                            window.location.href = 'menu.php?pnl='+pnl;

                        }, 100);
		</script>

		<?php
	}
}



?>