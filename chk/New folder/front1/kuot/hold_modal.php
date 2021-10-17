<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id'];

$action="LOADED|-|-|-|HOLD MODAL|".$qt_id;
logs($action,"../../");  
?>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">HOLD QUOTATION NO <?php echo $qt_id; ?></h4>
            </div>
            <div class="modal-body">
            	<div class="container-fluid">
            		<div class="row">
            			<div class="alert alert-danger col-md-12">
            				<p>WARNING!! Are you sure you want to Hold this sale.</p>
            			</div>
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
                <a class="btn btn-lime btn-xs"  href="hold.php">CONTINUE</a>
            </div>
        </div>