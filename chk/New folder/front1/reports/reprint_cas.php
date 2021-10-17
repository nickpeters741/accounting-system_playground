<?php
session_start();
  include('../../inc/connection.php'); 
  include('../clude/funcs.php');
$nos=59;
$sale_id = $_GET['sale_id'];

$time=date("h:i:a");


$order_t=0; 

$get_sales = "SELECT * FROM kp_sales  WHERE sale_id='$sale_id'";
$get_sales_r = mysqli_query($connection,$get_sales) or die("Could not fetch the order");
$s = mysqli_fetch_assoc($get_sales_r);
$cust_id=$s['cust_id'];
$user_id=$s['user_id'];
$mkt=$s['mktr'];
$ord_date=$s['day'];
$sale_disc=$s['disc'];
$time=date("h:i:a");

$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");
 
$cust_name= get_cust($cust_id);

$order_t=sale_amount($sale_id);
 
$action="REPRINTED|-|-|-|CASH SALE NO ".$sale_id;
logs($action,"../../");  
  ?>
<script>

function logout(){
  window.location = 'my_orders.php';
}
</script>
<link href="../../assets/css/default/thermal_print.css" rel="stylesheet" />
<style>
p.page { page-break-after: always; }


</style>
 
     <!--  -->
 <body onload="logout();window.print()">

  <div id="receipt">
        <div id="results"></div>
        <div id="bord">
          <div id="receipt-header" class="text-center">
            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>

            <?php if ($row['show_logo']==1 ){ ?>
            <img src="<?php echo $gen['image_path']; ?>" style="height: 100px; margin-left: 20px; margin-top: 0px;" /> 
            <?php } ?>
            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p>  
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
            <p style="margin: 0px 0px 0px 0px;">Email: <?php echo $gen['email']; ?></p> 
            <p style="margin: 0px 0px 0px 0px;">Website: <?php echo $gen['website']; ?></p>         
          
            <p style="margin: 0px 0px 0px 0px;">Mobile: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR></P>
            <p style="margin: 0px 0px 0px 0px;"><i class="fab fa-instagram"></i> &nbsp;Instagram: washiezliqourstore</P>
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
              $get_orders = "SELECT SUM(qty) AS tqty,item_id,price FROM kp_sale_items  WHERE sale_id='$sale_id'GROUP BY item_id";
              $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");
              while ($s = mysqli_fetch_assoc($get_orders_r)) {
                 $item_id = $s['item_id'];  
                 // $disc = $s['disc'];
                 $price = $s['price']; 
                 $qty=$s['tqty'];
                 $total=$qty*$price; 
                 //$order_t=$order_t+$total;
                 ?>
                 <tr>
                  <td style="font-size: 11px;"><?php echo get_item($item_id); ?></td>
                  <td><?php echo $qty; ?></td>
                  <td><?php echo $price; ?></td>
                  <!-- <td><?php echo $disc; ?></td> -->
                  <td><?php echo $total; ?></td>
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
            ?>
              
              <tr>
                <th colspan="3" class="text-center">TOTAL</th>
                <th>
                  <?php 
                  echo $order_t;
                  ?>
                </th>
              </tr>
            </tfoot>
          </table> 
            </div>
            <div id="receipt-footer">
               <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p> <!---->
              <?php 
              if ($row['tax']==1 ){ 
                $amount=$order_t+$deli_total;
                $vat=round((18/118)*$amount,2,PHP_ROUND_HALF_UP); 
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
    </body> 
    <script type="text/javascript">
              document.getElementById("btnPrint").onclick = function () {
    printElement(document.getElementById("receipt"));
    console.logo('test');
}

function printElement(elem) {
    var domClone = elem.cloneNode(true);
    
    var $printSection = document.getElementById("printSection");
    
    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }
    
    $printSection.innerHTML = "";
    $printSection.appendChild(domClone);
    window.print();
}
             </script>