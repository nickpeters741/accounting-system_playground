<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
if (isset($_REQUEST['sup_id'])) {
	$sup_id = $_REQUEST['sup_id']; 
	$delete = mysqli_query($connection,"UPDATE kp_suppliers SET del_status=1 WHERE sup_id='$sup_id'") or die("Could not delete the Suppliers");
	if (!$delete) {
		$action="FAILED TO DISCONTINUE  SUPPLIER| ".get_sup($sup_id);
		$url="../../";
		logs($action,$url);
		?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting staff Details.</div> 
<?php
	}else{ 
		$action="DISCONTINUED SUPPLIER| ".get_sup($sup_id);
		$url="../../";
		logs($action,$url);
?>
		 <div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Archived.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'sup.php';

                        }, 100);
		</script>

		<?php
	}
}



?>