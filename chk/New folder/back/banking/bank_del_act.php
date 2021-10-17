<?php
session_start();
include('../../inc/connection.php');
if (isset($_REQUEST['bank_id'])) {
	$bank_id = $_REQUEST['bank_id'];
	$bank = $_REQUEST['bank'];
	$delete = mysqli_query($connection,"UPDATE kp_banks SET del_status=1 WHERE bank_id='$bank_id'") or die("Could not update bank del status");
	if (!$delete) {
		?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting Menu .</div>
		 <?php
	}else{
		$edit_item = "UPDATE kp_pay_mode SET bank_id='$bank' WHERE bank_id='$bank_id'";
		$edit_item_r = mysqli_query($connection,$edit_item) or die(mysgli_error($connection));
?>
		 <div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
		<script type="text/javascript">
			window.setTimeout(function(){
							var pnl ='<?php echo $pnl; ?>'
                            window.location.href = 'banks.php';

                        }, 100);
		</script>

		<?php
	}
}



?>