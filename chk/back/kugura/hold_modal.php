<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$action="LOADED SUSPEND MODAL FOR PURCHASE ORDER NO | ".$po_id;
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">HOLD PURCHASE ORDER <?php echo $po_id; ?></h4>
    </div>
    <div class="modal-body"> 
		<div class="row">
			<div class="alert alert-warning col-md-12">
				<p>WARNING!! This action will Hold your order.</p>
			</div> 
        </div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <a class="btn btn-lime btn-xs"  href="hold_po.php">Hold</a>
    </div>
</div>