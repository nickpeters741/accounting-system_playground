<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
if(isset($_REQUEST['id'])){
  $ret_id = $_REQUEST['id'];
  $total=0;
?>
<div class="modal-content">
  <div class="modal-header"> 
    <h4 class="modal-title"> <i class="glyphicon glyphicon-user"></i>Return No: <?php echo $ret_id; ?> Items </h4> 
  </div>
  <div class="modal-body">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th> 
            <th>Total</th>
          </tr>
               </thead>
               <tbody>

            <?php
            $get_sale = "SELECT qty,item_id,price,total FROM kp_ret_items WHERE ret_id='$ret_id' GROUP BY item_id";
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
                 <td><?php echo $amount; ?></td>
              </tr>
              <?php  } ?>
            
            <thead>
                  <tr>
                     <th colspan="3" class="text-center"><h4>TOTAL</h4></th>
                     <th><h4><?php echo $total; ?></h4></th>
                  </tr>
               </thead>
            </tbody>
    <?php
  
}?>
  
</div></div>
        </div> 
                        
      
                        
 








