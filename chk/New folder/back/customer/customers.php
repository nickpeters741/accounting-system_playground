<?php 
require("../clude/head.php");
$no=0; 
 $folder="back/customer/";
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
      <!-- begin col-8 -->
      <div class="col-md-12">
        <div class="panel panel-inverse" data-sortable-id="index-1">
          <div class="panel-heading"> 
            <div class="pull-right">
              <Button href="#modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="new-cust" ><i class="fa fa-plus"></i> &nbsp;Add Customers</Button> &nbsp; &nbsp; &nbsp; &nbsp;
            </div>
            <h4 class="panel-title">Customers List</h4>
          </div>
          <div class="panel-body">
            <?php
            $get_customers = mysqli_query($connection,"SELECT * FROM kp_customers WHERE del_status=2") or die("Could not get any suppliers");
            if (mysqli_num_rows($get_customers) < 1) {
              echo "There are no registered Customers";
            }else{
            ?>
            <table id="data-table-combine" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th style="width:2%;">Cus No:</th>
                    <th style="width:20%;">Customer Name</th>
                    <th style="width:20%;">Alias</th>
                    <th style="width:10%;">Phone no:</th>
                    <th style="width:15%;">Address</th>
                    <th style="width:5%;">Location</th>
                    <th style="width:5%;">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php 
                  foreach ($get_customers as $row) {
                    $no=$no+1;
                    ?>
                    <tr>
                      <td><?php echo $row['cust_id']; ?></td>
                      <td><?php echo strtoupper( $row['name']); ?></td>
                      <td><?php echo strtoupper($row['alias']); ?></td>
                      <td><?php echo $row['phone']; ?></td>
                      <td><?php echo strtoupper($row['address']); ?></td>
                      <td><?php echo strtoupper($row['location']); ?></td>
                      <td>&nbsp;.
                        <a data-toggle="modal" data-target="#modal" data-id="<?php echo $row['cust_id']; ?>" id="edit-cust" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a>
                        &nbsp;
                        <a data-toggle="modal" data-target="#modal" data-id="<?php echo $row['cust_id']; ?>" id="del-cust" class="btn btn-xs btn-danger"><i  class=" fa fa-trash"></i></a>
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
        <!-- end row -->
      </div>
      <!-- end #content -->
    </div>
  </div>
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
    <script type="text/javascript"> 
      <?php include("customer.js");?>
    </script>  
  </body>
</html> 
        


