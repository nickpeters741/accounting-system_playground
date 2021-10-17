<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 
if ($po_id==0) {
  header("Location: init_page.php");
}else{ 
$action="LOADED CANCEL MODAL FOR PURCHASE ORDER NO | ".$po_id;
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CANCEL PURCHASE ORDER <?php echo $po_id; ?></h4>
    </div>
    <div class="modal-body">
    		<div class="row">
    			<div class="alert alert-danger col-md-12">
    				<p>WARNING!! This action is irreversible and will delete currently placed items in this orders.</p>
    			</div>
    		</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">NO</button>
        <a class="btn btn-lime btn-xs"  href="cancel_po.php">YES</a>
    </div>
</div>
<?php } ?>