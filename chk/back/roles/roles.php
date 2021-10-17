<?php 
require("../clude/head.php");
$no=0;
$folder="back/roles/";
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
    <!-- begin panel -->
    <div class="panel panel-inverse">
      <div class="panel-heading">
        <div class="panel-heading-btn">
          <a href="#modal" id="new" class="btn btn-sm btn-lime pull-right" data-toggle="modal" ><i class="fa fa-plus"></i> &nbsp;Add Role</a>
        </div>
        <h4 class="panel-title">Roles</h4>
      </div>
      <div class="panel-body">
        <?php
        $get_priv = mysqli_query($connection ,"SELECT * FROM kp_roles") or die(mysqli_error($connection));
        if( mysqli_num_rows($get_priv) < 1){
          echo "There are no registered roles";
        }else{
          ?>
          <table id="data-table" class="table table-striped table-bordered nowrap" width="100%">
            <thead>
              <tr>
                  <th>ROLE ID</th>
                  <th>NAME</th>
                  <th>DESCRIPTION</th>
                  <th>ACCESS</th>
                  <th>DASHBOARD</th>
                  <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <?php
              while ($data = mysqli_fetch_assoc($get_priv)) {
                $role_id = $data['role_id'];
                $priv_name=$data['name'];
              ?>
              <tr>
                <td><?php echo $data['role_id']; ?></td>
                <td><?php echo $data['name']; ?></td>
                <td><?php echo $data['description']; ?></td>
                <td><?php 
                      if ($data['access_panel']==1) {
                        echo "Back End";
                      }elseif ($data['access_panel']==2) {
                        echo "Front End";
                      }else{
                        echo "Both";
                      }; 
                    ?>
                </td> 
                <td><?php echo $data['access_dash']; ?></td>
                <td class="with-btn-group" nowrap>
                  <div class="btn-group">
                    <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                    <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown"><span class="caret"></span></a>
                    <ul class="dropdown-menu pull-right">
                        <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $role_id; ?>" id="edit" ><i  class="fa fa-edit"></i>Edit Role</a></li>
                        <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $role_id; ?>" id="del" ><i  class=" fa fa-trash"></i>Delete Role</li>
                        
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
   <script src="roles_js.js"></script>   
</body>
</html>
