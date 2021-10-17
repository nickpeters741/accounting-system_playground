<?php
session_start();
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');  
if ($_SESSION['panel']==1) {
  header("Location:../log_out.php");
}
$user_id = $_SESSION['user_id'];
$user_id = $_SESSION['user_id'];
if (isset($_GET['id'])) {
    $po_id=$_GET['id'];
}else{
    $get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
    $row=mysqli_fetch_assoc($get_details);
    $po_id = $row['po_id'];  
}
$no=0;
$folder="back/kugura";
$page= $folder.basename($_SERVER['PHP_SELF']);  
$create_thesion= mysqli_query($connection,"UPDATE kp_thesion SET current_page='$page',datime=CURRENT_TIMESTAMP WHERE user_id='$user_id'") or die(mysqli_error($connection));
// $action="LOADED PURCHASE ORDER PAGE FOR | ".$po_id;
// $url="../../";
// logs($action,$url);
?>


<?php 
$user_id = $_SESSION['user_id'];
$no=0;
$po = $_GET['id']; 
                      
$sales_1 = mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po_id'") or die(mysqli_error($connection));
$sales = mysqli_fetch_assoc($sales_1); 
$sup_id = $sales['sup_id'];
$ord_date = $sales['ord_date']; 
$amount = $sales['amount'];
$disc = $sales['disc'];
$ord_date = $sales['ord_date'];
$vat = $sales['vat'];
$vatable = $sales['vatable'];
$tax_perc = $sales['tax_perc'];

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);
$get_supplier = mysqli_query($connection , "SELECT * FROM kp_suppliers WHERE sup_id='$sup_id'") or die(mysqli_error($connection));
$sup = mysqli_fetch_assoc($get_supplier);
$bname = $sup['sup_name'];
$mobile=$sup['sup_phone']; 
$address = $sup['sup_address'];
$location = $sup['sup_location']; 
?><!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <title>KPOS</title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- ================== BEGIN BASE CSS STYLE ================== --> 
  <link href="../../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
  <link href="../../assets/plugins/bootstrap/4.0.0/css/bootstrap.css" rel="stylesheet" />
  <link href="../../assets/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" /> 
  <link href="../../assets/css/default/style.css" rel="stylesheet" />  
  <link href="../../assets/css/default/invoice-print.css" rel="stylesheet" /> 
  <!-- ================== END BASE CSS STYLE ================== -->
</head> 
 <!-- begin #page-container -->
<div id="page-container" >
  <!-- begin #content -->
    <div id="contents" class="contents" style="width: 210mm;height: 290mm; background-color: #fff;">
      <div class="p-order"> 
          <!--  Start panel body  -->
          <div class="panel-body p-order">
            <!-- begin invoice-header-->
            <div class="invoice-company row">
              <div class="col-md-6"><img src="<?php echo $gen['image_path']; ?>" style="height: 90px;"></div>
              <div class="invoice-date pull-right col-md-6">
                <h4>Purchase Order </h4>
                <div class="date text-inverse m-t-5"><?php echo $ord_date;?></div>
                <div class="invoice-detail">
                  <h4>P.O #: &nbsp; <span class="label label-sm label-success"><?php echo $po_id;?></span></h4>
                  </div>
                </div>
              </div>
              <!-- end invoice-header -->

              <!-- begin invoice-Details-->
              <div class="invoice-header">
                <div class="invoice-from">
                  <small>FROM</small>
                  <address class="m-t-5 m-b-5">
                    <strong class="text-inverse"><?php echo strtoupper($gen['company_name']); ?>.</strong><br />
                    <?php echo $gen['address']; ?><br/>
                    Nairobi.<br/>
                    Phone: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><br/>
                    Email : <?php echo $gen['email']; ?> 
                  </address>
                </div>
                <div class="invoice-to">
                  <small>TO</small>
                  <address class="m-t-5 m-b-5">
                    <strong class="text-inverse"><?php echo $bname;?></strong><br />
                    <?php echo $address;?><br/> <br/> 
                    Phone: <?php echo $mobile;?><br/> 
                  </address>
                </div>
              </div>
              <!-- end invoice-Details-->
              <div class="invoice-content">
                <table class="table table-invoice table-bordered">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Details</th>
                      <th>Quantity</th>
                      <th>Unit Price</th>
                      <th>Total</th> 
                    </tr>
                  </thead>
                  <tbody>
                    <?php   
                    $req_items = mysqli_query($connection ,"SELECT * FROM kp_po_items WHERE po_id= '$po_id'") or die(mysqli_error($connection));
                    if (mysqli_num_rows($req_items) < 1) {
                      echo "There are no items on this order";
                    }else{
                      while ( $data = mysqli_fetch_assoc($req_items)) {
                        $item_id= $data['item_id'];
                        $price = $data['price'];
                        $quantity = $data['qty'];
                        $total = $data['total'];
                        $no=$no+1;
                    ?>
                    <tr>
                      <td><?php echo $no; ?></td>
                      <td><?php echo get_item($item_id); ?></td>
                      <td><?php echo $quantity; ?></td>
                      <td><?php echo $price; ?></td>
                      <td><?php echo number_format($total); ?></td> 
                    </tr>
                        <?php 
                      }
                    }
                    ?> 
                  </tbody>
                  <thead>
                    <tr>
                      <th colspan="4" class="text-right"><strong>SUBTOTAL KSH:</strong></th>
                      <th><strong> <?php echo number_format($amount+$disc); ?></strong></th>
                    </tr>
                    <tr>
                      <th colspan="4" class="text-right"><strong>DISC KSH:</strong></th>
                      <th><strong> <?php echo number_format($disc); ?></strong></th>
                    </tr>
                    <tr>
                      <th colspan="4" class="text-right"><strong>VATABLE KSH:</strong></th>
                      <th><strong> <?php echo number_format($vatable); ?></strong></th>
                    </tr>
                    <tr>
                      <th colspan="4" class="text-right"><strong>VAT(<?PHP echo $tax_perc."%"; ?>) KSH:</strong></th>
                      <th><strong> <?php echo number_format($vat); ?></strong></th>
                    </tr>
                    <tr>
                      <th colspan="4" class="text-right"><strong>TOTAL KSH:</strong></th>
                      <th><strong> <?php echo number_format($amount); ?></strong></th>
                    </tr>
                  </thead>
              </table>
            </div>
            <div class="panel-body">
              * Prepared By <?php echo get_user($user_id); ?><br><br>
              * Approved By ......................................<br>
              <a href="po_pending.php" class="btn btn-success btn-sm hidden-print pull-left back" style="margin-top: 10px;">Back</a> &nbsp; 
              <a href="javascript:;" onclick="window.print()" class="btn btn-sm hidden-print btn-success m-b-10 print" style="margin-top: 10px;" ><i class="fa fa-print m-r-5"></i> Print</a>
            </div>
            <div id="footer">
              <div class="panel-body">
                <p class="text-center">
                  THANK YOU FOR YOUR BUSINESS<br/>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i><?php echo $gen['website']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i> <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> <?php echo $gen['email']; ?></span>
                </p>
              </div>
            </div>
          </div>
          <!-- END PANEL BODY -->
      </div>  
        </div>
        <!-- END P-ORDER -->
      </div>
      <!-- END CONTENT -->

   <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script> 
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== --> 

  
 <script>
  $(document).ready(function() {
    App.init();
    });
  </script>