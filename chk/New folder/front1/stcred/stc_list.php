<?php include("../clude/head.php"); ?>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade show"><span class="spinner"></span></div>
	<!-- end #page-loader -->
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
                <!-- begin col-6 -->
			    <div class="col-lg-12">
			        <!-- begin panel -->
                    <div class="panel panel-inverse" data-sortable-id="form-validation-2">
                        <!-- begin panel-heading -->
                        <div class="panel-heading">
                            
                            <h4 class="panel-title">CUSTOMERS STORE CREDIT</h4>
                        </div>
                        <!-- end panel-heading -->
                        <!-- begin panel-body -->
                        <div class="panel-body">
                           <table id="data-table-combine" class="table table-striped">
                                <thead>
                                	<tr>
                                		<th>Customer</th>
                                		<th>Amount</th>
                                		<!-- <th>Action</th>  --> 
                                	</tr>
                                </thead>
                                <tbody>
                <?php
                    $get_menu = mysqli_query($connection,"SELECT cust_id,amount FROM kp_sc") or die("Could not get the balances");
                    while ($mat = mysqli_fetch_assoc($get_menu)) { 
                    	$amount=$mat['amount'];
                    	$cust_id=$mat['cust_id'];
                ?>
                	<tr>
                		<td><?php echo get_cust($cust_id); ?></td>
                		<td><?php echo $amount; ?></td>
                		<!-- <td><a href="cust_pay.php?cid=<?php echo $cust_id; ?>" class="btn btn-sm btn-warning">Pay</a></td> -->
                	</tr>
                    <?php
                      }
                    ?> 
                                </tbody>
                            </table>
                        </div>
                        <!-- end panel-body --> 
                    </div>
                    <!-- end panel -->
                </div>
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

  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  
  <script src="../../assets/plugins/gritter/js/jquery.gritter.js"></script>
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== -->

  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
  <script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/jszip.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/pdfmake.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.print.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/KeyTable/js/dataTables.keyTable.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/RowReorder/js/dataTables.rowReorder.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/select2/dist/js/select2.js"></script>  
<!-- ================== END PAGE LEVEL JS ================== --> 
   
<script type="text/javascript">
    $(document).ready(function() { 
      App.init();
      TableManageCombine.init();
    });
  </script>
</body>
</html>
  
        