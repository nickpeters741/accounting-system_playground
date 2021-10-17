<?php 
require("../clude/head.php"); 
$sum=0;
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
                <option  value="1">Daily Sales</option> 
                <option  value="2">Cash Sales</option> 
                <option  value="3">Credit Sales</option> 
                <option  value="10">Filtered Sales</option> 
                <option  value="9">Sales By Users</option> 
                <option  value="11">Users Category Sales</option> 
                <option  value="4">Sales By Customer</option>
                <option  value="5">Sales By Category</option>
                <option  value="6">Credit Aging Report</option> 
                <option  value="7">Item Sale Summary</option> 
                <option  value="8">Item History</option> 
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
            <select class="form-control selectpicker" id="cust" name="cust">
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
          <div class="form-group col-lg-2"  style=" width: 13%; padding: 3px;" id="div-subcat"> 
            <select class="form-control multiple-select2 form-control" multiple="multiple" id="sub_id" name="sub_id"> </select>
          </div>
          <div class="form-group col-lg-2"  style=" width: 13%; padding: 3px;" id="div-users"> 
            <select class="form-control multiple-select2 form-control" multiple="multiple" id="user_id" name="user_id"> </select>
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
function repo(){
  var report = document.getElementById("repo").value;
  $('#filter_result').html(""); 
    console.log(status);
  if(report == 0){ 
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'none';
    document.getElementById('div-date2').style.display = 'none';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
  } else if(report == 1) { 
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","day_sale()");
  } else if (report == 2) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cash_sale()");
  } else if (report == 3) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cred_sale()");
  } else if (report == 4) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'block';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cust_sale()");
  } else if (report == 5) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'block';
    document.getElementById('div-subcat').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cat_sale()");
    $.fn.get_cat();
  } else if (report == 6) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'none';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cred_age()"); 
  } else if (report == 7) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","item_sum()"); 
  }else if (report == 8) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-item').style.display = 'block';
    document.getElementById('div-date1').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $("#filter").attr("onclick","item_hist()"); 
  }else if (report == 9) {
    document.getElementById('div-users').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $.fn.get_users();
    $("#filter").attr("onclick","user_sales()"); 
  }else if (report == 10) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $("#filter").attr("onclick","filtered_sales()"); 
  }else if (report == 11) {
    document.getElementById('div-users').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    //document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $.fn.get_users();
    $("#filter").attr("onclick","user_cat_sales()"); 
  }
}
function item_hist(){
    start_date = document.getElementById('pick').value;
    end_date = document.getElementById('pick2').value;
    item = document.getElementById('item').value;
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","item_hist.php?start_date="+start_date+"&end_date="+end_date+"&item="+item,false);
    xmlhttp.send(null);
    document.getElementById("filter_result").innerHTML = xmlhttp.responseText;
    document.getElementById("filter_result").style.visibility = "visible";
}
function item_sum(){
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
  xmlhttp = new XMLHttpRequest();
  xmlhttp.open("GET","item_sum.php?start_date="+start_date+"&end_date="+end_date,false);
  xmlhttp.send(null);
  document.getElementById("filter_result").innerHTML = xmlhttp.responseText;
  document.getElementById("filter_result").style.visibility = "visible";
}
function cash_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  shop = document.getElementById('shop').value;
  det =$('input[name="det"]:checked').val();
  console.log(det);
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  } else if(shop === '' || shop==null || shop==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a shop!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cash_sales.php',
            typr: 'POST', 
            data: {id:1,start_date:start_date,end_date:end_date,det:det,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
  }
}
function cred_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  shop = document.getElementById('shop').value;
  var det =$('input[name="det"]:checked').val();

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(shop === '' || shop==null || shop==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a shop!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cash_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
  }
}
function cust_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  cust_id = document.getElementById('cust').value;
  var det =$('input[name="det"]:checked').val();

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(cust_id === '' ||cust_id==null ||cust_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Customer!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cust_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det,cust_id:cust_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
}
function cat_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  cust_id = document.getElementById('cust').value;
  var det =$('input[name="det"]:checked').val();
  if( $('#sub_id :selected').length > 0){ 
    var sub_id = [];
    $('#sub_id :selected').each(function(i, selected) {
        sub_id[i] = $(selected).val();
    }); 
  } else {
    var sub_id = document.getElementById('sub_id').value; 
  } 
  console.log(sub_id); 
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(sub_id === '' ||sub_id==null ||sub_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cat_sale.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det,sub_id:sub_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
} 
function user_sales(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  if( $('#user_id :selected').length > 0){ 
    var user_id = [];
    $('#user_id :selected').each(function(i, selected) {
        user_id[i] = $(selected).val();
    }); 
  } else {
    var user_id = document.getElementById('user_id').value; 
  } 
  console.log(user_id); 

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(user_id === '' ||user_id==null ||user_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'user_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,user_id:user_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
} 
function user_cat_sales(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  if( $('#user_id :selected').length > 0){ 
    var user_id = [];
    $('#user_id :selected').each(function(i, selected) {
        user_id[i] = $(selected).val();
    }); 
  } else {
    var user_id = document.getElementById('user_id').value; 
  } 
  console.log(user_id); 

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(user_id === '' ||user_id==null ||user_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'user_cat_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,user_id:user_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
} 
function day_sale(){ 
  $('#filter_result').html(""); 
  $('#filter_result').append('<table id="data-table-scroller" class="table table-striped table-bordered display">'
    +'<thead>'
    +'<tr>'
      +'<th>NO#</th>'
      +'<th>DAY</th>'
      +'<th>CASH TOTAL</th>'
      +'<th>CREDIT TOTAL</th>'
      +'<th>ACTION</th>'
      +'</tr>'
    +'</thead>'
  +'</table>');

  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  // test for empty string
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  } else {
    if ($('#data-table-scroller').length !== 0) {
      $('#data-table-scroller').DataTable({ 
        processing: true,
        serverSide: true, 
        deferRender:    true,
        scrollY:        300,
        scrollCollapse: true,
        scroller:       true,
        responsive:     true, 
        ajax: {
          url: "json_test.php", 
          data: {action: 'daysale', start_date:start_date,end_date:end_date},  
          type: 'GET', 
        }
      });
    } 
  } 
}
function cred_age(){
  start_date = document.getElementById('pick').value; 
  det =$('input[name="det"]:checked').val();
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else {
    $('#filter_result').html("");  
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'credit_aging.php',
      typr: 'POST', 
      data: {start_date:start_date,det:det},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
       // $('#modal-loader').hide();
    }); 
  }
}

