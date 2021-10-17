<?php
//include('../../inc/connection.php');
$pay_count= mysqli_query($connection,"SELECT count(pay_id) as pays FROM  kp_pay_mode");

$ref_count= mysqli_query($connection,"SELECT count(pay_id) as pay_ref FROM  kp_pay_mode WHERE has_ref=1");
$ra = mysqli_fetch_assoc($ref_count);
$ref_count=$ra['pay_ref'];
$ca = mysqli_fetch_assoc($pay_count);
$count=$ca['pays'];
?>
<br>
<table class="table" style="width: 98%;">
  <thead>
    <tr>
      <th colspan="<?php echo $count+5+$ref_count; ?>"><h3><?php echo $today; ?> CASH SALES REPORT</h3></th>
    </tr>
    <tr> 
      <td><b>No</b></td> 
      <td><b>Sale id</b></td>
      <td><b>Customer</b></td> 
        <?php  
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
        ?>
      <td>Total</td>
    </tr>
      </thead>
      <tbody>
        <?php 
        $no=0;
        $sum=0; 
        $sumsc=0; 
        $bal=0;
        $total=0; 
        $req_items = mysqli_query($connection ,"SELECT * FROM kp_sales INNER JOIN kp_sale_payment ON kp_sales.sale_id = kp_sale_payment.sale_id  WHERE kp_sales.day='$today' AND kp_sales.type=1") or die(mysqli_error($connection));
        if (mysqli_num_rows($req_items) < 1) {
          echo "<p>There are no recorded Cash sales</p>";
        }else{
          while ( $data = mysqli_fetch_assoc($req_items)) {
            $sale_id= $data['sale_id']; 
            $amount = $data['total_amount'];
            $balance = $data['sale_bal'];
            $paid_amount=$amount-$balance;
            $cust_id = $data['cust_id'];
            $no=$no+1;
            $sum=$sum+$amount;
            $bal=$bal+$balance;
            $total=$total+$paid_amount;
            ?>
            <tr class="row-item">
              <td><?php echo $no; ?></td>
              <td><?php echo $sale_id; ?></td>
              <td > <?php  echo strtoupper(get_cust($cust_id));   ?> </td> 
              <?php 
              $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
              $sumsc=$sumsc+$data['modesc'];  
              ?>
              <td><?php echo $data['modesc']; ?></td> 
              <?php
              while ($pa = mysqli_fetch_assoc($pay_mode)) {
                $mode=$pa['pay_id'];
                ?>
                <td><?php echo $data['mode'.$mode]; ?></td>
                <?php 
                if ($pa['has_ref']==1) { 
                  ?>
                  <td><?php echo $data['moderef'.$mode]; ?></td>
                  <?php
                }
              } 
              ?>
              <td><?php echo $amount; ?></td>      
            </tr>
            <?php 
          }
        }
        ?> 
        <tr>
          <th colspan="<?php echo 3; ?>" class="text-center">Total Amount</th> 
          <?php
          $pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode ");
          ?>
          <th><?php echo $sumsc; ?></th>
          <?php
          while ($pa = mysqli_fetch_assoc($pay_mode)) {
            $mode=$pa['pay_id'];
            ?>
            <th><?php echo paymode_total($mode,$today,1);?></th>
            <?php
            if ($pa['has_ref']==1) { 
              ?>
              <th>-</th>
              <?php
            }
          }
          ?>
          <th><?php echo $sum; ?></th> 
        </tr>
      </tbody>
    </table>
  </br>