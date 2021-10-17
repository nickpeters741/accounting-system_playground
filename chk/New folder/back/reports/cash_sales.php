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
 
if ($type==1) {
  $type_name="CASH";
  $str="INNER JOIN kp_sale_payment ON kp_sales.sale_id = kp_sale_payment.sale_id  WHERE kp_sales.type='$type' AND kp_sales.day BETWEEN '$start_date' AND '$end_date'".$shop;
}elseif ($type==2) {
  $type_name="CREDIT";
  $str="WHERE kp_sales.type='$type' AND kp_sales.day BETWEEN '$start_date' AND '$end_date'".$shop;
}else{
  $type_name="COMBINED";
  $str="WHERE kp_sales.day BETWEEN '$start_date' AND '$end_date'".$shop;
}
if ($type==1) {
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
            <th colspan="<?php echo $count+7+$ref_count; ?>" style="font-size: 19px;"><b><?php echo $start_date." TO ".$end_date." ".$type_name;?>  SALES REPORT</b></th>
          </tr>
          <tr>
            <th>SALE NO:</th> 
              <th>CUSTOMER</th>
              <th>SERVED BY</th>
              <th>TIME</th> 
              <?php 
              if ($type==1) {
              $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
            ?>
            <th>STORE CREDIT</th> 
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
              <th>TOTAL</th>  
               <th>PROFIT</th>  
          </tr>
      </thead>
      <tbody>
              <?php   
         $sales = mysqli_query($connection,"SELECT * FROM kp_sales  $str ORDER BY kp_sales.sale_id");
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
            $profit=column_total("kp_sale_items","profit","sale_id='$sale_id'");
            $sum=$sum+$sale_amount;
            $sump=$sump+$profit; 
          ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)" style="background-color: <?php echo $color; ?>">
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
              <td><?php echo $profit; ?></td> 
            </tr>   
            <?php 
            if ($det==1) {
              $get_sale = "SELECT SUM(qty) AS tq,item_id,price,total,profit FROM kp_sale_items WHERE sale_id='$sale_id'  GROUP BY item_id";
              $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
              while ($o = mysqli_fetch_assoc($get_sale_r)) {
                $item_id = $o['item_id'];
                $quantity=$o['tq']; 
                $price = $o['price'];
                $amount=$o['total']; 
                $profit=$o['profit']; 
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
                  <td><?php echo $profit; ?></td>
                      </tr>
                      <?php  }  
            }  
          }
          ?>
          <!-- <tfoot> -->
            <tr>
              <th colspan="4" class="text-center">Total Amount</th> 
              <?php
              if ($type==1) {
                ?>
                <th><?php echo  paymode_total('sc',$day,$type,$shop_id);?></th>
                <?php
                $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
                while ($pa = mysqli_fetch_assoc($pay_mode)) {
                  $mode=$pa['pay_id'];    
                ?>
                <th><?php echo  paymode_total($mode,$day,$type,$shop_id);?></th>
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
              <th><?php echo $sump; ?></th>
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
                        
      
                        
 








