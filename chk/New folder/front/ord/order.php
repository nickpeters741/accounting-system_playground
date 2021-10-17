<?php  
session_start();
include('../../inc/connection.php');
require_once('../clude/funcs.php'); 
$user_id = $_SESSION['user_id'];
page_restrict();
$folder="front/ord/"; 
thesion_page($folder);
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type'];
$mkt = $row['mkt'];
$sale_id = $row['sale_id'];
$cust_id = $row['cust_id'];
$day = $row['day']; 
$panel= $row['panel']; 
if ($panel==1) {
 header("Location:../../log_out.php");
}elseif ($sale_id==0) {
  ?>
 <script> 
  window.location = "../dash/";
 </script>
  <?php
}elseif ($mkt==0) {
  ?>
 <script> 
    //document.getElementById("salesperson").click();  
 </script>
  <?php
}
?> 
<!DOCTYPE html> 
<html lang="en"> 
<head>

  <meta charset="utf-8" />
  <title>ORDER PAGE</title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" /> 
   <!-- ================== BEGIN BASE CSS STYLE ================== --> 
  <link href="../../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
  <link href="../../assets/plugins/bootstrap/4.0.0/css/bootstrap.css" rel="stylesheet" />
  <link href="../../assets/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" /> 
  <link href="../../assets/css/default/style.css" rel="stylesheet" />
  <link href="../../assets/css/default/style-responsive.css" rel="stylesheet" /> 
  <!-- ================== END BASE CSS STYLE ================== -->  
  <!-- ================== BEGIN DATATABLE================== --> 
  <link href="../../assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
  <!-- ================== END DATATABLE ================== --> 
  <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
  <link href="../../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
  <!-- ================== END PAGE LEVEL STYLE ================== -->
  <style>
    .footer {
      position: fixed;
      margin-left:  0;
      bottom: 0;
      width: 100%;
      background-color: purple;
      color: white;
      text-align: center;
    }
  </style>
</head>

<body style="background-image: url('../../assets/img/bg/b5.jpg'); background-size: cover; ">
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-without-sidebar page-header-fixed">
    <!-- begin #header -->
    <div id="header" class="header navbar-default">
      <!-- begin navbar-header -->
      <div class="navbar-header">
        <a href="../dash/index.php" class="navbar-brand"><img src="../../assets/img/logo/kpos.png" style="width: 120px; height:auto;"> </a>
      </div>
      <!-- end navbar-header -->
      <div class="navbar-header">
        <img src="<?php echo $_SESSION['cust_logo']; ?>" style="margin-left: 400px; width: auto; height: 50px;">
      </div>
      <!-- begin header-nav -->
      <ul class="navbar-nav navbar-right">
        <li class="dropdown navbar-user">
          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
            <img src="#" alt=""/><span class="d-none d-md-inline"><?php echo get_user($user_id); ?> </span></a>
          </li>
      </ul>
      <!-- end header navigation right -->
    </div>
    <!-- end #header -->
