<?php 
require("../clude/head.php");
$action="LOADED|-|-|ARCHIVE STAFF PAGE";
logs($action,"../../");
$no=0;
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
              <h4 class="panel-title">ARCHIVED STAFF</h4>
             	</div>
						<div class="panel-body">
          


							 <?php
                  $get_customers = mysqli_query($connection,"SELECT * FROM kp_staff WHERE staff_del_status=1") or die("Could not get any staff");
                  if (mysqli_num_rows($get_customers) < 1) {
                    echo "There are no archived staff in the System";
                  }else{
                ?>

                <table id="data-table-combine" class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>Staff No:</th>
                      <th>Staff Name</th> 
                      <th>Phone no:</th>
                      <th>Email</th>
                      <th>Address</th>
                      <th>Residence</th>
                      <!-- <th>Action</th> -->
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                    foreach ($get_customers as $row) {
                      $no=$no+1;
                      ?>
                        <tr>
                          <td><?php echo $row['staff_id']; ?></td>
                          <td><?php echo $row['staff_name']; ?></td> 
                          <td><?php echo $row['staff_phone']; ?></td>
                          <td><?php echo $row['staff_email']; ?></td>
                          <td><?php echo $row['staff_address']; ?></td>
                          <td><?php echo $row['staff_residence']; ?></td>
                          <!-- <td>
                            <a data-toggle="modal" data-target="#staff-modal" data-id="<?php echo $row['staff_id']; ?>" id="staff_edit" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a>
                            |&nbsp;
                            <a data-toggle="modal" data-target="#staff-modal" data-id="<?php echo $row['staff_id']; ?>" id="staff-del" class="btn btn-xs btn-danger"><i  class=" fa fa-times"></i></a>
                          </td>  
                          <td class="with-btn-group" nowrap>
                            <div class="btn-group">
                                <a href="#" class="btn btn-warning btn-sm width-60">Actions</a>
                                <a href="#" class="btn btn-warning btn-sm dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                  <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                  <li><a data-toggle="modal" data-target="#staff-modal" data-id="<?php echo $row['staff_id']; ?>" id="staff_edit">Edit Staff</a></li>
                                  <li><a data-toggle="modal" data-target="#staff-modal" data-id="<?php echo $row['staff_id']; ?>" id="staff-del">Archive Staff</a></li>
                                 <li><a href="#">Price History</a></li>
                                </ul>
                            </div>
                        </td>-->
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
<div  id="staff-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="staff-load"></div>
</div>
</div>
	<!-- end page container -->
<!-- end page container -->
  <?php 
    require("../clude/foot.php");
    ?>
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
    });
    <?php include("staff.js");?>
  </script>   
  </body>
</html> 
        


    
        