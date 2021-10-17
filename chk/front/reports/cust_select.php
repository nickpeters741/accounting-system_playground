<?php 
require("../clude/head.php"); 
$sum=0;
?>
 

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
@media print {
 .hidden-print {
    display: none !important;
  }
  .sidebar,
  .top-menu,
  .header,
  .theme-panel {
    display: none !important;
  }
  .p-order{ 
    padding: 2mm !important;
    margin: 2mm !important; 
    width: 98% !important;
    height: 100% !important; 
    background: #FFF; 
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
  <!-- begin #sidebar -->
 <?php 
    require("../clude/menu.php");
 ?>
 <!-- end #sidebar -->
 <!-- begin #content -->
 <div id="p-order" class="p-order" style="margin-left: 230px; margin-top: 5px;">
  <div class="panel panel-default hidden-print col-md-12" style="margin-bottom: 10px;">
    <div class="panel-body"> 
        <div class="form-group row">
          <div class="form-group col-lg-3">
            <label class="sr-only" for="pick">Date</label>
            <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" name="day1" class="form-control" id="pick" >
          </div>
          <div class="form-group col-lg-3">
            <label class="sr-only" for="pick2">Date</label>
            <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" name="day2" class="form-control" id="pick2" >
          </div>
           <div class="form-group col-lg-4">
            <label class="sr-only" for="pick">Customer</label>
              <select class="form-control selectpicker" id="cust" name="cust" data-parsley-required="true">
              <option>----SELECT CUSTOMER----</option> 
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
          <div class="form-group col-lg-2">
            <button style="margin-left: 30px; " type="button" onclick="filter_cust()" name="filter" class="btn btn-purple btn-xs"><i class="fa fa-search"></i></button> 
          </div>
        </div>
        
    </div>
  </div>
    
		<div id="filter_result" class="col-md-12" style="background-color: white;"></div>
	 
</div>
</div> 
<script type="text/javascript">
  function filter_cust(){
    start_date = document.getElementById('pick').value;
    end_date = document.getElementById('pick2').value;
    cust = document.getElementById('cust').value;
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
  //   xmlhttp = new XMLHttpRequest();
  //   xmlhttp.open("GET","cust_statement.php?start_date="+start_date+"&end_date="+end_date+"&cust="+cust,false);
		// xmlhttp.send(null); 
		// document.getElementById("filter_result").innerHTML = xmlhttp.responseText;
		// document.getElementById("filter_result").style.visibility = "visible";
    $.ajax({
      url: 'cust_statement.php',
      typr: 'GET',
      data: "start_date="+start_date+"&end_date="+end_date+"&cust="+cust,
      dataType: 'html'
    })
    .done(function(data){ 
      $('#filter_result').html(''); // blank before load.
      $('#filter_result').html(data);
    })
    .fail(function(){
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    });
	}
	</script>
	
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
  <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script>  
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== -->
 
   
<script>
function sale(id){  
  $('#load').html(''); // leave this diff blank 
      $('#modal').modal('show');  
  $.ajax({
    url: 'sale_items.php',
    typr: 'GET',
    data: 'id='+id,
    dataType: 'html'
  })
  .done(function(data){ 
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
}

function ret(id){  
  $('#load').html(''); // leave this diff blank 
  $('#modal').modal('show');  
  $.ajax({
    url: 'ret_items.php',
    typr: 'GET',
    data: 'id='+id,
    dataType: 'html'
  })
  .done(function(data){ 
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
}

function quote(id){  
  $('#load').html(''); // leave this diff blank 
      $('#modal').modal('show');  
  $.ajax({
    url: 'kuot_items.php',
    typr: 'GET',
    data: 'id='+id,
    dataType: 'html'
  })
  .done(function(data){ 
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
}

    $(document).ready(function() {
      App.init(); 
      $(".selectpicker").select2(); 

    $(document).on('click','#re-print', function(e){ 
      var uid = $(this).data('id'); // get id of clicked row 
      var type = $(this).data('id2'); // get id of clicked row 
      $('#load').html(''); // leave this diff blank 
      $.ajax({
        url: 'reprint_modal.php',
        typr: 'GET',
        data: 'id='+uid+'&type='+type,
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    });
    $(document).on('click','#pay_dis', function(e){ 
      var uid = $(this).data('id'); // get id of clicked row  
      $('#load').html(''); // leave this diff blank 
      $.ajax({
        url: 'pay_dist.php',
        typr: 'GET',
        data: 'id='+uid,
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    });

	}); 
 </script> 
</body>
</html>
  
        