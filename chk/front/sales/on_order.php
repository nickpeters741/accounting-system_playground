<?php 
require("../clude/head.php");
$no=0; 
 $folder="front/sales/";
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

            </div>
            <h4 class="panel-title">Online Orders</h4>
          </div>
          <div class="panel-body">
 
            <table id="data-table-combine" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th style="width:2%;">Ord No:</th>
                    <th style="width:20%;">Customer </th>
                    <th style="width:20%;">Amount</th>
                    <th style="width:10%;">Date</th>
                    <th style="width:15%;">Items</th>
                    <th style="width:5%;">Action</th>
                  </tr>
                </thead>
                <tbody>

                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>

                      <td></td>
                    </tr>

                </tbody>
              </table>

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
 
  </body>
</html> 
        


