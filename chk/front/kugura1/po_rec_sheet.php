<?php
include("../clude/head.php");  
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 

$action="PRINTED RECEIVING SHEET FOR PURCHASE ORDER NO | ".$po_id;
$url="../../";
logs($action,$url);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");                     
$lpo = mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po_id'") or die(mysqli_error($connection));
$lp = mysqli_fetch_assoc($lpo); 
$sup_id = $lp['sup_id']; 
?>
<style type="text/css">
  .p-order{ 
    padding:1mm;
    margin: 0;
    width:  210mm;
    height: 297mm;
    background: #FFF;
  }
  #footer {
    position:absolute;
    bottom:0;
    width:209mm;
    height:60px;   /* Height of the footer */
    background:#000;
    color: white;
  }
  .imei{
    border-bottom: 1px solid #000;
    margin: 5px; 
  }
 
  @media print {
    .table > thead > tr > th, 
    .table > tbody > tr > th, 
    .table > tfoot > tr > th, 
    .table > thead > tr > td, 
    .table > tbody > tr > td, 
    .table > tfoot > tr > td {
      border: 2px solid #000000; 
    } 
    .p-order{ 
      margin: 0;
      width:  200mm;
      height: 297mm;
      background: #FFF; 
    }
    thead > tr > th >td {
      border:2px solid #000000;
    }
    .content {
      background-color: white !important;
      height: 100% !important;
      width: 100% !important;
      position: fixed !important;
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
 <!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
  ?>
  <!-- end #header -->   
  <!-- begin #content -->
    <div id="contentS" class="contentS" style="margin:5px;">
      <div class="p-order"> 
          <!--  Start panel body  -->
          <div class="panel-body p-order">
            <!-- begin invoice-header-->
            <div class="invoice-company row">
              <div class="col-md-6">    
                <h3 class="title"><?php echo strtoupper($gen['company_name']); ?></h3>
                <h4>PURCHASE ORDER RECEIVING SHEET</h4>
              </div> 
              <div class="invoice-date pull-right col-md-6">
                <div class="invoice-detail">
                  <h4>L.P.O NO: &nbsp; <span class="label label-sm label-success pull-right"><?php echo $po_id;?></span></h4> 
                  <h4>Receiving By: &nbsp; <?php echo get_user($user_id);?></h4> 
                  <h4>Receiving Date: &nbsp; <?php echo $today;?></h4>
                </div>
                </div>
              </div>
              <!-- end invoice-header --> 
              <!-- end invoice-Details-->
              <div class="invoice-content">
                <table class="table table-invoice table-bordered">
                  <thead>
                    <tr>
                      <th>NO</th> 
                      <th>ITEM</th>
                      <th>ORDERED QTY</th> 
                      <th>Received QTY</th>
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
                        $quantity = $data['qty'];  

                        $no=$no+1; 
                    ?>
                    <tr>
                      <td><?php echo $no; ?></td>
                      <td><?php echo strtoupper(get_item($item_id)); ?> </td>
                      <td><?php echo $quantity; ?></td> 
                      <td><?php echo $rec_qty; ?> </td> 
                    </tr>
                    <?php 
                      }
                    }
                    ?> 


                  </tbody> 
              </table><a href="po_view.php" class="btn btn-success btn-sm hidden-print pull-left back" style="margin-top: 10px;">Back</a> &nbsp; 
                <a href="javascript:;" onclick="window.print()" class="btn btn-sm hidden-print btn-success m-b-10 print" style="margin-top: 10px;" ><i class="fa fa-print m-r-5"></i> Print</a>
            </div>  
          </div>
          <!-- END PANEL BODY -->
      </div>  
        </div>
        <!-- END P-ORDER -->
      </div>
      <!-- END CONTENT -->

<?php include('../clude/foot.php') ?>