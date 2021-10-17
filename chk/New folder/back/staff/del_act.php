<?php
session_start();
include("../../inc/connection.php");
include('../../inc/gen_funcs.php');
include('../../inc/connection.php');
if (isset($_REQUEST['staff_id'])) {
	$staff_id = $_REQUEST['staff_id']; 
	$delete = mysqli_query($connection,"UPDATE kp_staff SET staff_del_status=1 WHERE staff_id='$staff_id'") or die("Could not archive staff");
	if (!$delete) {
		?>
		 <div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error Deleting staff Details.</div>
		 

		<?php
	}else{
		$action="DELETED|-|-|STAFF |".get_staff($staff_id);
    logs($action,"../../");
?>
		 <div class="alert alert-Success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Deleted.</div>
		<script type="text/javascript">
			window.setTimeout(function(){

                            window.location.href = 'staff.php';

                        }, 100);
		</script>

		<?php
	}
}



?>