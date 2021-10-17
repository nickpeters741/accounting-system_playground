<?php 
require("../clude/head.php");
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
               <div class="pull-right">
                <Button href="#user-modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="user-add" ><i class="fa fa-plus"></i> &nbsp;NEW USER</Button> &nbsp; &nbsp; &nbsp; &nbsp;
          
               </div>
              
							<h4 class="panel-title">USER LIST</h4>
             	</div>
						<div class="panel-body">
							 <?php 
                  $get_users = mysqli_query($connection,"SELECT username,work_status,staff_id,user_id,kp_roles.name,kp_roles.access_panel FROM kp_users  INNER JOIN kp_roles ON kp_users.role_id=kp_roles.role_id  WHERE kp_users.sys_default=2") or die("Could not get any users".mysqli_error($connection));
                  if (mysqli_num_rows($get_users) < 1) {
                    echo "There are no registered users in the database";
                  }else{
                ?>

                <table id="data-table-combine" class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>User id:</th>
                      <th>Name</th> 
                      <th>Username</th>  
                      <th>Password</th> 
                      <th>Role</th> 
                      <th>Access panel</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                    foreach ($get_users as $row) {
                      $no=$no+1;
                       $work_s=$row['work_status'];
                      ?>
                        <tr>
                          <td><?php echo $row['user_id']; ?></td>
                          <td><?php echo get_staff($row['staff_id']); ?></td>
                          <td><?php echo $row['username']; ?></td>  
                          <td class="text-center">
                            <a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['user_id']; ?>" id="changepass" class="btn btn-xs btn-warning" style="color:white;"><i  class="fa fa-pencil"></i> Change Pass</a>
                          </td> 
                          <td><?php echo $row['name']; ?></td>
                          <td><?php 
                      if ($row['access_panel']==1) {
                        echo "Back End";
                      }elseif ($row['access_panel']==2) {
                        echo "Front End";
                      }else{
                        echo "Both";
                      }; 
                    ?>
                </td> 
                          <td class="with-btn-group" nowrap>
                            <div class="btn-group">
                                <a href="#" class="btn btn-lime btn-sm width-60">Actions</a>
                                <a href="#" class="btn btn-lime btn-sm dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right" style="color: purple;">
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['user_id']; ?>" id="user_edit"><i  class="fa fa-edit"></i>&nbsp;Edit</a></li>
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['user_id']; ?>" id="user-del"><i  class=" fa fa-times"></i>&nbsp;Delete</a></li>
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['user_id']; ?>" id="user-perm"><i  class=" fa fa-lock-open"></i>&nbsp; Set Permission</a></li>
                                   <!--  <li><a href="#modal-dialog" data-toggle="modal">Adjust price</a></li>
                                    <li><a href="#">Price History</a></li> -->
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
<div  id="user-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="user-load"></div>
</div>
</div>
	<!-- end page container -->
 <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
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
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script> 
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.print.min.js"></script> 
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
  <script src="../../assets/plugins/DataTables/extensions/KeyTable/js/dataTables.keyTable.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/RowReorder/js/dataTables.rowReorder.min.js"></script>
  <!-- <script src="../../assets/plugins/DataTables/extensions/Select/js/dataTables.select.min.js"></script> -->
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
   
   <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 
  <script>
    $(document).ready(function() {
      App.init();
      TableManageCombine.init();

    });
    <?php include("user.js"); ?>
   </script>
</body>
</html>
 
        