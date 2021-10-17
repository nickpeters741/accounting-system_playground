<?php
session_start(); 
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');
$url = "../../assets";
if (!isset($_SESSION['user_id'])) {
   header("Location:../log_out.php");
}
if (isset($_GET['day'])) {
    $today=$_GET['day'];
}else{
  date_default_timezone_set("Africa/Nairobi");
  $today=date("Y-m-d");
} 
$folder="front/print/"; 
thesion_page($folder);
$user_id = $_SESSION['user_id']; 
if (isset($_GET['id'])) {
  $sale_id = $_GET['id'];
  $get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
  $row=mysqli_fetch_assoc($get_details);  
  $dash = $row['dashboard'];
}else{
  $get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
  $row=mysqli_fetch_assoc($get_details);
  $sale_id = $row['sale_id']; 
  $dash = $row['dashboard'];

} 

 
$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

 
$nos=59;


$action="PRINTED|-|-|-|CLOSE OF DAY ".$today;
logs($action,"../../");
backup_tables('../../');
?>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta name="description" content="Bootstrap Admin App + jQuery">
   <meta name="keywords" content="app, responsive, jquery, bootstrap, dashboard, admin">
   <title>PRINT SALE</title> 
   
</head>
 <link href="<?php echo $url; ?>/css/default/thermal_print.css" rel="stylesheet" />
<script>
  function logout(){
    window.location = '../dash/'+'<?php echo $dash; ?>';
  }
</script> 
 <!-- onload="logout();window.print()"-->
  <body>
    <div id="receipt">
      <div id="results"></div>
      <div id="bord">
        <div id="receipt-header" class="text-center">  
        </div>
        <div id="receipt-body">
          <table class="table">
            <thead>
              <tr class="text-center ">
                <th colspan="3">
                  <b><U><?PHP echo $today; ?> SALE SUMMARY</U></b>
                </th>
              </tr> 
            </thead>
            <tbody>
              <?php 
              $total_cash= column_total('kp_sales','total_amount',"day='$today' AND type=1"); 
              $total_cred= column_total('kp_sales','total_amount',"day='$today' AND type=2"); 
              ?>
              <tr>
                <td>CASH SALES</td>
                <td><?php echo $total_cash; ?></td>  
              </tr> 
              <tr>
                <td>CREDIT SALES</td>
                <td><?php echo $total_cred; ?></td>  
              </tr> 
               <tr>
                <td class="text-center"><b>TOTAL</b></td>
                <td><b><?php echo $total_cash+$total_cred; ?></b></td>  
              </tr> 
            </tbody>
          </table>  
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          
          <table class="table table-bordered">
              
          <thead>
            <tr class="text-center ">
              <th colspan="3">
                <b><U><?PHP echo $today; ?> CASH BOX SUMMARY</U></b>
              </th>
            </tr> 
          </thead>
            <tbody>
            <?php
            $sum=0;
              $get_mode = "SELECT * FROM kp_pay_mode"; 
              $get_mode_r = mysqli_query($connection,$get_mode) or die("Could not fetch the payment mode");
              while ($o = mysqli_fetch_assoc($get_mode_r)) {  
                $mode_id=$o['pay_id']; 
                $name = $o['name']; 
                $col="mode".$mode_id;
                $mode_total=column_total('kp_sale_payment',$col,"pay_date='$today'");
              ?>
                <tr>
                   <td><?php echo $mode_id; ?></td>
                   <td><?php echo $name; ?></td> 
                   <td><?php echo  $mode_total;//pay_mode_total($mode_id,$today,1); ?></td>
                </tr>
                <?php  
                $sum=$sum+$mode_total;
              }  
                 ?>
             <tr>
                   <td colspan="2" class="text-center"><b>TOTAL</b></td>
                   <td><b><?php echo $sum; ?></b></td>  
                </tr> 
            </tbody>
          </table>
         <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
