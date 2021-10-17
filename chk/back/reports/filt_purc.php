<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$total=0;
$day=today();
$type = $_REQUEST['id']; 
$start_date = mysqli_real_escape_string($connection,$_REQUEST['start_date']);
$end_date = mysqli_real_escape_string($connection,$_REQUEST['end_date']);
$det = mysqli_real_escape_string($connection,$_REQUEST['det']); 
$sum=0;
$sump=0; 
  $shop="";

if ($det==1) {
  $color="grey";
}else{
  $color="white";
}
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table">
      <thead>
          <tr>
            <th colspan="<?php echo 5; ?>" style="font-size: 19px;"><b><?php echo $start_date." TO ".$end_date." ".$type_name;?>  PURCHASES REPORT</b></th>
          </tr>
          <tr>
            <th>PO NO:</th> 
            <th>SUPPLIER</th>
            <th>SERVED BY</th>
            <th>DATE</th>   
            <th>TOTAL</th>   
          </tr>
      </thead>
      <tbody>
              <?php   
         $po = mysqli_query($connection,"SELECT * FROM kp_po WHERE ord_date BETWEEN '$start_date' AND '$end_date'");
         if (mysqli_num_rows($po) < 1) {
          ?>
          <tr>
            <td colspan="<?php echo 5; ?>">
              <div class="alert alert-warning">
                <p>There are no recorded sales</p>
              </div>  
            </td>
          </tr>
          <?php
         }else{
          while ($sa = mysqli_fetch_assoc($po)) {
            $po_id = $sa['po_id'];
            $sup_id = $sa['sup_id'];
            $user_id = $sa['user_id']; 
            $ord_date = $sa['ord_date']; 
            $datime = $sa['datime'];
            $amount=$sa['amount']; 
            $sum=$sum+$amount; 
          ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)" style="background-color: <?php echo $color; ?>">
              <td><?php echo $PO_id; ?></td> 
              <td><?php echo get_sup($sup_id); ?></td>                  
              <td><?php echo get_user($user_id); ?></td>              
              <td><?php echo $ord_date; ?></td>     
              <td><?php echo $amount; ?></td>  
            </tr>   
            <?php 
            if ($det==1) {
              $get_sale = "SELECT * FROM kp_po_items WHERE po_id='$po_id'  GROUP BY item_id";
              $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
              while ($o = mysqli_fetch_assoc($get_sale_r)) {
                $item_id = $o['item_id'];
                $quantity=$o['qty']; 
                $price = $o['price'];
                $amount=$o['total'];  
                ?>
                <tr>
                  <td></td>
                  <td><?php echo get_item($item_id); ?></td>
                  <td><?php echo $quantity; ?></td>
                  <td><?php echo $price; ?></td>
                  <td><?php echo $amount; ?></td> 
                      </tr>
                      <?php  }  
            }  
          }
          ?>
          <!-- <tfoot> -->
            <tr>
              <th colspan="4" class="text-center">Total Amount</th>  
              <th><?php echo $sum; ?></th>  
            </tr>
          <!-- </tfoot> -->
          <?php
         }
         ?>

      
      
        </tbody>
      

          </table>
      
    </div>
  </div>
</div> 
                        
      
                        
 