<!-- begin #content -->
<div id="content" class="content"> 
  <!-- begin row -->
  <div class="row" style="align-items: flex-start;">
  <div class="panel  paper-cut"  style="margin-left: 8px; width: 60%;" >
    <div class="row" style="padding-top: 5px;">
      <div class="col-lg-12" id="results"></div> 
      <div class="form-group  col-md-5 col-xs-4">
        <div class="input-group input-group-xs">
          <div class="input-group-prepend">
            <a  class="btn btn-warning" data-toggle="modal"data-target="#modal" id="quick_item"><i class='fa fa-lg fa-plus' ></i></a>   
          </div> 
          <input type="text" class="form-control form-control-xs" name="bar" onfocus="this.value=''" id="bar" autofocus />
          <input type="hidden" class="form-control" name="item_id" id="item_id"/> 
        </div>
      </div>
      <div class="col-md-2 col-xs-2">
        <input id="qty" type="" placeholder="Qty"  class="form-control form-control-xs" value="1">
      </div>
      <!-- <div class="col-md-2"> 
        <select type="text" class="selectpicker form-control form-control-xs" id="uom_id" name="uom_id">  
        </select>
      </div> -->
      <div class="col-md-2 col-xs-2">
        <input id="price" placeholder="price"  class="form-control form-control-xs"> 
      </div> 
      <div class="col-md-1 col-xs-1">
        <a onclick="SubmitForm();"  class="btn btn-xs btn-purple" ><i class="fa fa-plus"></i>ADD</a>
      </div>
    </div> 
    <div class="table-responsive" id="d1"> </div> 
  </div>
  <div class="panel  paper-cut"   style="margin-left: 10px; width: 38%;" >
    <div class="row" style="margin: 2px; padding: 1px 1px;"> 
      <div class="col-md-2 text-center" style="height: 40px; padding: 1px; border-right: 1px solid #80008036">
        <div class="col-md-12">
          <a  data-toggle="modal"data-target="#modal" id="hold" class="btn btn-xs btn-warning"><h6>HOLD</h6></a>
        </div>
      </div>
      <div class="col-md-2 text-center" style="height: 40px; padding: 1px; border-right: 1px solid #80008036">
        <h6>SALE ID :<br><?php echo $sale_id; ?></h6> 
      </div>
      <div class="col-md-3 text-center" style="height: 40px; padding: 1px; border-right: 1px solid #80008036">
        <a  data-toggle="modal"data-target="#modal" id="cust-change" onclick="$('#load').html('');"> <h6>CUSTOMER:<br> <b id="custo"><?php echo get_cust($cust_id); ?></b></h6> </a>
      </div> 
      <div class="col-md-3 text-center" style="height: 40px; padding: 1px; border-right: 1px solid #80008036">
        <a  data-toggle="modal"data-target="#modal" id="salesperson"  onclick="$('#load').html('');"> <h6 id="salesper"><b>SALES PERSON:<br> <?php echo get_user($mkt); ?></b></h6> </a>
      </div> 
      <div class="col-md-2 text-center" style="height: 40px; padding: 1px;">
        <a  data-toggle="modal"data-target="#modal" id="sale-day" onclick="$('#load').html('');">
          <h5 id="sale-day"><b><?php echo $day; ?></b></h5>
        </a>
      </div> 
    </div>
    <div class="row" id="d33"  style="margin: 2px; padding: 5px; color: white;"></div>
    <!-- begin panel -->
    <div class="panel-body" >
      <input type="hidden" class="form-control" name="disc" id="disc" value="0.00" />
      <div class="amount-block row">

          <div class="col-md-12" id="div-tax" >
          <ul class="list-group">
            <li class="list-group-item global-discount-group" style="height: auuto;"> 
              <div class="row">
                <label class=" col-md-12" style="color: #6FD64B; font-size: 18px;">ADD TAX:</label> 
                <div class="radio col-md-4">
                  <label><input type="radio" name="tax" value="0">NO VAT</label>
                </div>
                <div class="radio col-md-4">
                  <label><input type="radio" name="tax" value="1">Inclusive</label>
                </div>
                <div class="radio col-md-4">
                  <label><input type="radio" name="tax" value="2">Exclusive</label>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="total amount col-md-6">
          <div class="amount total-amount pull-left" ><b>TOTAL: </b></div>
          <div class="amount total-amount" id="loadtt" data-currency="KSHS." data-decimals="2">
            <B>Kshs.</B> <b id="samount"> <?php echo grand_total($sale_id); ?></b>
          </div> 
        </div> 
        <div class="total amount col-md-6"> 
          <div class="amount total-amount"  >
            <a  data-toggle="modal"data-target="#modal" id="sale-type">
              <B>TYPE: <?php if($sale_type==1){ echo "RECEIPT";}elseif($sale_type==2){ echo "INVOICE";} else{  } ?></B>
            </a>
          </div> 
        </div>
        <div class="col-md-12 m-t-5">
          <ul class="list-group">
            <li class="list-group-item global-discount-group"> 
              <div class="pull-left" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>VATABLE:</b>&nbsp;<b id="vatable"></b></div>
              <div class="pull-right" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>VAT:</b>&nbsp;<b id="vatt">0</b></div> 
            </li>
            <li class="list-group-item global-discount-group"> 
              <div class="pull-left" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>TOTAL:</b>&nbsp;<b id="tt"></b></div> 
            </li>
          </ul> 
        </div> 
      </div>
      <hr>
      <div class="row" style="margin: 5px 5px; border: 1px solid #d9e0e7; padding: 5px;">
        <div class="form-check col-md-4 ">
          <input type="checkbox" name="beba" id="beba" value="0" onclick="beba_check();">
          <label class="form-check-label" for="inline_form_checkbox">Delivery</label>
        </div>
        <div class="form-group  col-md-8" style="display:none;" id="beb">
          <div class="input-group input-group-xs">
            <div class="input-group-prepend">
              <a data-toggle="modal" class="btn btn-warning btn-xs" data-target="#modal" id="beba_staff" onclick="$('#load').html('');"><i class='fa fa-lg fa-plus' ></i></a> 
            </div>
            <select class="selectpicker form-control" id="beba_sta" name="beba_sta" style="width: 70%;"  onchange="beba_select();">  </select> 
          </div>
        </div>
        <div class="row col-md-12" style="display:none; margin: 0 1px;" id="beba_row" >
          <div class="form-group col-md-4" id="means_div" style="display:none;">
            <label>Means</label><br>
            <select type="text" class="selectpicker form-control" onchange="means();" id="means" name="mkt" data-size="10" data-live-search="true" style="width: 100%;"> 
              <option value="0" selected="selected">--SELECT MEANS--</option>
              <option value="1">By Hand</option>
              <option value="2">Trolley</option>
              <option value="3">MotorBike</option>
              <option value="4">Vihecle</option>
            </select>
          </div>
          <div class="form-group col-md-4" id="reg_div" style="display:none;">
            <label>Reg No.</label>
            <input type="text" id="reg" class="form-control" onkeyup="reg_check();" name="reg" value=" ">
          </div>
          <div class="form-group col-md-4" id="amount_div"  style="display:none;">
            <label>Amount</label>
            <input type="text" id="deli" class="form-control" onkeyup="amount_check();" name="deli" value="0">
          </div>
        </div>
      </div>
      <div class="panel-body" style="margin-top: 10px;">
        <a data-toggle="modal" data-target="#modal" id="<?php if ($sale_type==1) { echo "cash_btn"; }elseif ($sale_type==2) {
          echo "credit-btn"; }  ?>" class="btn  btn-xs btn-purple"  onclick="$('#load').html('');"> <?php if ($sale_type==1) {
          echo "TAKE PAYMENT";
          }elseif ($sale_type==2) {
            echo "COMPLETE ORDER";
          }  ?>
        </a> 
        <a data-toggle="modal" data-target="#modal" id="cancel_btn" class="btn btn-danger pull-right btn-xs"  onclick="$('#load').html('');">CANCEL</a>
      </div> 
    </div>  
  </div>