<table class="table table-bordered">
            <thead>
            <tr class="text-center ">
              <th colspan="4">
                <b><U><?PHP echo $today; ?> CREDIT PAYMENT SUMMARY</U></b>
              </th>
            </tr> 
            <tr>
              <th>PAY ID</th>
              <th>Customer</th>
              <th>Amount</th>
              <th>Balance</th>
            </tr>
          </thead>
            <tbody>
            <?php
            $sum=0;
              $get_cred = "SELECT * FROM kp_sale_cred_pay_hist WHERE day='$today'"; 
              $get_cred_r = mysqli_query($connection,$get_cred) or die("Could not fetch the payment mode");
              while ($cr = mysqli_fetch_assoc($get_cred_r)) {  
                $pay_id=$cr['pay_id']; 
                $cust_id = $cr['cust_id']; 
                $amount=$cr['amount'];
                $bal=$cr['cf_bal'];;
              ?>
                <tr>
                   <td><?php echo $pay_id; ?></td>
                   <td><?php echo get_column('kp_customers','name',"cust_id='$cust_id'");; ?></td> 
                   <td><?php echo  $amount;//pay_mode_total($mode_id,$today,1); ?></td>
                   <td><?php echo  $bal//pay_mode_total($mode_id,$today,1); ?></td>
                </tr>
                <?php  
                $sum=$sum+$amount;
              }  
                 ?>
             <tr>
                   <td colspan="2" class="text-center"><b>TOTAL</b></td>
                   <td><b><?php echo $sum; ?></b></td>  
                   <td></td>
                </tr> 
            </tbody>
          </table>
         <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <table class="table table-bordered">
            <thead>
              <tr class="text-center ">
                <th colspan="4">
                  <b><U><?PHP echo $today; ?> ITEMS SALE SUMMARY</U></b>
                </th>
              </tr> 
            </thead>
            <tbody>
            <?php
            $sum=0;
            $no=0;
              $get_cs = "SELECT item_id,SUM(total) AS stt,SUM(qty) AS sqty FROM kp_sale_items WHERE  day='$today' GROUP BY item_id ORDER BY sqty DESC"; 
              $get_cs_r = mysqli_query($connection,$get_cs) or die("Could not fetch the payment mode");
              while ($o = mysqli_fetch_assoc($get_cs_r)) {   
                $item_id = $o['item_id']; 
                $sqty= $o['sqty']; 
                $stt = $o['stt']; 
                $no=$no+1;
              ?>
                <tr>
                   <td><?php echo $no; ?></td>
                   <td><?php echo get_column('kp_items','name',"item_id='$item_id'"); ?></td> 
                   <td><?php echo $sqty; ?></td> 
                   <td><?php echo $stt; ?></td>  
                </tr>
                <?php  

            $sum=$sum+$stt;
              }  
                 ?>
             <tr>
                   <td colspan="3" class="text-center"><b>TOTAL</b></td>
                   <td><b><?php echo $sum; ?></b></td>  
                </tr> 
            </tbody>
          </table>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <?php
          $pur_sum=0;
          $purchase = mysqli_query($connection,"SELECT * FROM kp_po WHERE ord_date='$today'") or die('Error fetching the purchases.:'.mysqli_error($connection));
          if (mysqli_num_rows($purchase) < 1) {}else{
            ?>    
            <table class="table">
              <thead>
                <tr>
                  <td colspan="5" class="text-center"><B><?php echo $today; ?> END OF DAY PURCHASES SUMMARY</B></td>
                </tr>
                <tr>
                  <th>Supplier</th>
                  <th>PO. No</th>
                  <th>PO By</th>
                  <th>Status</th>
                  <th>Amount</th>
                </tr>
              </thead>
              <tbody> 
                <?php
                while ($pow = mysqli_fetch_assoc($purchase)){
                      $po_by = $pow['ord_user'];
                      $sup_id = $pow['sup_id'];
                      $po_id  = $pow['po_id'];
                      $r_status = $pow['rec_status'];
                      $amount = $pow['amount']; 
                      $pur_sum=$pur_sum+$amount;
                    ?>
                  <tr>
                    <td><?php echo get_sup($sup_id); ?></td>
                    <td><?php echo $po_id; ?></td>
                    <td><?php echo get_column('kp_users','username',"user_id='$po_by'"); ?></td>
                    <td><?php if ($r_status==1) { echo "RECEIVED"; } else{ echo "PENDING"; } ?></td>
                    <td><?php echo $amount; ?></td>
                  </tr>
                  <?php
                      } 
                   
                  ?> 
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="4" class="text-center"><b>TOTAL</b></td>
                    <td><b><?php echo $pur_sum;?></b></td>
                  </tr>
                </tfoot>
              </table>   
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <?php
              } 
              ?>
              <table class="table table-bordered">
            <thead>
              <tr class="text-center ">
                <th colspan="4">
                  <b><U><?PHP echo $today; ?> PURCHASED ITEMS SUMMARY</U></b>
                </th>
              </tr> 
            </thead>
            <tbody>
            <?php

            $sum=0;
            $no=0;
              $get_cs = "SELECT item_id,SUM(total) AS stt,SUM(qty) AS sqty FROM kp_po_items WHERE  day='$today' GROUP BY item_id ORDER BY sqty DESC"; 
              $get_cs_r = mysqli_query($connection,$get_cs) or die("Could not fetch the payment mode");
              while ($o = mysqli_fetch_assoc($get_cs_r)) {   
                $item_id = $o['item_id']; 
                $sqty= $o['sqty']; 
                $stt = $o['stt']; 
                $no=$no+1;
              ?>
                <tr>
                   <td><?php echo $no; ?></td>
                   <td><?php echo get_column('kp_items','name',"item_id='$item_id'"); ?></td> 
                   <td><?php echo $sqty; ?></td> 
                   <td><?php echo $stt; ?></td>  
                </tr>
                <?php  

            $sum=$sum+$stt;
              }  
                 ?>
             <tr>
                   <td colspan="3" class="text-center"><b>TOTAL</b></td>
                   <td><b><?php echo $sum; ?></b></td>  
                </tr> 
            </tbody>
          </table>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
        </div>
        <div id="receipt-footer">
         <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <h4 style="margin: 0px 0px 0px 0px; text-align: center;"><B>OFFICIAL USE ONY</B></h4>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <table class="table">
            <tbody>  
              <tr>
                <td>CASHIER SIGN</td>
                <td style="padding: 10px 0px 0px 0px;">..................................................</td>
                
              </tr> 
               <tr>
                <td>SUPERVISOR SIGN</td>
                <td style="padding: 10px 0px 0px 0px;">..................................................</td>
                
              </tr> 
               <tr>
                <td>SUPERVISOR REMARKS</td>
                <td style="padding: 10px 0px 0px 0px;">..................................................</td>
                
              </tr> 
               </tbody> 
          </table>
        </div> 
      </div>
    </div>
  </body>
</html>
