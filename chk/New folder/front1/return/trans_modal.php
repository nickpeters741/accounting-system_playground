<?php
$trans= $_REQUEST['trans'];
if ($trans=="HOLD") {
    $act="ret_hold.php";
}elseif ($trans=="CANCEL") {
    $act="ret_cancel.php";
} 
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');  
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$ret_id = $row['ret_id'];

$action="LOADED|-|-|-|".$act." MODAL FOR RETUN".$ret_id;
logs($action,"../../");  

?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM  <?php echo $trans; ?> </h4>
    </div>
    <div class="modal-body">
    	<div class="container-fluid">
    		<div class="row">
    			<div class="alert alert-danger">
    				<p>WARNING!! This action is irreversible and will delete currently placed orders.</p>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <a class="btn btn-purple btn-xs"  href="<?php echo $act; ?>"><?php echo $trans; ?></a>
    </div>
</div> 