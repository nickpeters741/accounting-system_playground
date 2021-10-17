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
if (isset($_GET['id'])) {
  $sale_id = $_GET['id'];
}else{
  $sale_id = $row['sale_id'];
}

$dash = $row['dash'];
$sum=0;
$sales_1 = mysqli_query($connection,"SELECT * FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
$sales = mysqli_fetch_assoc($sales_1); 
$cust_id = $sales['cust_id'];
$ord_date = $sales['day']; 
$type = $sales['type']; 


$get_cust = mysqli_query($connection , "SELECT * FROM kp_customers WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
$sup = mysqli_fetch_assoc($get_cust);
$bname = $sup['name'];
$mobile=$sup['phone']; 
$email=$sup['email']; 
$address = $sup['address'];
$location = $sup['location']; 

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

$action="PRINTED|-|-|-| SALE NO|".$sale_id;
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
<?php
if (isset($_GET['id'])) {
  ?>
  <script type="text/javascript">
    function close(){
      window.location = location.href = document.referrer;
    } 
  </script>
  <?php
}else{
  ?>
  <script type="text/javascript">
    function close(){
      window.location = '../dash/'+'<?php echo $dash;?>';
    } 
  </script>
  <?php
}
?> 
</head> <!--  -->
<body onload="setTimeout(function () { close(); }, 1000); window.print()">  
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #content -->
    <div id="contents" class="contents">
      <div class="p-order">
        <!-- begin invoice-header--> 
        <div class="inv-header" style="border-top:  2px solid #753f91; ">
          <div style=" border-right: green; width: 50%; float: left;">
            <a href="../dash/admin_dash.php" name="filter"><img src="<?php echo $gen['image_path']; ?>" style="width: 150px; margin-left: 10px; margin-top: 5px;" /> </a>
          </div>
          <div style=" border: green; width: 50%; float: left;">  
            <h2 style=" text-align: left; margin: 0px 0px 0px 0px;"><u><?php if($type==1){ echo "RECEIPT";}else{ echo "INVOICE";} ?></u> </h2>
            <h3 style=" text-align: left; margin: 0px 0px 0px 0px;"><?php echo $gen['company_name']; ?> </h3>
            <address class="m-b-5" style="margin-top: 2px; text-align: left;">
              <?php echo $gen['address']."<br> <b>Mobile. </b>".$gen['phone1']; ?> 
              <?php echo "<b>Tel.</b> ".$gen['phone2']; ?><br/> 
              <?php echo "<b>Email.</b> ".$gen['email']; ?><br/> 
              <?php echo "<b>Website.</b> ".$gen['website']; ?><br/> 
              <?php echo "<b>PIN.</b> ".$gen['kra_pin']; ?>
            </address>
          </div> 
        </div>
        <div class="inv-contact"> 
          <div style=" border: 2px solid #000; width: 50%;padding: 10px; float: left;">
            <strong style="color: #753f91;">Customer:</strong><br>
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
                    <th class="pull-left">Invoice Date: </th>
                    <th class="pull-right"><?php echo $ord_date; ?> </th>
                  </tr>
                <!--   <tr>
                    <th class="pull-left">Due Date: </th>
                    <th class="pull-right"><?php 
                      $next_due_date = date('d-m-Y', strtotime($ord_date. ' +30 days'));
                      echo $next_due_date; ?>
                     
                    </th>
                  </tr> -->
                </thead>
              </table>       
            </div> 
        </div>  
    <!-- end invoice-header -->
    <!-- begin invoice-Details--> 
        <div class="inv-content">
          <table class="table">
            <thead>
              <tr> 
                <th>No</th>
                <th style="text-align: left;">Item Description</th>
                <th style="text-align: right;">Quantity</th>
                <th style="text-align: right;">Unit Price</th>
                <th style="text-align: right;">Discount</th>
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
                  $disc = $data['disc'];
                  $total = $data['total'];
                  $no=$no+1;
                  $sum=$sum+$total;
              ?>
              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo get_item($item_id); ?></td>
                <td style="text-align: right;"><?php echo $quantity; ?></td>
                <td style="text-align: right;"><?php echo number_format($price,2); ?></td>
                <td style="text-align: right;"><?php echo number_format($disc,2); ?></td>
                <td style="text-align: right;"><?php echo number_format($total,2); ?></td> 
              </tr>
                  <?php 
                }
              }
              ?> 
            </tbody>
            <tfoot>
              <tr> 
                <td colspan="4" rowspan="4" class="text-right m-b-5"></td>
                <td  style="text-align: center;" ><strong>Sub Total:</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo number_format($sales['vatable'],2); ?></strong></td>
              </tr>
              <!-- <tr> 
                <td  style="text-align: center;" ><strong>Discount:</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sales['disc']; ?></strong></td> 
              </tr> -->
              <tr> 
                <td  style="text-align: center;" ><strong>V.A.T:</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sales['vat']; ?></strong></td> 
              </tr>
              <!-- <tr> 
                <td colspan="4" class="text-right m-b-5"><h6><strong>VAT(<?php echo $sales['tax_perc'];?>%) KSH:</strong></h6></td>
                <td><h6><strong> <?php echo $sales['vat']; ?></strong></h6></td>
              </tr> -->
               <tr style="font-size: 18px;">  
                <td style="text-align: center;" > <strong>TOTAL</strong> </td>
                <td style="text-align: right;"> 
                  <strong> 
                    Ksh. &nbsp;<?php 
                    $tt=$sales['vatable']+$sales['vat'];
                    echo number_format($tt,2); ?></strong> </td>
              </tr>
            </tfoot>
          </table>
        </div> 
         <div id="inv-footer"> 
                <p class="text-center">
                  THANK YOU FOR YOUR BUSINESS<br/>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i><?php echo $gen['website']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i><?php echo $gen['phone1']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> <?php echo $gen['email']; ?></span>
                </p> 
            </div>
      </div> 
      <p class="break"></p> 
      <div class="p-order">
        <!-- begin invoice-header--> 
        <div class="inv-header" style="border-top:  2px solid #753f91; ">
          <div style=" border-right: green; width: 50%; float: left;">
            <img src="<?php echo $gen['image_path']; ?>" style="width: 100px; margin-left: 10px; margin-top: 5px;" /> 
          </div>
          <div style=" border-right: green; width: 50%; float: left;"> 
            <h2 style=" text-align: right; margin: 0px 0px 0px 0px;"><u>DELIVERY NOTE</u> </h2>
            <h3 style=" text-align: right; margin: 0px 0px 0px 0px;"><?php echo $gen['company_name']; ?> </h3>
            <address class="m-b-5" style="margin-top: 2px; text-align: right;">
              <?php echo $gen['address']."<br> Tel. ".$gen['phone1'].", ".$gen['phone2']; ?>  
            </address>
          </div> 
        </div>
        <div class="inv-contact">
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
                  <th class="pull-left">Delivery No: </th>
                  <th class="pull-right"><?php echo $sale_id; ?> </th>
                </tr>
                <tr>
                  <th class="pull-left">Delivery Date: </th>
                  <th class="pull-right"><?php echo $ord_date; ?> </th>
                </tr> 
              </thead>
            </table>       
          </div> 
        </div>  
    <!-- end invoice-header -->
    <!-- begin invoice-Details--> 
        <div class="inv-content">
          <table class="table">
            <thead>
              <tr> 
                <th>No</th>
                <th style="text-align: left;">Item Description</th>
                <th style="text-align: right;">Quantity</th>  
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
              </tr>
                  <?php 
                }
              }
              ?> 
              <tr></tr>
            </tbody> 
            <tfoot>
              <tr>
                <td colspan="3"> 
                  <p class="text-center"> 
                    <span > DELIVED BY................................................</span>
                    <span> APPROVED BY................................................</span> 
                    <span> RECEIVED BY................................................</span> 
                  </p>
                </td>
              </tr>
            </tfoot>
          </table>
        </div>  
      </div>  
        <!-- END P-ORDER -->
    </div>  
  </div>
  <script type="text/javascript">
        $(document).ready(function () {
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}
});
      </script> 
</body>
</html> 
 