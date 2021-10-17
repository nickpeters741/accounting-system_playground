<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$invoices = $_REQUEST['invoices'];
$cust_id = $_REQUEST['cust_id'];
$total=0;
$no=0;
?>
<div class="panel-heading"> 
  <h4>BULK PAYMENT FOR <?php echo get_cust($cust_id); ?></h4> 
</div> 
<div class="panel-body">   
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>#.</th>
        <th>INVOICE NO.</th>
        <th>INV AMOUNT</th>
        <th>PAID</th>
        <th>BALANCE</th> 
      </tr>
    </thead>
    <tbody>
      <?php
      $arr = explode(",", $invoices);
      foreach($arr as $c) { 
        $get_sale = "SELECT sale_amount,total_amount,sale_bal FROM kp_sales WHERE sale_id='$c'";
        $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
        $sow=mysqli_fetch_assoc($get_sale_r);
        $sale_bal=$sow['sale_bal'];
        $total_amount=$sow['total_amount'];
        $total=$total+$sale_bal;
        $no=$no+1;
        ?>
        <tr>
          <td><?php echo $no; ?></td>
          <td><?php echo $c; ?></td>
          <td><?php echo $total_amount; ?></td>
          <td><?php echo $total_amount-$sale_bal; ?></td>
          <td><?php echo $sale_bal; ?></td>
        </tr> 
        <?php 
      } 
      ?> 
      <tr>
        <th colspan="4">Total</th>
        <th><?php echo $total ; ?></th>
      </tr> 
    </tbody>
  </table>
</div>
<div class="panel-footer">
  <a  data-toggle="modal" data-target="#modal" id="cash_btn" class="btn  btn-xs btn-purple" onclick="pay(<?php echo $cust_id; ?>,<?php echo $total; ?>)">INVOICE PAYMENT</a> 
</div>  





                



















