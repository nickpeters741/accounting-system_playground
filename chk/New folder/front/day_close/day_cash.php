<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$total=0;
$day=$_REQUEST['day'];
$type = $_REQUEST['id'];   
  $str1=" ";
  $title=""; 
   
$sum=0;
if ($type==1) {
  $type_name="CASH";
  $str="INNER JOIN kp_sale_payment ON kp_sales.sale_id = kp_sale_payment.sale_id  WHERE kp_sales.day='$day' AND kp_sales.type='$type' $str1";
}elseif ($type==2) {
  $type_name="CREDIT";
  $str="WHERE kp_sales.day='$day' AND kp_sales.type='$type' $str1";
}else{
  $type_name="COMBINED";
  $str="WHERE kp_sales.day='$day' $str1";
}
if ($type==1 OR $type==2) {
$pay_count= mysqli_query($connection,"SELECT count(pay_id) as pays FROM  kp_pay_mode");
$ref_count= mysqli_query($connection,"SELECT count(pay_id) as pay_ref FROM  kp_pay_mode WHERE has_ref=1");
$ra = mysqli_fetch_assoc($ref_count);
$ref_count=$ra['pay_ref'];
$ca = mysqli_fetch_assoc($pay_count);
$count=$ca['pays'];
}else{
$count=0;
$ref_count=0; 
}
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table">
      <thead>
          <tr>
            <th colspan="<?php echo $count+7+$ref_count; ?>" style="font-size: 19px;"><b><?php echo $title." ".$day." ".$type_name;?>  SALES REPORT</b></th>
          </tr>
          <tr>
            <th>Receipt No:</th> 
              <th>Customer</th>
              <th>Served By</th>
              <th>Time</th> 
              <?php 
              if ($type==1) {
              $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
            ?>
            <th>Store Credit</th> 
            <?php
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
      } 
            ?>
              <th>Total</th>  
          </tr>
      </thead>
      <tbody>
              <?php 
 
         $sales = mysqli_query($connection,"SELECT * FROM kp_sales  $str ORDER BY kp_sales.sale_id");
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
            $refno = $sa['refno'];
            $typo = $sa['type'];
            if ($typo==1) {
              $sale="CASH";
            }elseif ($typo==2) {
              $sale="CREDIT";
            }else{
              $sale="ERROR";
            }
            $datime = date_create($sa['datime']);
            $sale_amount=$sa['total_amount'];
            $sum=$sum+$sale_amount; 
          ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)">
              <td><?php echo $sale_id; ?></td> 
              <td><?php echo get_cust($cust_id); ?></td>                  
              <td><?php echo get_user($user_id); ?></td>
              <td><?php echo date_format($datime, "H:i:s"); ?></td> 
              
              <?php
                if ($type==1) {
                  $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
                  ?>
             
              <td><?php echo $sa['modesc']; ?></td> 
            <?php
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
                } 
              ?>
              <td><?php echo $sale_amount; ?></td> 

            </tr>
             

          <?php 
          }
          ?>
          <!-- <tfoot> -->
            <tr>
              <th colspan="4" class="text-center">Total Amount</th> 
              <?php
              if ($type==1) {
                ?>
                <th><?php echo  paymode_total('sc',$day,$type,$shop);?></th>
                <?php
                $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
                while ($pa = mysqli_fetch_assoc($pay_mode)) {
                  $mode=$pa['pay_id'];    
                ?>
                <th><?php echo  paymode_total($mode,$day,$type,$shop);?></th>
                <?php
                  if ($pa['has_ref']==1) { 
                    ?>
                    <th> </th>
                    <?php
                  }
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
                        
      
                        
 








