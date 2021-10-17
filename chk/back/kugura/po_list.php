<?php 
require("../clude/head.php");
$no=0;
$action="LOADED|-|-|PO LIST PAGE|";
logs($action,"../../");
?>
 
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
		<div id="content" class="content">
			<!-- begin row -->
			<div class="row">
				<!-- begin col-8 -->
				<div class="col-md-11">
					<div class="panel panel-purple" data-sortable-id="index-1">
						<div class="panel-heading">
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
							<h3 class="panel-title" style="color:white;">PURCHASE ORDER LIST</h3>
						</div>
						<div class="panel-body">
							
			<?php
                        if (isset($_GET['msg'])) {
                            if ($_GET['msg'] == 1) {
                                ?>
                                <div class="row">
                                    <div class="alert alert-info">        
                                       <p><i class="fa fa-lg fa-warning"></i>&nbsp;Order successfully Received.</p>
                                    </div>
                                </div>
                                <?php
                            }elseif ($_GET['msg'] ==2) {
                                ?>
                                <div class="row">
                                    <div class="alert alert-warning">        
                                       <p><i class="fa fa-lg fa-warning"></i>&nbsp;Item details updated.</p>
                                    </div>
                                </div>
                                <?php
                            }
                        }
                        ?>
						<?php
						$pending_orders = mysqli_query($connection,"SELECT * FROM kp_po") or die("Could not fetch the purchase orders");
						if (mysqli_num_rows($pending_orders) < 1) {
							echo "There are no pending orders on the database at the moment";
						}else{
						?>
							<table id="data-table-combine" class="table table-striped table-bordered">
								<thead>
                  <tr> 
                    <th>Order Number</th> 
                    <th>Supplier</th>
                    <th>Order By</th>
                    <th>Total Price</th>
                    <th>Date</th> 
                    <th>Status</th>                                       
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  while ($row = mysqli_fetch_assoc($pending_orders)) { 
                    $id = $row['po_id'];
                    $sup_id = $row['sup_id'];
                    $time = $row['day'];
                    $user_id = $row['ord_staff'];
                    $rec_status = $row['rec_status'];  
                    $stock_status = $row['stock_status']; 
                    $ord_date = $row['ord_date'];
  									?>
  									<tr> 
  										<td><?php echo $id; ?></td> 
                      <td><?php echo get_sup($sup_id); ?></td>
  										<td><?php echo get_user($user_id); ?></td>
  										<td><?php echo po_total($id); ?></td>
  										<td><?php echo $ord_date; ?></td>
  										<td>
  											<?php 
  											if ($rec_status==2) {
  												echo "PENDING RECEIVE";
  											}elseif ($rec_status==1 AND $stock_status==2) {
  												echo "PENDING SEND TO STORE";
  											}elseif ($rec_status==1 AND $stock_status==1) {
  												echo "COMPLETELY PROCESSED";
  											} ?>
  										</td>
  										<td class="with-btn-group" nowrap>
                        <div class="btn-group">
                          <a href="#" class="btn btn-warning btn-xs width-60" style="color: white;">Actions</a>
                          <a href="#" class="btn btn-warning btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                          <span class="caret"  style="color: white;"></span>
                          </a>
                          <ul class="dropdown-menu pull-right" style="background-color: purple;">
                            <?php 
                            if ($rec_status==1 AND $stock_status==1) {
                              
                            }else{ 
                            ?> 
                            <li><a href="../kugura/po_view_load.php?id=<?php echo $id; ?>">Receive Items</a></li>
                            <?php
                            } ?>
                            <li><a href="../../print/po_print.php?id=<?php echo $id; ?>">Re-print</a></li>
                            <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $id; ?>" id="view"  >View Order</a></li> 
                          </ul>
                        </div>
                      </td>
                    </tr>
                    <?php
  								}
                  ?>
                </tbody>
              </table>
              <?php
            }
            ?>
          </div>
        </div>
					
					
				</div>
				<!-- end col-8 -->
				<!-- begin col-4 -->
				
				<!-- end col-4 -->
			</div>
			<!-- end row -->
		</div>
	
		<!-- end #content -->
		
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
   
  <script>
    $(document).ready(function() {
      App.init();
      TableManageCombine.init(); 
        $(document).on('click','#view', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row  
          $.ajax({
            url: 'items_po.php',
            typr: 'POST',
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
  
        