<?php 
require("../clude/head.php");
$no=0;
 $folder="back/invent/";
  thesion_page($folder);
?>
 <style type="text/css">



</style>
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

     function store($store,$store_id)
    {  
    $arr = explode(', ',$store);  
    if (in_array($store_id, $arr)) {
    } 
    }
  ?>
  <!-- end #sidebar -->
    <!-- begin #content -->
		<div id="content" class="content">
			<!-- begin row -->
			<div class="row">
        <div id="results"></div>
        <!-- begin col-12 -->
        <div class="col-lg-12">
          <!-- begin panel -->
          <div class="panel panel-inverse" data-sortable-id="index-1">
            <div class="panel-heading">  
              <h4 class="panel-title">PRODUCT LIST</h4>
            </div>
            <div class="panel-body">
              <?php
              $get_items = mysqli_query($connection,"SELECT * FROM kp_items") or die("Could not get any items");
              if (mysqli_num_rows($get_items ) < 1) {
                echo "There are no registered items in the database";
              }else{
                ?>
                <table id="data-table-combine" class="table table-striped table-bordered">
                  <thead>
                    <tr> 
                    <th>ITEM CODE</th>                                   
                      <th>ITEM NAME</th>   
                      <th>TOTAL QTY</th>
                      <th>REORDER LEVEL</th>
                      <th>Action</th>  
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                    foreach ($get_items  as $row) {
                      $no=$no+1; 
                      ?>
                        <tr> 
                          <td class="code" style="width: 100px;" ><?php echo $row['stock_code']; ?></td>
                          <td class="name" ><?php echo $row['name']; ?></td>  
                          <td class="qty" style="width: 80px;"   id="qty<?php echo $row["item_id"]; ?>" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['qty'];?></td>
                          <td class="reorder" style="width: 80px; background-color:#FF0000; color: white;"   id="reorder<?php echo $row["item_id"]; ?>" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['reorder'];?></td>
                       <td class="with-btn-group" nowrap>
                            <div class="btn-group" style="margin: 1px;">
                                <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                                <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                  <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                  <li><a href="#stock-modal" data-toggle="modal" data-id="<?php echo $row["item_id"]; ?>" id="stock-adj" style="color: purple;">Adjust Quantity</a></li>
                                  <li><a href="#stock-modal" data-toggle="modal" data-id="<?php echo $row["item_id"]; ?>" id="re-adj" style="color: purple;">Adjust Reorder</a></li>
                                  
                                <ul>
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
<div  id="stock-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="stock-load"></div>
</div>
</div>
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
    <?php include("inve.js");?>
  </script>   
  </body>
</html> 
        


    

        
        