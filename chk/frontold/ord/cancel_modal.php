<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');  
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$action="LOADED|-|-|-|CANCEL MODAL FOR SALE".$sale_id;
logs($action,"../../");  
?>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CANCEL ORDER</h4>
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
                <a class="btn btn-purple btn-xs"  href="cancel_order.php">CONTINUE</a>
            </div>
        </div> 