<?php 
require("../clude/head.php");

$action="LOADED SUPPLIER PAGE| ";
$url="../../";
logs($action,$url);

$folder="back/sup/";
thesion_page($folder);
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
                <!-- begin col-6 -->
			    <div class="col-lg-12">
			        <!-- begin panel -->
                    	<div class="panel panel-inverse" data-sortable-id="index-1">
						<div class="panel-heading"> 
               <div class="pull-right">
                <Button href="#sup-modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="sup-add" ><i class="fa fa-plus"></i> &nbsp;NEW SUPPLIER</Button> &nbsp; &nbsp; &nbsp; &nbsp;
          
               </div>
              
							<h4 class="panel-title">SUPPLIER LIST</h4>
             	</div>
						<div class="panel-body">
							 <?php
                  $get_category = mysqli_query($connection,"SELECT * FROM kp_suppliers WHERE del_status=2") or die("Could not get any items");
                  if (mysqli_num_rows($get_category ) < 1) {
                    echo "There are no registered Suppliers in the database";
                  }else{
                ?>
                <table id="data-table-combine" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Supplier Id</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Location</th>
                                        <th>PIN</th>
                                        <th>VAT</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                while ($row = mysqli_fetch_assoc($get_category)) {
                                  $sup_id = $row['sup_id'];
                                  $name=$row['sup_name'];                                
                                ?>
                                    <tr>
                                       <td><?php echo $sup_id; ?></td>
                                        <td><?php echo $name; ?></td>
                                        <td><?php echo $row['sup_phone']; ?></td>
                                        <td><?php echo $row['sup_email']; ?></td>
                                        <td><?php echo $row['sup_address']; ?></td>
                                        <td><?php echo $row['sup_location']; ?></td>
                                        <td><?php echo $row['sup_pin']; ?></td>
                                        <td><?php echo $row['sup_vat']; ?></td> 
                                        <td class="with-btn-group" nowrap>
                            <div class="btn-group">
                                <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                                <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                  <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                  <li><a data-toggle="modal" data-target="#sup-modal" data-id="<?php echo $sup_id; ?>" id="sup-edit">Edit Supplier</a></li>
                                  <li><a data-toggle="modal" data-target="#sup-modal" data-id="<?php echo $sup_id; ?>" id="sup-del">Discontiue Supplier</a></li>
                                  <li><a data-toggle="modal" data-target="#sup-modal" data-id="<?php echo $sup_id; ?>" id="view-lpo">View L.P.O's</a></li>
                                   <li><a data-toggle="modal" data-target="#sup-modal" data-id="<?php echo $sup_id; ?>"  id="view-grn">View GRN</a></li> 
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
                    <!-- end panel -->
                </div>
                <!-- end col-6 -->


            </div>
            <!-- end row -->
		</div>
		<!-- end #content -->
<div  id="sup-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="sup-load"></div>
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
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script>
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

    });
  <?php include("sup.js");?>
  </script> 
</body>
</html>

        