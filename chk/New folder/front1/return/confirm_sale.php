<?php
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');

$sale_id= $_REQUEST['id'];
$cust_id= $_REQUEST['cust_id'];
$get_items = mysqli_query($connection,"SELECT * FROM kp_ret_status WHERE sale_id='$sale_id'");
$sow=mysqli_num_rows($get_items);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM THAT SALE <?php echo $sale_id; ?> DETAILS ARE OK</h4>
    </div>
    <div class="modal-body">
        <?php if ($sow>0) {
                  ?>
        <div class="alert alert-danger">
            <p style="color: red; font-weight: bold;">WARNING!! THIS SALE IS CURRENTLY CONTINUING.IF YOU ARE THE ONE WHO STARTED CLOSE AND CONTINUE THE ORDER.</p>
        </div>
        <?php
        }else{
            ?>
    	<div class="alert alert-danger">
    		<p>WARNING!! This action is irreversible and will delete currently placed orders.</p>
    	</div>
        <?php
    }
        ?> 
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <?php if ($sow>0) {
            # code...
        }else{
            ?>
        <a class="btn btn-lime btn-xs"  href="init_ret.php?cust_id=<?php echo $cust_id; ?>&id=<?php echo $sale_id; ?>">CONFIRM</a>
            <?php
        } ?>
    </div>
</div> 