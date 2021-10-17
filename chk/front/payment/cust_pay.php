<?php 
include("../clude/head.php");
$cust_id=$_GET['id'];
$balance=cust_bal($cust_id);
// $column="cust_id";
// update_thesion($column,$value,$page)

$action="LOADED|-|-|-|PAYMENT PAGE FOR CUSTOMER". get_cust($cust_id);
logs($action,"../../"); 
 ?>
<body>
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		  <!-- begin #header -->  
      <?php 
        require("../clude/header.php");
      ?>
      <!-- end #header --> 
    <!-- begin #menu -->
		<?php include("../clude/menu.php") ?>
		<!-- end #menu -->
    <!-- begin #content -->
		<div id="content" class="content">
			<!-- begin row -->
			<div class="row">
        
        <!-- begin col-8 -->
        <div class="col-lg-8 row">
        <!--   <div class="col-lg-12">
             begin panel  
          <div class="panel"> 
            <div class="panel-body"><h4>FILTER</h4>
              <div class="form-group row"> 
                <div class="form-group  col-md-2">
                  <label >Order No:</label> *
                  <input type="text" class="form-control "  id="sale_id" name="sale_id" />
                  <p id="error-name" style="color: red;"></p>
                </div>  
                <div class="form-group  col-md-2">
                  <label >Refno:</label> *
                  <input type="text" class="form-control "  id="refno" name="refno" />
                  <p id="error-name" style="color: red;"></p>
                </div>  
                <div class="form-group col-md-2">
                  <label >Start Date</label>
                  <input type="date" class="form-control"  id="pick1" name="pick1"/>
                </div>
                <div class="form-group col-md-2">
                  <label >End Date</label>
                  <input type="date" class="form-control"  id="pick2" name="pick2"/>
                </div>  
                
                <div class="form-group col-md-2"> <br><br>
                  <button type="button" onclick="filter_sup()" name="filter" class="btn btn-sm btn-warning"><i class="fa fa-search"></i></button> 
                </div>
              </div>
            </div>
          </div>
          </div> -->
          <div class="col-lg-12">
          <!-- begin panel -->
          <div class="panel panel-inverse">
            <!-- begin panel-heading -->
            <div class="panel-heading">
              <div class="pull-right">
                <a name="conso" id="conso" class="btn btn-purple btn-xs pull-right" onclick="conso_pay(<?php echo $cust_id; ?>)"> CONSOLIDATED PAYMENT</a>
              </div>
              <h4 class="panel-title"><?php echo get_cust($cust_id); ?> UNPAID INVOICES</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
              <table id="data-table-combine" class="table table-striped table-bordered">
                <thead>
                	<tr>
                    <th><input type="checkbox" name="checkAll" class="checkAll">Pay All</th> 
                		<th>INV No.</th>
                    <th>REF No.</th>
                		<th>Date</th>
                		<th>Served by</th>
                		<th>Amount</th>
                		<th>Balance</th> 
                		<th>Progress</th> 
                	</tr>
                </thead>
                <tbody>
                <?php
                $get_menu = mysqli_query($connection,"SELECT * FROM kp_sales WHERE sale_bal>0 AND cust_id='$cust_id'") or die("Could not get the customer invoices with balances". mysqli_error($connection));
                while ($mat = mysqli_fetch_assoc($get_menu)) {
                  $sale_id=$mat['sale_id'];
                	$user_id=$mat['user_id'];
                	$day=$mat['day'];
                  $refno=$mat['refno'];
                	$bal=$mat['sale_bal'];
                	$amount=$mat['sale_amount'];
                	$paid=$amount-$bal;
                	$perc=round($paid/$amount*100, 2);
                ?>
                <tr>
                  <td> <input type="checkbox" name="pay-sale[]" onclick="bulk_pay(<?php echo $cust_id; ?>)" value="<?php echo $sale_id; ?>" class="bulk" />
                  </td>
              		<td><?php echo $sale_id; ?></td>
                  <td><?php echo $refno; ?></td>
              		<td><?php echo $day; ?></td>
              		<td><?php echo get_user($user_id); ?></td>
              		<td><?php echo $amount; ?></td>
              		<td><?php echo $bal; ?></td>
              		<td> 
                    <div class="progress" style="height: 18px;">
                      <div class="progress-bar progress-bar-striped  bg-lime" style="width:<?php echo $perc ; ?>%"><?php echo $perc ; ?>% </div>
                    </div>
                  </td>
              	</tr>
                <?php
                  }
                ?> 
              </tbody>
          </table>
        </div>
      </div>
    </div>
      <!-- end panel -->
    </div>
    <!-- end col-8 -->
    <!-- begin col-6 -->
        <div class="col-lg-4"> 
          <!-- begin panel -->
          <div class="panel" id="sale-items">  
          </div>
          <!-- end panel-body --> 
        </div>
        <!-- end panel -->
        <!-- end col-6 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
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
  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->
    
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== --> <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
  <script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/jszip.min.js"></script> 
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.print.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 
 
  <script type="text/javascript">
    function cred(){
      var store_credit =parseInt(document.getElementById('nameidsc').value);
      var new_total =parseInt(document.getElementById('grand_total').value);
      if (store_credit>new_total) {
        document.getElementById('nameidsc').value=new_total;
      } else if (store_credit==new_total) {
        document.getElementById('nameidsc').value=new_total;
      } else if (store_credit<new_total) {
        document.getElementById('nameidsc').value=store_credit;
      }
      calculate();
    } 
    $(function(){
      $('.checkAll').click(function(){
        if (this.checked) {
          $(".bulk").prop("checked", true);
          bulk_pay(<?php echo $cust_id; ?>);
        } else {
          $(".bulk").prop("checked", false);
          $('#sale-items').html('');
        }	
      });
    });
    function calculate(){
      var cust_bal=<?php echo $balance; ?>; 
      var total=0; 
      var array = [];
      $("input[class=check]:checked").each(function() { 
        array.push($(this).val()); 
      }); 
      var arrayLength = array.length;
      for (var i = 0; i < arrayLength; i++) {
        var id='nameid'+array[i];  
        var amount=document.getElementById(id).value; 
        total=parseInt(total)+parseInt(amount);
      }
       
      document.getElementById('amount').value = total;  
      var balance=parseInt(total)-parseInt(cust_bal);
      console.log(cust_bal);
      console.log(total);
      console.log(balance);
      if (balance == 0) { 
        document.getElementById("pay-btn").disabled = false;
        document.getElementById('div-change').style.display = 'none';
      }else if (balance>0){ 
         document.getElementById('div-change').style.display = 'block';
        document.getElementById("pay-btn").disabled = true; 
      }else if (balance< 0){
        document.getElementById('div-change').style.display = 'none';
        document.getElementById("pay-btn").disabled = true; 
      }
    }  
 
