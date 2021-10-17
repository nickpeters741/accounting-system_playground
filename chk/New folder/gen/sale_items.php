<?php 
include('../inc/connection.php');

if(isset($_REQUEST['id'])){
  $sale_id = $_REQUEST['id'];
  $total=0;
?>
<div class="modal-content">
  <div class="modal-header"> 
    <h4 class="modal-title"> <i class="glyphicon glyphicon-user"></i>Receipt No: <?php echo $sale_id; ?> Items </h4> 
  </div>
  <div class="modal-body"> 
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
          $get_sale = "SELECT SUM(qty) AS tq,disc,item_id,price FROM kp_sale_items WHERE sale_id='$sale_id' GROUP BY item_id";
          $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
          
          while ($o = mysqli_fetch_assoc($get_sale_r)) {
             $item_id = $o['item_id'];
             
            $quantity=$o['tq'];
            $disc=$o['disc']; 
            $price = $o['price']-$disc;
            $amount=$quantity*$price; 

            $get_item_name = "SELECT name FROM kp_items WHERE item_id='$item_id'";
            $get_item_name_r = mysqli_query($connection,$get_item_name) or die("Could not get the item id");
             $i = mysqli_fetch_assoc($get_item_name_r);
              $name = $i['name'];
              $total=$total+$amount;
            
            ?>
            <tr>
               <td><?php echo $name; ?></td>
               <td><?php echo $quantity; ?></td>
               <td><?php echo $price; ?></td>
                <td><?php echo $disc; ?></td>
               <td><?php echo $amount; ?></td>
            </tr>
            <?php  } ?>
          
          <thead>
                <tr>
                   <th colspan="4">Total</th>
                   <th><?php echo $total; ?></th>
                </tr>
             </thead>
          </tbody>
  <?php

}?>

</div></div>
        </div> 
                        
      
                        
 








