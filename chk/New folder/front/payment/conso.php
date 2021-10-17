<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 
$cust_id = $_REQUEST['cust_id']; 
$get_bal = "SELECT bal FROM kp_customers WHERE cust_id='$cust_id'";
$get_bal_r = mysqli_query($connection,$get_bal) or die("Could not fetch the order");
$sow=mysqli_fetch_assoc($get_bal_r);
$cust_bal=$sow['bal'];
?>
<div class="panel-heading"> 
  <h4>CONSOLIDATED PAYMENT FOR <?php echo get_cust($cust_id); ?></h4> 
</div> 
<div class="panel-body" id="load-cont">   
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>CUTOMER BALANCE</th>
        <th><?php echo $cust_bal; ?></th> 
      </tr>
    </thead> 
  </table>
</div>
<div class="panel-footer">
  <a  data-toggle="modal" data-target="#modal" id="pay_btn" class="btn  btn-xs btn-purple" onclick="pay_conso(<?php echo $cust_id; ?>,<?php echo $cust_bal; ?>)">CONSOLIDATE PAYMENT</a> 
</div>  





                



















