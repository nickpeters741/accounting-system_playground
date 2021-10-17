<?php
session_start(); 
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$url = "../../assets";
if (!isset($_SESSION['user_id'])) {
   header("Location:../log_out.php");
}
$folder="front/print/"; 
thesion_page($folder);
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$dash = $row['dash'];

$sum=0;

$sales_1 = mysqli_query($connection,"SELECT * FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
$sales = mysqli_fetch_assoc($sales_1); 
$cust_id = $sales['cust_id'];
$ord_date = $sales['day'];   
$cust_id = $sales['cust_id']; 
$sale_type = $sales['sale_type'];
$mkt = $sales['mkt'];
$dash = $sales['dashboard'];

$logi = mysqli_query($connection,"SELECT * FROM kp_logistics WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
$log = mysqli_fetch_assoc($logi); 
$beba_id = $log['beba_id'];
$means = $log['means'];   
$reg = $log['reg'];

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

//$order_t=sale_amount($sale_id); 

sale_req($sale_id);

//$req_id = $_SESSION['req_id'];
$nos=53;

$action="PRINTED|-|-|-|CASH SALE NO ".$sale_id;
logs($action,"../../"); 


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
<?php
  $get_deli = mysqli_query($connection,"SELECT * FROM kp_logistics WHERE sale_id='$sale_id'");
  $deli = mysqli_fetch_assoc($get_deli);
  $deli_total = $deli['amount'];

  $get_disc = mysqli_query($connection,"SELECT * FROM kp_sales WHERE sale_id='$sale_id'");
  $dis = mysqli_fetch_assoc($get_disc);
  $sale_disc = $dis['disc'];
?>
 <!-- onload="logout();window.print()" -->
 <body>

  <div id="receipt">
        <div id="results"></div>
        <div id="bord">
          <div id="receipt-header" class="text-center">
            <?php if ($row['show_logo']==1 ){ ?>
            <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>
            <?php } ?>
            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>
            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p>  
            <p style="margin: 0px 0px 0px 0px;">Email: <?php echo $gen['email']; ?></p> 
            <p style="margin: 0px 0px 0px 0px;">Website: <?php echo $gen['website']; ?></p>         
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <p style="margin: 0px 0px 0px 0px; "><?php echo $gen['address']; ?>,<BR> Cell: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR></P>
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <?php if ($row['pin']==1 ){ ?>
             <span class="pull-left">PIN: <?php echo $gen['kra_pin']; ?></span><BR>
           <?php }?>  

            <span class="pull-left"><b>Served By: </b><?php echo get_user($user_id); ?></span>
            <span class="pull-right"><b>Order No: <?php echo $sale_id; ?></b></span><p style="margin: 0px 0px 0px 0px;">.</p> 
             <span class="pull-left"><b> Customer: </b><?php echo get_cust($cust_id); ?></span>  
            <span class="pull-right"><b><?php echo $today; ?></b></span>
           <!--   <span class="pull-right"><b>Cashier:</b><?php echo get_user($mkt); ?> </span> -->
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          </div>
          <div id="receipt-body">
             <table class="table table-bordered" id="deSo">
            <thead>
              <tr style="font-size: 12px; font-weight: bold; text-align: center; ">
                <td>Item</td>
                <td>Qty</td>
                <td>price</td>
               <!--  <td>Disc</td> -->
                <td>Total</td>
              </tr>
            </thead>
            <tbody style="text-align: justify;">
              <?php
              $get_orders = "SELECT SUM(qty) AS tqty,item_id,price FROM kp_sale_items  WHERE sale_id='$sale_id' GROUP BY item_id";
              $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders" );
              while ($s = mysqli_fetch_assoc($get_orders_r)) {
                 $item_id = $s['item_id'];  
                 // $disc = $s['disc'];
                 $price = $s['price']; 
                 $qty=$s['tqty'];
                 $total=$qty*$price; 
                 $order_t=$order_t+$total;
                 ?>
                 <tr>
                  <td style="font-size: 11px;"><?php echo get_item($item_id); ?></td>
                  <td><?php echo $qty; ?></td>
                  <td><?php echo $price; ?></td>
                  <!-- <td><?php echo $disc; ?></td> -->
                  <td><?php echo number_format($total,2); ?></td>
                </tr>
              <?php
               }
              ?>
            </tbody>
            <tfoot>
                <?php 
              if ($sale_disc==0) {
                  # code...
                }else{
              ?> 
              <tr>
                <th colspan="3">Sale Discount</th>
                <th><?php echo number_format($sale_disc,2); ?></th>
              </tr>
            <?php } 
 
              if ($deli_total>0 ){  
            ?>
            <tr>
                <th colspan="3">SUB TOTAL</th>
                <th><?php echo number_format($order_t,2); ?></th>
              </tr> 
               <tr>
                <th colspan="3">DELIVERY</th>
                <th><?php echo number_format($deli_total,2); ?></th>
              </tr> 
                <?php } ?> 
              <tr>
                <th colspan="3" class="text-center">TOTAL</th>
                <th>
                  <?php 
                  echo number_format($order_t+$deli_total,2);
                  ?>
                </th>
              </tr>
            </tfoot>
          </table>
          <hr>
  <?php
            if (empty($deli_total)) { 
            }else{
              ?>
              <table class="table table-bordered">
                <tbody>
            <tr>
              <td colspan="2" style="font-size: 14px;"><b>Delivery By</b></td>
              <td colspan="2" style="font-size: 14px;"><b>Means</b></td>
              <td style="font-size: 14px;"><b>Registration</b></td>
              <td style="font-size: 14px;"><b>Amount</b></td>
            </tr>
            <tr>
              <td colspan="2"><?php echo get_beba($beba_id) ?></td>
              <td colspan="2"><?php echo get_means($means) ?></td>
              <td><?php echo $reg ?></td>
              <td><?php echo $deli_total ?></td>
            </tr>
            </tbody>
              </table>
            <?php
            }
            ?>
            </div>
            <div id="receipt-footer">
               <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p> <!---->
              <?php 
              if ($row['tax']==1 ){ 
                $amount=$order_t+$deli_total;
                $vat=round((16/116)*$amount,2,PHP_ROUND_HALF_UP); 
                $vatable=$amount-$vat;
              ?>
               <span class="pull-left">Gross:<?php echo number_format($vatable,2); ?></span> 
              <span class="pull-right">V.A.T(16%): <?php  echo number_format($vat,2); ?></span><br>
               <!-- -->
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
             <?php } ?>
              <p class="text-center" style="margin: 0px 0px 0px 0px;"><b>THANK YOU</b></p>
              <p class="text-center" style="margin: 0px 0px 0px 0px;"><?php echo $row['thankyou_note'];?></p>
              <p class="text-center" style="margin: 0px 0px 0px 0px;"> This is not an ETR. Request one</p>
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
              <h2 class="text-center" style="margin: 0px 0px 0px 0px;font-size: 20px;font-weight: bold; font-family: 'Helvetica LT W01 Black Cond';letter-spacing: 3px;"><?php if ($row['mpesa']==2 ){ echo "PAYBILL". " ".$gen['mpesa_no']. " ACCOUNT:". $gen['mpesa_account']; } else{echo "TILL". " ".$gen['mpesa_no']; }?> </h2>
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
              <p class="text-center" style="margin: 0px 0px 0px 0px; font-size: 11px;"> K-POS Designed & Distributed by K-SYSTEMS </BR> +254716100335 | +254735100335 .</p> 
            </div> 
          </div>
        </div>
      </div>
<p class="break"></p>
      <div id="receipt">
        <div id="results"></div>
        <div id="bord">
          <div id="receipt-header" class="text-center"> 
            <h1 class="title">STORE REQUISITION(SALE)</h1>         
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p> 
            <span class="pull-left" style="margin: 0px 0px 0px 0px;"><b>Sale ID: <?php echo $sale_id; ?></b></span>
           <!--  <span class="pull-right"><b>Req id: <?php echo $req_id; ?></b></span> --><br>
            <span class="pull-left"> Sale By: </strong><?php echo get_user($user_id);; ?></span>
            <span class="pull-right"><b><?php echo $today; ?></b></span> 
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          </div>
          <div id="receipt-body">
            <table> 
              <thead>
                <tr>
                  <th>#</th>
                  <th>ITEM NAME</th>
                  <th>QTY</th> 
                </tr>
              </thead>
                <tbody>
                  <?php
                  $no=0;
              $get_orders = "SELECT qty,item_id FROM kp_sale_items  WHERE sale_id='$sale_id'GROUP BY item_id";
              $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");
              while ($s = mysqli_fetch_assoc($get_orders_r)) {
                $item_id = $s['item_id'];    
                $qty=$s['qty']; 
                $no=$no+1; 
                          
                 ?>
                 <tr>
                  <td><?php echo $no; ?></td>
                  <td style="font-size: 11px;"><?php echo get_item($item_id); ?></td>
                  <td style="width: 30px;"><?php echo $qty; ?></td>  
                </tr>
              <?php
               }
              ?>
             <!--  <tfoot>
                <tr>
                  <td colspan="3"><h2>TOTAL:<?php 
                  echo $order_t+$deli_total;
                  ?></h2></td>
                </tr>
              </tfoot> -->
                </tbody>
              </table>
            </div>
            <!-- <div id="receipt-footer">
              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>
             -->
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p> 
           <!--  </div>  -->
          </div>
        </div>
      </div> 
    </body>
    </html>
