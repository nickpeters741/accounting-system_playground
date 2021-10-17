<?php
session_start(); 
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$url = "../../assets";
if (!isset($_SESSION['user_id'])) {
   header("Location:my_orders.php");
}
$user_id = $_SESSION['user_id'];
$no=0;

$sale_id = $_GET['id']; 
$action="RE-PRINTED|-|-|SALE NUMBER |".$sale_id;
logs($action,"../../");   

$dash = $_SESSION['dash'];
$sum=0;
$no=0;
 $sales_1 = mysqli_query($connection,"SELECT * FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
  $sales = mysqli_fetch_assoc($sales_1); 
    $cust_id = $sales['cust_id'];
    $ord_date = $sales['day']; 

    $get_cust = mysqli_query($connection , "SELECT * FROM kp_customers WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
    $sup = mysqli_fetch_assoc($get_cust);

     $bname = $sup['name'];
     $mobile=$sup['phone']; 
     $email=$sup['email']; 
     $address = $sup['address'];
     $location = $sup['location']; 

    $get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
    $gen = mysqli_fetch_assoc($get_gen_details);

$action="PRINTED|-|-|-| SALE NO ".$sale_id;
logs($action,"../../");

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");
?>
<!DOCTYPE html> 
<html lang="en"> 
<head>
<meta charset="utf-8" />
<title>KPOS</title> 
<link href="<?php echo $url; ?>/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" /> 
<link href="<?php echo $url; ?>/css/default/invoice-print.css" rel="stylesheet" />
<script type="text/javascript">
    function close(){
  window.location = 'my_orders.php';
} 
  </script>
</head>
<!--  -->
<body onload="close(); window.print()">  
 <!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
 
<!-- begin #content -->
<div id="content" class="content"> 
  <div class="p-order">
    <!-- begin invoice-header--> 
      <div style=" border-right: green; width: 50%; float: left;">
        <img src="<?php echo $gen['image_path']; ?>" style="width: 150px; margin-left: 30px; margin-top: 5px;" /> 
      </div>
      <div style=" border-right: green; width: 50%; float: left;">
        <h4 style=" text-align: right;"><u>INVOICE</u> </h4>
        <address class="m-b-5" style="margin-top: 2px; text-align: right;">
          <?php echo $gen['address']."<br> Tel. ".$gen['phone1'].", ".$gen['phone2']; ?>  
        </address>
      </div>  
      <div style="border-bottom:  2px solid #753f91; "></div>
    <!-- end invoice-header -->
    <!-- begin invoice-Details--> 
      <div style=" border-right: green; width: 60%; float: left;">
      <strong style="color: #753f91;">Invoice To:</strong><br>
        <strong class="text-inverse"><?php echo $bname;?></strong><br />
        <?php echo $address; ?><br/> 
        <?php echo $mobile; ?><br/> 
        <?php echo $email; ?> 
      </div>
      <div class="col-md-4" style="background-color: #753f91;width: 30%; float: right;">
       <table class="table">
          <thead style="background-color:#753f91; ">
            <tr>
              <th class="pull-left">Invoice No: </th>
              <th class="pull-right"><?php echo $sale_id; ?> </th>
            </tr>
            <tr>
              <th class="pull-left">Order Date: </th>
              <th class="pull-right"><?php echo $ord_date; ?> </th>
            </tr>
            <tr>
              <th class="pull-left">Due Date: </th>
              <th class="pull-right"><?php 
                $next_due_date = date('d-m-Y', strtotime($ord_date. ' +30 days'));
                echo $next_due_date; ?>
               
              </th>
            </tr>
          </thead>
        </table>  
        <!-- <span style="background: purple; text-align: left;"><h5 style=" color: #fff !important;">Invoice No: <?php echo $po; ?> </h5></span>
        <span style="background-color: #753f91; text-align: left;"><h5 style=" color: #fff !important;">Ord Date:<?php echo $ord_date; ?></h5></span>  
        <span style="background-color: #753f91; text-align: left;"><h5 style=" color: #fff !important;">Due Date:        <?php echo $po; ?></h5></span> -->   
      </div> 
    <!-- end invoice-Details-->
    <hr style="margin: 3px; background: #753f91;"> 
    <table class="table">
                  <thead>
                    <tr> 
                      <th>No</th>
                      <th style="text-align: left;">Item Description</th>
                      <th style="text-align: right;">Quantity</th>
                      <th style="text-align: right;">Unit Price</th>
                      <th style="text-align: right;">Total</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                    $sum=0;  
                    $req_items = mysqli_query($connection ,"SELECT * FROM kp_sale_items WHERE sale_id= '$sale_id'") or die(mysqli_error($connection));
                    if (mysqli_num_rows($req_items) < 1) {
                      echo "There are no items on this order";
                    }else{
                      while ( $data = mysqli_fetch_assoc($req_items)) {
                        $item_id= $data['item_id'];
                        $price = $data['price'];
                        $quantity = $data['qty'];
                        $total = $data['total'];
                        $no=$no+1;
                        $sum=$sum+$total;
                    ?>
                    <tr>
                      <td><?php echo $no; ?></td>
                      <td><?php echo get_item($item_id); ?></td>
                      <td style="text-align: right;"><?php echo $quantity; ?></td>
                      <td style="text-align: right;"><?php echo number_format($price,2); ?></td>
                      <td style="text-align: right;"><?php echo number_format($total,2); ?></td> 
                    </tr>
                        <?php 
                      }
                    }
                    ?> 
                  </tbody>
                  <tfoot>
                    <tr> 
                      <td colspan="3" rowspan="4" class="text-right m-b-5"></td>
                      <td  style="text-align: center;" ><strong>Sub Total:</strong></td>
                      <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo number_format($sum,2); ?></strong></td>
                    </tr>
                    <tr> 
                      <td  style="text-align: center;" ><strong>Discount:</strong></td>
                      <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sales['disc']; ?></strong></td> 
                    </tr>
                  <!--  <tr> 
                      <td  style="text-align: center;" ><strong>V.A.T:</strong></td>
                      <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sales['vat']; ?></strong></td> 
                    </tr>
                     <tr> 
                      <td colspan="4" class="text-right m-b-5"><h6><strong>VAT(<?php echo $sales['tax_perc'];?>%) KSH:</strong></h6></td>
                      <td><h6><strong> <?php echo $sales['vat']; ?></strong></h6></td>
                    </tr> -->
                     <tr style="font-size: 18px;">  
                      <td style="text-align: center;" > <strong>TOTAL</strong> </td>
                      <td style="text-align: right;"> 
                        <strong> 
                          Ksh. &nbsp;<?php 
                          $tt=$sum-$sales['disc'];
                          echo number_format($tt,2); ?></strong> </td>
                    </tr>
                  </tfoot>
              </table> 
            <div>
             
            </div>
            <div class="terms" style=" max-width: 100%;"> 
              <ul>
                <li>Prepared By <?php echo $_SESSION['username']; ?></li> 
              </ul>  
              <b><u style="font-size: 16px;">Terms</u></b>
              <!-- 
               -->
            </div>
            <div id="footer"> 
                <p class="text-center">
                  THANK YOU FOR YOUR BUSINESS<br/>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i><?php echo $gen['website']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i><?php echo $gen['phone1']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> <?php echo $gen['email']; ?></span>
                </p> 
            </div>
          </div>
          <!-- END PANEL BODY -->
      </div>  
        <!-- END P-ORDER -->
      </div>
      <!-- END CONTENT -->

   <!-- ================== BEGIN BASE JS ================== -->
 