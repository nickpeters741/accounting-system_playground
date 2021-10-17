<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$sale_type = $row['sale_type'];
$mkt = $row['mkt'];
$dash = $row['dash'];
$deli = $_REQUEST['deli'];

$time=date("h:i:a");

$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");

$get_customer = mysqli_query($connection ,"SELECT * FROM kp_customers WHERE cust_id= '$cust_id'") or die(mysqli_error($connection));
$cust = mysqli_fetch_assoc($get_customer);
$name= $cust['name'];
$order_t=sale_amount($sale_id); 
 
$nos=53;

$action="PREVIEWED|-|-|-|CASH SALE NO ".$sale_id;
logs($action,"../../"); 
 
?> 
<link href="../../assets/css/default/thermal_print.css" rel="stylesheet" />
<div class="modal-content" style="width: 86mm;">
  <div class="modal-body"> 
  <div id="receipt"> 
          <div id="receipt-header" class="text-center">
           
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <?php if ($row['pin']==1 ){ ?>
             <span class="pull-left">PIN: <?php echo $gen['kra_pin']; ?></span>
           <?php }?>
            <span class="pull-right"><b><?php echo $today; ?></b></span>  <BR>

            <span class="pull-left"><b>Served By: </b><?php echo get_user($user_id); ?></span>
            <span class="pull-right"><b>Order No: <?php echo $sale_id; ?></b></span><p style="margin: 0px 0px 0px 0px;">.</p> 
             <span class="pull-left"><b> Customer: </b><?php echo get_cust($cust_id); ?></span>  
             <span class="pull-right"><b>Cashier:</b><?php echo get_user($mkt); ?> </span>
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          </div>
          <div id="receipt-body">
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <table class="table table-bordered" id="deSo">
              <thead>
                <tr style="font-size: 12px; font-weight: bold; text-align: center; ">
                  <td>Item</td>
                  <td>Qty</td>
                  <td>price</td>
                  <td>Disc</td>  
                  <td>Total</td>
                </tr>
              </thead>
              <tbody style="text-align: justify;">
                <?php
                $get_orders = "SELECT SUM(qty) AS tqty,item_id,price FROM kp_sale_items  WHERE sale_id='$sale_id'GROUP BY item_id";
                $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");
                while ($s = mysqli_fetch_assoc($get_orders_r)) {
                   $item_id = $s['item_id'];  
                   $disc = $s['disc'];
                   $price = $s['price']; 
                   $qty=$s['tqty'];
                   $total=$qty*$price; 
                   $order_t=$order_t+$total;
                   ?>
                   <tr>
                    <td style="font-size: 11px;"><?php echo get_item($item_id); ?></td>
                    <td><?php echo $qty; ?></td>
                    <td><?php echo $price; ?></td>
                    <td><?php echo $disc; ?></td> 
                    <td><?php echo $total; ?></td>
                  </tr>
                <?php
                 }
                ?> 
            </tbody>
            <tfoot>
              <tr> 
                <td colspan="4" class="text-right">SUB TOTAL</td>
                <td>
                  <?php 
                  echo $order_t;
                  ?>
                </td>
              </tr>
              <tr> 
                <th colspan="4" class="text-right">DELIVERY</th>
                <th>
                  <?php 
                  echo $deli;
                  ?>
                </th>
              </tr>
            <tr> 
                <th colspan="4" class="text-right">TOTAL</th>
                <th>
                  <?php 
                  echo $order_t+$deli;
                  ?>
                </th>
              </tr>
            </tfoot>
          </table>
          <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          <hr>
   
            </div> 
          </div> 
      </div> 
 </div> 