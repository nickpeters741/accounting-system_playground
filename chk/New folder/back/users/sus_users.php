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
              <div class="pull-right"></div>
              <h4 class="panel-title">SUSPENDED USERS LIST</h4>
            </div>
						<div class="panel-body">
							 <?php
                  $get_users = mysqli_query($connection,"SELECT * FROM kp_users WHERE user_work_status=3") or die("Could not get any users");
                  if (mysqli_num_rows($get_users) < 1) {
                    echo "There are no suspnded users in the database";
                  }else{
                ?>

                <table id="data-table-combine" class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th>User id:</th>
                      <th>Name</th> 
                      <th>Username</th> 
                      <th>Phone:</th>
                      <th>ID</th> 
                      <th>Password</th> 
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
                          <td><?php echo $row['user_name']; ?></td>
                          <td><?php echo $row['user_username']; ?></td> 
                          <td><?php echo $row['user_phone']; ?></td>
                          <td><?php echo $row['user_nid']; ?></td>
                          <td class="text-center">
                            <a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['user_id']; ?>" id="changepass" class="btn btn-xs btn-warning" style="color:white;"><i  class="fa fa-pencil"></i> Change Pass</a>
                          </td>
                         <!--  <td>
                            <a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['staff_id']; ?>" id="user_edit" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a>
                            |&nbsp;
                            <a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['staff_id']; ?>" id="user-del" class="btn btn-xs btn-danger"><i  class=" fa fa-times"></i></a>
                          </td> -->
                          <td class="with-btn-group" nowrap>
                            <div class="btn-group">
                                <a href="#" class="btn btn-lime btn-sm width-60">Actions</a>
                                <a href="#" class="btn btn-lime btn-sm dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['staff_id']; ?>" id="user_edit"><i  class="fa fa-edit"></i>&nbsp;Edit</a></li>
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['staff_id']; ?>" id="user-del"><i  class=" fa fa-times"></i>&nbsp;Delete</a></li>
                                    <li><a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $row['staff_id']; ?>" id="user-perm"><i  class=" fa fa-lock-open"></i>&nbsp; Set Permission</a></li>
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
   
  <script>
    $(document).ready(function() {
      App.init();

    });
    <?php include("user.js"); ?>
   </script>
</body>
</html>
 
        