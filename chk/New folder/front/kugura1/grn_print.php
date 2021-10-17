<?php

session_start();

include('../../inc/connection.php');

include('../../inc/gen_funcs.php'); 

$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id']; 

$no=0;

 

$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");

$row = mysqli_fetch_assoc($get_thermal_details);



$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");

$gen = mysqli_fetch_assoc($get_gen_details);



$get_details = mysqli_query($connection,"SELECT * FROM kp_grn WHERE po_id='$po_id'") or die("Could not get the user permissions");

$row=mysqli_fetch_assoc($get_details);

$grn_id = $row['grn_id']; 



date_default_timezone_set("Africa/Nairobi");

$today=date("Y-m-d");

?>



<!DOCTYPE html>

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
  <link href="../../assets/plugins/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../../assets/plugins/font-awesome/5.11.2/css/fontawesome.min.css" rel="stylesheet" />
  <link href="../../assets/plugins/animate/animate.min.css" rel="stylesheet" />
  <link href="../../assets/css/default/style.css" rel="stylesheet" />
  <link href="../../assets/css/default/style-responsive.min.css" rel="stylesheet" />
  <link href="../../assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
  <!-- ================== END BASE CSS STYLE ================== -->

  

<style type="text/css">

  .footer {

    position:fixed;

    text-align: center; 

    bottom:5px;

    width: 210mm; 

    height:80px;

    border-top: 2px solid #753f91; 

    color: #753f91;

  }

      .p-order{ 

        padding:1mm;

        margin: 0;

        width:  209mm;

        height: 295mm;

        background: #FFF;

      }

   .gate-footer {

    position:fixed;   

    left: 0;

    bottom:50px;

    width: auto; 

    border-top: 2px solid #753f91; 

    color: #753f91;

    display: none;

  }

  table {

    border-collapse: collapse;

    width: 95% !important;

  }

  table, tr, th, td {

    border:1.5px solid #000;

  }

  body{

    width:210mm;

  }

 

@media print {

  body{

    width:210mm;

  }

  .gate-footer {

    position:fixed;   

    left: 0;

    bottom:50px;

    width: 99%; 

    border-top: 2px solid #753f91; 

    color: #753f91;display: block;

  }

  table {

    border-collapse: collapse;

    width: 95% !important;

  }

  table, tr, th, td {

    border:2px solid #000;

  }

  .p-order{ 

    margin: 1mm;

    width:  210mm;

    height: 100%;

    background: #FFF; 

  } 

  .content {

    background-color: white !important;

    height: 98% !important;

    width: 97% !important; 

    top: 0 !important;

    left: 0 !important;

    margin: 0 !important;

  }

  .hidden-print {

    display: none !important;

  }

  body,

  .content,

  .page-header-fixed {

    padding: 0 !important;

    margin: 0 !important;

  }

  .sidebar,

  .header,

  .theme-panel {

    display: none !important;

  }

} 

</style>

</head> 

<!-- -->

<body>

  <a href="grn_list.php" class="btn btn-lime btn-xs" >BACK</a> 

  <button class="btn btn-lime btn-xs" id="printButton" onclick="printDiv('p-order')"><i class="fa fa-print"></i> Print</button>

  <div class="p-order" id="p-order"> 

    <!-- begin invoice-header-->

    <div class="print-head row">

      <div class="col-md-7" style=" border-right: 3px solid green;"> 

        <img src="<?php echo $gen['image_path']; ?>" style="width: 150px; margin-left: 10px; margin-top: 5px;" /> 

      </div>

      <div class="col-md-5">

        <h4><u>GOODS RECEIVED NOTE</u> </h4>

        <h5>NO: <b style="color: red;"><?php echo $grn_id; ?></b></h5>

        <address class="m-b-5" style="font-size: 12px; margin-top: 5px;">

           <?php echo $gen['address']."<br> Tel. ".$gen['phone1'].", ".$gen['phone2']; ?>

        </address>

        <div class="date">Date: <u><?php echo date('Y-m-d H:i:s');?></u></div>

      </div> 

    </div>

    <!-- end invoice-header --> 

    <!-- end invoice-Details-->

    <div class="print-body" style="margin-top: 10px;">

      <table class="table table-invoice">

        <thead>

          <tr>

            <th>No:</th>

            <th>Item Name</th> 

            <th>Quantity</th> 

          </tr>

        </thead>

        <tbody>

        <?php   

          $get_orders = "SELECT * FROM kp_grn_items WHERE grn_id='$grn_id' ";

          $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");

            while ($s = mysqli_fetch_assoc($get_orders_r)) {

             $no=$no+1;

             $item_id = $s['item_id'];

             $qty = $s['qty'];  

        ?>

          <tr>

            <td><?php echo $no; ?></td>

            <td><?php echo get_item($item_id); ?></td> 

            <td><?php echo $qty; ?></td> 

          </tr>

        <?php

         }

        ?>

        </tbody> 

      </table>

    </div>

    <div class="gate-footer" style="width:100%;"> 

      <p class="text-center"> 

        <span class="m-r-10"> PRINTED...........................................................</span>

        <span class="m-r-10"> CASHIER...........................................................</span>

        <span class="m-r-10"> SUPERVISOR.......................................................</span></BR></BR>

        <span class="m-r-10"> REMARKS............................................................................................</span>

      </p>

    </div>

  </div>

  <?php 
    require("../clude/foot.php");
    ?>

  <script>

    $(document).ready(function() {

      App.init();

    });

  </script>



  <script type="text/javascript"> 

  function printDiv(divName){

    var printContents = document.getElementById(divName).innerHTML;

    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;

  }

</script>

</body>

</html>

