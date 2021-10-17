<?php 
require("../clude/head.php");
$no=0;
?>
<!-- begin #page-container --> 
<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
  <!-- begin #header -->  
 <?php 
     require("../clude/header.php");
 ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
 <?php 
     require("../clude/top_menu.php");
 ?>
  <!-- end #sidebar -->
  <!-- begin #content -->
  <div id="content" class="content">
    <!-- begin row -->
    <div class="row">
      <!-- begin col-6 -->
      <div class="col-lg-12 col-md-12">
        <!-- begin panel -->
        <div class="panel">
          <!-- begin panel-body -->
        <div class="panel-body text-center"> 
          <form method="post" action=""  enctype="multipart/form-data" id="import"> 
            <div class="form-group">
              <div class="upload-msg"></div>
              <input type="file" name="file" id="file">
            </div>
            <a href="items_template.csv" download="items_template"><i class="fa fa-file-excel" style="color: green;"></i> Download template</a> 
          </form>
        </div>
        <div class="panel-footer text-right"> 
          <button type="submit" id="priview" class="btn btn-primary btn-xs" onclick="priview();">Preview Data Before Upload</button>
          <button type="submit" id="submit-gen" class="btn btn-lime btn-xs" onclick="imp();">Upload</button>
        </div>
        <!-- end panel-body -->
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-6 -->
    <!-- begin col-6 -->
    <div class="col-md-12 panel text-center" id="results"> </div>
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
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript" src="../../assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js" charset="utf-8"></script>
<script src="../../assets/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
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
<script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>  
<script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/select2/dist/js/select2.min.js"></script>
<script>
  $(document).ready(function() {
    App.init();
  });
  <?php include("prods.js");?>
</script> 

</body>

</html>

 