<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');

if(isset($_REQUEST['id']))
  {

    $qt_id = $_REQUEST['id'];
    $total=0;
?>

     <div class="modal-content">
      <div class="modal-header"> 
           <h4 class="modal-title"> <i class="glyphicon glyphicon-user"></i>Receipt No: <?php echo $sale_id; ?> Items </h4> 
        </div> 
        <div class="modal-body">                     
           <div id="modal-loader" style="display: none; text-align: center;">
           <!-- ajax loader -->
           </div>
           <div class="table-responsive">
              <table class="table table-bordered">
               <thead>
                  <tr>
                     <th>Name</th>
                     <th>Quantity</th>
                     <th>Price</th>
                     <th>Discount</th>
                     <th>Total</th>
                  </tr>
               </thead>
               <tbody>

            <?php
            $get_sale = "SELECT * FROM kp_qt_items WHERE qt_id='$qt_id'";
            $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
            
            while ($o = mysqli_fetch_assoc($get_sale_r)) {
              $item_id = $o['item_id'];
              $quantity=$o['qty']; 
              $price = $o['price'];
              $amount=$o['total'];
              $total=$total+$amount;
              ?>
              <tr>
                 <td><?php echo get_item($item_id); ?></td>
                 <td><?php echo $quantity; ?></td>
                 <td><?php echo $price; ?></td>
                  <td><?php echo $disc; ?></td>
                 <td><?php echo $amount; ?></td>
              </tr>
              <?php  } ?>
            
            <thead>
                  <tr>
                     <th colspan="4" class="text-center">Total</th>
                     <th><?php echo $total; ?></th>
                  </tr>
               </thead>
            </tbody>
    <?php
  
}?>
</table>
  
</div></div>
        </div> 
                        
      
                        
 








