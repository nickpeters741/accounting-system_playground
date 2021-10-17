<?php
session_start();
include("../../inc/connection.php"); 
include("funcs.php");
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id']; 

$item_id = $_REQUEST['item'];
//$qty = $_REQUEST['qty'];

$get_po_details = mysqli_query($connection,"SELECT * FROM kp_grn_items WHERE grn_id='$grn_id' AND item_id='$item_id'") or die("Could not get the purchase details ");
$row = mysqli_fetch_assoc($get_po_details);
$qty = $row['qty'];
$price= $row['price']; 
?>
<div class="modal-content">
  <div id="result"></div>
  <div class="modal-header"> 
    <h5 class="modal-title" style="color: purple;">
      <i class="fa fa-stats"></i> &nbsp;&nbsp;ADD <U><?php echo  get_item($item_id); ?></U> TO STOCK FOR P.O NO: <?PHP echo $po_id; ?> IN GRN NO: <?PHP echo $grn_id; ?>
    </h5>
  </div>  
  <form action="to_stock_act.php" method="POST" id="perm-form">
    <div class="modal-body">
      <input type="hidden" class="form-control "  name="po" value="<?php echo $id; ?>"/>
      <input type="hidden" class="form-control "  name="id" value="<?php echo $item_id; ?>"/>
      <p style="color: red; font-weight: bolder;">REMEMBER!!!YOU CANNOT RECEIVE ZERO,LESS THAN OR GREATER THAN <u style="font-size: 16px;"><?php echo $qty; ?></u style="font-size: 16px;"></p>
      <div class="row">
        <div class="col-md-10 row">
          <label class="col-md-4" ><h4 style="margin-top: 5px;">QTY:</h4></label>
          <input type="text" class="form-control col-md-8"  id="qty" name="qty" value="<?php echo $qty; ?>"/>
        </div> 
      </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button> 
      <button type="submit" id="btn-confirm" class="btn btn-purple pull-right btn-xs">Confirm</button>
    </div>
  </form>
</div>   
 