</div>
</div>
<!-- end row -->
</div>
<!-- end #content -->

<div class="footer">
  <div class="row" style="margin: 2px; padding: 1px 1px;"> 
    <div class="col-md-1 text-center" style="height: 30px; padding: 1px; border-right: 1px solid #eee;">
      <a class=""><b>F2 -  LOOKUP</b></a>
    </div>
    <div class="col-md-1 text-center" style="height: 30px; padding: 1px; border-right: 1px solid #eee;">
      <a class=""><b>INSERT -  CHECK OUT</b></a>
    </div>
    <div class="col-md-1 text-center" style="height: 30px; padding: 1px; border-right: 1px solid #eee;">
      <a class=""><b>ESC-HOLD SALE</b></a>
    </div> 
    <div class="col-md-1 text-center" style="height: 30px; padding: 1px; border-right: 1px solid #eee;">
      <a class=""><b>DELETE -  CANCEL SALE</b></a>
    </div> 
    <div class="col-md-1 text-center" style="height: 30px; padding: 1px; border-right: 1px solid #eee;"> </div> 
  </div>
</div>

    <!-- end #sidebar -->
<div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load" style="padding: 10px;"> </div>
</div>
<div  id="modal2" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load2" style="padding: 10px;"> </div>
</div>
 <!-- end page container --> 
<?php include("../clude/foot.php") ?>
<script src="../scripts/gen.js"></script>
<script src="order.js"></script>
</body>
</html>  
 