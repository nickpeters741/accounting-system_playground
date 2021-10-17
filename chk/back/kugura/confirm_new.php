<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id'];  
$action="LOADED SUSPEND MODAL FOR PURCHASE ORDER NO | ";
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM CREATE NEW PURCHASE ORDER</h4>
    </div>
    <div class="modal-body">
    	<div class="container-fluid">
    		<div class="row">
    			<div class="alert alert-warning">
    				<p>WARNING!! Are you sure you want to raise a new purchase order.</p>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">No</button>
        <a class="btn btn-lime btn-xs"  href="init_po.php">Yes</a>
    </div>
</div>