function filtered_sales(){
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;  
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if (end_date === '' ||end_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger"); 
  } else {
    $('#filter_result').html("");  
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'filt_sales.php',
      typr: 'POST', 
      data: {start_date:start_date, end_date:end_date},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
       // $('#modal-loader').hide();
    }); 
  }
}
function view(id){
  $('#modal').modal('show');
  $.ajax({
      url: 'sale_items.php',
        typr: 'POST',
        data: 'id='+id,
        dataType: 'html'
    })
    .done(function(data){
    $('#load').html('');
    $('#load').html(data);
    })
    .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
}
$(document).ready(function() {
  App.init(); 
  $(".selectpicker").select2(); 
  $(".multiple-select2").select2({ placeholder: "Select a state" });
  $("#cat_id").change(function(event){
     var selected = $(this).val();
     $('#sub_id').removeAttr('disabled');
     $('#sub_id').empty();
     console.log(selected);
     $.ajax({ 
      type: "GET",
      url: '../../gen/get_subs.php',
      data: { id: selected },
      success:  function(data) { 
        $('#sub_id').append(data);
      }
    });
  });
  $.fn.get_cat = function(){ 
    $('#cat_id').empty(); 
    $.ajax({
      type: "GET",
      url: '../../gen/get_cat.php', 
      data: { },
      success:  function(data) {  
        $('#cat_id').append(data);
      }
    });
  }
  $.fn.get_users = function(){ 
    $('#user_id').empty(); 
    $.ajax({
      type: "GET",
      url: '../../gen/get_users.php', 
      data: { },
      success:  function(data) {  
        $('#user_id').append(data);
      }
    });
  }
}); 
</script>  
</body>
</html>
  
        