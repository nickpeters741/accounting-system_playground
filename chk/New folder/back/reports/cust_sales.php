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
$cust_id = mysqli_real_escape_string($connection,$_REQUEST['cust_id']);
$sum=0; 
$str="WHERE cust_id='$cust_id' AND day BETWEEN '$start_date' AND '$end_date'"; 
 
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table">
      <thead>
          <tr>
            <th colspan="6" style="font-size: 19px; font-weight: bold;" class="text-center"><u><?php echo $start_date." TO ". $end_date." ".get_cust($cust_id);?>  SALES REPORT </u></th>
          </tr>
          <tr>
            <th>SALE NO:</th>  
            <th>SERVED BY</th>
            <th>DATE</th> 
            <th>TIME</th>
            <th>TYPE</th>   
            <th>AMOUNT</th>  
          </tr>
      </thead>
      <tbody>
        <?php 
        $sales = mysqli_query($connection,"SELECT * FROM kp_sales  $str ORDER BY sale_id");
        if (mysqli_num_rows($sales) < 1) {
        ?>
        <tr>
          <td colspan="<?php echo $count+9; ?>">
              <div class="alert alert-warning">
                <p>There are no recorded sales</p>
              </div>  
            </td>
          </tr>
          <?php
         }else{
          while ($sa = mysqli_fetch_assoc($sales)) {
            $sale_id = $sa['sale_id']; 
            $user_id = $sa['user_id'];
            $refno = $sa['refno'];
            $typo = $sa['type'];
            if ($typo==1) {
              $sale="RECEIPT";
            }elseif ($typo==2) {
              $sale="INVOICE";
            }else{
              $sale="ERROR";
            }
            $datime = date_create($sa['datime']);
            $sale_amount=$sa['total_amount'];
            $sum=$sum+$sale_amount; 
          ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)" style="background-color: grey;">
              <td><?php echo $sale_id; ?></td>                    
              <td><?php echo get_user($user_id); ?></td>
              <td><?php echo $sa['day']; ?></td>
              <td><?php echo date_format($datime, "H:i:s"); ?></td>  
              <td><?php echo $sale; ?></td> 
              <td><?php echo $sale_amount; ?></td> 
            </tr>   
            <?php 
            if ($det==1) {
              $get_sale = "SELECT SUM(qty) AS tq,item_id,price,total FROM kp_sale_items WHERE sale_id='$sale_id'  GROUP BY item_id";
              $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
              while ($o = mysqli_fetch_assoc($get_sale_r)) {
                $item_id = $o['item_id'];
                $quantity=$o['tq']; 
                $price = $o['price'];
                $amount=$o['total']; 
                ?>
                <tr>
                  <td></td>
                  <td><?php echo get_item($item_id); ?></td>
                  <td><?php echo $quantity; ?></td>
                  <td><?php echo $price; ?></td>
                  <td><?php echo $amount; ?></td>
                  <?php 
                  if($type==1){
                    ?>
                  <td colspan="<?php echo $count+$ref_count+1; ?>"></td>
                    <?php
                  }
                  ?>
                      </tr>
                      <?php  }  
            }  
          }
          ?> 
            <tr>
              <th colspan="5" class="text-center">Total Amount</th> 
              <th><?php echo $sum; ?></th> 
            </tr> 
          <?php
         }
         ?>
       </tbody>
     </table>
      
    </div>
  </div>
</div> 
                        
      
                        
 








