<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$total=0;
$day=$_REQUEST['day']; 
$str1=" ";
$title=""; 

$pay_count= mysqli_query($connection,"SELECT count(pay_id) as pays FROM  kp_pay_mode");
$ref_count= mysqli_query($connection,"SELECT count(pay_id) as pay_ref FROM  kp_pay_mode WHERE has_ref=1");
$ra = mysqli_fetch_assoc($ref_count);
$ref_count=$ra['pay_ref'];

$ca = mysqli_fetch_assoc($pay_count);
$count=$ca['pays'];
$type=2;
$sum=0;
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table">
      <thead>
          <tr>
            <th colspan="<?php echo $count+7+$ref_count; ?>" style="font-size: 19px;"><b><?php echo  $title." ".$day;?>  CREDIT PAYMENT REPORT</b></th>
          </tr>
          <tr>
            <th>Receipt No:</th> 
            <th>Customer</th>
            <th>Served By</th>
            <th>Time</th>  
            <th>Store Credit</th> 
            <?php
            $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode"); 
            while ($pa = mysqli_fetch_assoc($pay_mode)) { 
              ?>
              <th style=" color: white; background-color: <?php echo $pa['btn_color']; ?>"><?php echo $pa['name']; ?></th>
              <?php 
              if ($pa['has_ref']==1) { 
                ?>
                <th style=" color: white; background-color: <?php echo $pa['btn_color']; ?>"><?php echo $pa['name']; ?> CODE</th>
                <?php
              }
            }
            ?>
            <th>Total</th>  
          </tr>
      </thead>
      <tbody>
        <?php

        $sales = mysqli_query($connection,"SELECT * FROM kp_sale_cred_pay_hist INNER JOIN kp_sale_payment on kp_sale_payment.pay_id=kp_sale_cred_pay_hist.pay_id WHERE kp_sale_cred_pay_hist.day='$day' ORDER BY  kp_sale_cred_pay_hist.pay_id ASC");
         if (mysqli_num_rows($sales) < 1) {
          ?>
          <tr>
            <td colspan="<?php echo $count+8; ?>">
            
          <div class="alert alert-warning">
            <p>There are no recorded sales</p>
          </div>  
            </td>
          </tr>
          <?php
         }else{
          while ($sa = mysqli_fetch_assoc($sales)) {
            $sale_id = $sa['sale_id'];
            $cust_id = $sa['cust_id'];
            $user_id = $sa['user_id']; 
            $datime = date_create($sa['datime']);
            $amount=$sa['amount_paid'];
            $sum=$sum+$amount; 
          ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)">
              <td><?php echo $sale_id; ?></td> 
              <td><?php echo get_cust($cust_id); ?></td>                  
              <td><?php echo get_user($user_id); ?></td>
              <td><?php echo date_format($datime, "H:i:s"); ?></td>  
              <td><?php echo $sa['modesc']; ?></td> 
            <?php 
              $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
              while ($pa = mysqli_fetch_assoc($pay_mode)) {
                $mode=$pa['pay_id']; 
                ?>
                <td><?php echo $sa['mode'.$mode]; ?></td>
                <?php 
                if ($pa['has_ref']==1) { 
                  ?>
                  <td><?php echo $sa['moderef'.$mode]; ?></td>
                  <?php
                }
              } 
              ?> 
              <td><?php echo $amount; ?></td> 
            </tr>
             

          <?php 
          }
          ?>
          <!-- <tfoot> -->
            <tr>
              <th colspan="4" class="text-center">Total Amount</th>  
              <th><?php echo  paymode_total('sc',$day,$type,3);?></th>
                <?php
                $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
                while ($pa = mysqli_fetch_assoc($pay_mode)) {
                  $mode=$pa['pay_id'];    
                ?>
                <th><?php echo  paymode_total($mode,$day,$type,3);?></th>
                <?php
                  if ($pa['has_ref']==1) { 
                    ?>
                    <th> </th>
                    <?php
                  }
                } 
          ?>
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
                        
      
                        
 








