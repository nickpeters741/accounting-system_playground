<?php 
  require("../clude/head.php");
  $folder="back/prods/";
  thesion_page($folder);
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
    <div class="panel panel-default hidden-print col-md-12" style="margin-bottom: 1px;">
      <div class="panel-body p-5"> 
        <div class="form-group row">
          <div class="col-md-12 pull-right"> 
            <a href="#modal" data-toggle="modal" class="btn btn-xs btn-lime m-3 pull-right" id="prods-add" >NEW PRODUCT&nbsp;<i class="fa fa-plus"></i></a>
            <a href="items_import.php" id="import"  name="filter" class="btn btn-primary btn-xs  m-3 pull-right">IMPORT</a> 
            <a href="#modal" data-toggle="modal" id="del"  name="filter" class="act_btn btn btn-danger btn-xs  m-3 pull-right">Discontinue</a>
            <a href="#modal" data-toggle="modal" id="tax"  name="filter" class="act_btn btn btn-info btn-xs  m-3 pull-right">Change Tax</a>  
            <a href="#modal" data-toggle="modal" id="sub_cat"  name="filter" class="act_btn btn btn-purple btn-xs  m-3 pull-right">Change Sub Category</a> 
            <a href="#modal" data-toggle="modal" id="cat"  name="filter" class="act_btn btn btn-yellow btn-xs  m-3 pull-right">Change Category</a> 
          </div> 
        </div>
      </div>
    </div> 
    <div class="panel panel-default hidden-print col-md-12" style="margin-bottom: 1px;">
      <div id="panel-body" class="p-5">
        <table id="data-table-combine" class="table table-striped table-bordered">
          <thead>
            <tr>
              <th><input type="checkbox" name="checkAll" class="checkAll">All</th>
              <th>Item ID</th>
              <th>Stock Code</th>                                    
              <th>Name</th>
              <th>Category</th>  
              <th>Sub Category</th>  
              <th>Buying Price</th>
              <th>Base Price</th>  
              <th>Distributor Price</th>
              <th>Wholesale Price</th>
              <th>Selling Price</th> 
              <th>Stock</th>   
              <th>UOM</th>  
              <th>Tax</th>
              <th>Breaks Bulk</th>
              <th>Pieces</th> 
              <th>Bulk Item</th> 
              <th>Barcode</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
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
<script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript">

$(document).ready(function() { 
  App.init(); 
  showRecords();   
});
<?php include("prods.js");?>
</script>  
</body>
</html>
  
        