<?php 
require("../clude/head.php"); 
$sum=0;
 $folder="back/reports/";
  thesion_page($folder);
?>
<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
  <link href="../../assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
  <link href="../../assets/plugins/DataTables/extensions/Scroller/css/scroller.bootstrap.min.css" rel="stylesheet" />
  <link href="../../assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
  <!-- ================== END PAGE LEVEL STYLE ================== -->

  <!-- ================== BEGIN PAGE LEVEL STYLE ================== --> 
  <link href="../../assets/plugins/DataTables/extensions/Buttons/css/buttons.bootstrap.min.css" rel="stylesheet" /> 
  <!-- ================== END PAGE LEVEL STYLE ================== -->
<style type="text/css">
	.table thead th,.table>thead>tr>th>td {
    color:#242a30;
    font-weight:600;
    border-bottom:1px solid #000 !important;
    border-right:1px solid #000 !important;
    border-left:1px solid #000 !important;
    border-top:1px solid #000 !important;
  }
  .table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th {
    border-bottom:1px solid #000 !important;
    border-right:1px solid #000 !important;
    border-left:1px solid #000 !important;
    border-top:1px solid #000 !important;
    padding:3px 3px 3px 3px;
  }
  .margin-bottom{
    margin-bottom: 2px;
  }
  .table> tbody tr.highlight td {
    background-color: #000;
    color:white;
  }
</style>
<!-- begin #page-container -->
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
  <!-- begin #header -->  
 <?php 
    require("../clude/header.php");
 ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
 <?php 
    require("../clude/top_menu.php");
 ?>
 <!-- end #sidebar -->
 <!-- begin #content -->
  <div id="content" class="content">
    <div class="panel panel-default hidden-print col-md-12" style="margin-bottom: 10px;">
      <div class="panel-body"> 
        <div class="form-group row">
          <div class="form-group col-lg-2">
            <label class="sr-only" for="pick">Product</label>
              <select class="form-control selectpicker" id="repo" name="repo" onchange="repo();">
                <option value="0">----SELECT A REPORT----</option>
                <optgroup label="SALES">
                  <option  value="1">Daily Sales</option> 
                  <option  value="2">Cash Sales</option> 
                  <option  value="3">Credit Sales</option> 
                  <option  value="10">Filtered Sales</option>
                  <option  value="5">Sales By Category</option>  
                <option  value="6">Credit Aging Report</option> 
                </optgroup>
                <optgroup label="ITEMS"> 
                  <option  value="7">Item Sale Summary</option> 
                  <option  value="8">Item History</option> 
                </optgroup>
                <optgroup label="USERS">
                  <option  value="9">Sales By Users</option> 
                  <option  value="11">Users Category Sales</option> 
                </optgroup>
                <optgroup label="CUSTOMERS">
                  <option  value="4">Sales By Customer</option>
                </optgroup>
                <optgroup label="PURCHASES">
                  <option  value="12">Daily Purchases</option>
                  <option  value="13">Filtered Purchases</option>
                </optgroup>
              </select>
          </div>
          <!-- <div class="form-group" style="width: 13%; padding: 3px;"  id="div-shop"> 
              <select class="form-control selectpicker" id="shop" name="shop" data-parsley-required="true">
              <option value="0">----SELECT SHOP----</option> 
              <option  value="3">ALL SHOPS</option>
              <option  value="1">SHOP 1</option>
              <option  value="2">SHOP 2</option>
              </select>
          </div> -->
          <div class="form-group" style="width: 13%; padding: 3px;" id="div-item"> 
            <select class="form-control selectpicker" id="item" name="item" data-parsley-required="true">
              <option>----SELECT ITEM----</option> 
              <?php
              $cust = "SELECT * FROM kp_items";
              $cust_r = mysqli_query($connection,$cust) or die("Error getting categories");
              while ($ct = mysqli_fetch_assoc($cust_r)) {
                $name = $ct['stock_code']." ".$ct['name'];
                $item_id = $ct['item_id'];
                ?>
                <option  value="<?php echo $item_id; ?>"><?php echo $name; ?></option>
                <?php
                }
                ?>
            </select>
          </div>
          <div class="form-group"  style="width: 13%; padding: 3px;" id="div-cust"> 
            <select class="form-control selectpicker" id="cust" name="cust" style="width: 100%;">
            <option value="0">--SELECT CUSTOMER--</option> 
            <?php
            $cust = "SELECT * FROM kp_customers";
            $cust_r = mysqli_query($connection,$cust) or die("Error getting categories");
            while ($ct = mysqli_fetch_assoc($cust_r)) {
              $name = $ct['name'];
              $cust_id = $ct['cust_id'];
              ?>
              <option  value="<?php echo $cust_id; ?>"><?php echo $name; ?></option>
              <?php
              }
              ?>
            </select>
          </div> 
          <div class="form-group "  style=" width: 13%; padding: 3px;" id="div-cat"> 
            <select  type="text" class="form-control selectpicker"  id="cat_id" name="cat_id">  </select>
          </div>
          <div class="form-group"  style=" width: 13%; padding: 3px;" id="div-subcat"> 
            <select class="form-control multiple-select2 form-control" multiple="multiple" id="sub_id" name="sub_id"> </select>
          </div>
          <div class="form-group"  style=" width: 13%; padding: 3px;" id="div-users"> 
            <select class="form-control multiple-select2" multiple="multiple" id="user_id" name="user_id"> </select>
          </div>
          <div class="form-group " style="display: none; width: 10%; padding: 3px;" id="div-date1">
            <label class="sr-only" for="pick">Date</label>
            <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" name="day1" class="form-control" id="pick" >
          </div>
          <div class="form-group" style="display: none;  width: 10%; padding: 3px;" id="div-date2">
            <label class="sr-only" for="pick2">Date</label>
            <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" name="day2" class="form-control" id="pick2" >
          </div> 
          <div class="form-group " style="display: none; width: 10%; padding: 3px;" id="div-det">
            <label style="color:blue; margin:0px;">Detailed</label> <br>
              <div class="checkbox checkbox-css checkbox-inline">
                <input type="radio" name="det" id="inc" value="1"/>
                <label for="inc">Yes</label>
              </div>
              <div class="checkbox checkbox-css checkbox-inline">
                <input type="radio" name="det" id="excl" value="2" checked/>
                <label for="excl">No</label>
              </div> 
          </div>
          <div class="form-group col-lg-1.5">
            <button style="margin-left: 30px; " type="button" id="filter"  name="filter" class="btn btn-warning btn-xs">
              <i class="fa fa-search"></i>
            </button> 
          </div>
        </div>
      </div>
    </div> 
    <div id="filter_result" style="background-color:white; padding: 5px;"></div>
  </div>
</div> 
 

	
	<!-- end page container -->

 <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../assets/crossbrowserjs/html5shiv.js"></script>
    <script src="../assets/crossbrowserjs/respond.min.js"></script>
    <script src="../assets/crossbrowserjs/excanvas.min.js"></script>
  <![endif]-->
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
   
  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== -->
 
 <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
  <script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script> 
  <!-- ================== END PAGE LEVEL JS ================== -->
  
<script src="../../assets/plugins/bootstrap-select/bootstrap-select.min.js"></script> 
<script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 
   
<script type="text/javascript">
  <?php include("repo.js");?>
 </script>  
</body>
</html>
  
        