function conso_pay(cust_id){  
    $.ajax({
      url: 'conso.php',
      typr: 'POST',
      data: 'cust_id='+cust_id,
      dataType: 'html'
    })
    .done(function(data){ 
      $('#sale-items').html(''); // blank before load.
      $('#sale-items').html(data);
    })
    .fail(function(){
      $('#sale-items').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    }); 
  } 
  function bulk_pay(cust_id){ 
    var invoices = [];
    $("input[class=bulk]:checked").each(function() { 
      invoices.push($(this).val()); 
    });  
    $.ajax({
      url: 'bulk_form.php',
      typr: 'POST',
      data: 'invoices='+invoices+'&cust_id='+cust_id,
      dataType: 'html'
    })
    .done(function(data){  
      $('#sale-items').html(''); // blank before load.
      $('#sale-items').html(data);
    })
    .fail(function(){
      $('#sale-items').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    }); 
  } 
  function pay(cust_id,amount){ 
    var invoices = [];
    $("input[class=bulk]:checked").each(function() { 
      invoices.push($(this).val()); 
    });  
    invoices=invoices.sort()
    invoices = invoices.sort(function (a, b) {  return a - b;  });
    invoices = invoices.sort((a, b) => a - b);
    $.ajax({
      url: 'pay_modal.php',
      typr: 'POST',
      data: 'invoices='+invoices+'&cust_id='+cust_id+'&amount='+amount,
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
  function pay_conso(cust_id,amount){  
    
    $.ajax({
      url: 'pay_modal.php',
      typr: 'POST',
      data: 'cust_id='+cust_id+'&amount='+amount,
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
      TableManageCombine.init();
      
    });
  </script>
</body>
</html>
