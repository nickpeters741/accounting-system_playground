<?php
session_start();
include("../../inc/connection.php"); 
include("../clude/funcs.php");
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id']; 

$item_id = $_REQUEST['item'];
//$qty = $_REQUEST['qty'];

$get_po_details = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id' AND item_id='$item_id'") or die("Could not get the purchase details ");
$row = mysqli_fetch_assoc($get_po_details);
$qty = $row['qty'];
$price= $row['price']; 
?>
<div class="modal-content">
  <div id="result"></div>
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h4 class="modal-title">
        <i class="fa fa-stats"></i> &nbsp;&nbsp;ADD <U><?php echo  get_item($item_id); ?></U> TO STOCK FOR P.O NO: <?PHP echo $po_id; ?> IN GRN NO: <?PHP echo $grn_id; ?>
      </h4>
    </div>  
    <form action="to_stock_act.php" method="POST" id="perm-form">
    <div class="modal-body">
      <input type="hidden" class="form-control "  name="po" value="<?php echo $id; ?>"/>
      <input type="hidden" class="form-control "  name="id" value="<?php echo $item_id; ?>"/>
      <p style="color: red;">REMEMBER!!!YOU CANNOT RECEIVE ZERO,LESS THAN OR GREATER THAN THE QUANTITY RECEIVED</p>
         <div class="row">
            <?php
                      // $get_stores = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'") or die("Could not get any items");
                      // $sow = mysqli_fetch_assoc($get_stores);   
                      //   $arr = explode(', ',$sow['store_id']); 
                      //   foreach($arr as $i) {  
                          ?>
                          <div class="col-md-10 row">
                            <label class="col-md-4" ><h4 style="margin-top: 5px;">QTY:</h4></label>
                            <input type="text" class="form-control col-md-8"  id="qty" name="qty" value="0"/>
                          </div> 
                    <?php 
                     // } 
                    ?>
           
            
         </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button> 
      <button type="submit" id="btn-confirm" class="btn btn-warning pull-right btnSubmit">Confirm</button>
    </div>
  </form>
  </div>   
 