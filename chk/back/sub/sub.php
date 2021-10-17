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
                <Button href="#sub-modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="sub-add" ><i class="fa fa-plus"></i> &nbsp;NEW CATEGORY</Button> &nbsp; &nbsp; &nbsp; &nbsp;
          
               </div>
              
							<h4 class="panel-title">CATEGORY LIST</h4>
             	</div>
						<div class="panel-body">
							 <?php
                  $get_category = mysqli_query($connection,"SELECT * FROM kp_sub_cat") or die("Could not get any items");
                  if (mysqli_num_rows($get_category ) < 1) {
                    echo "There are no registered categories in the database";
                  }else{
                ?>
                <table id="data-table-combine" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Category Id</th>
                                        <th>Category Name</th>
                                        <th>Department</th>
                                        <th>Cat Code</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                while ($row = mysqli_fetch_assoc($get_category)) {
                                  $sub_id = $row['sub_id'];
                                  $sub_name=$row['name'];                                
                                ?>
                                    <tr>
                                       <td><?php echo $sub_id; ?></td>
                                        <td><?php echo $sub_name; ?></td>
                                        <td><?php echo get_cat($row['cat_id'] ); ?></td>
                                        <td><?php echo $row['code']; ?></td>
                                        <td>
                                          <a data-toggle="modal" data-target="#sub-modal" data-id="<?php echo $sub_id; ?>" id="sub-edit" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a>
                                          |&nbsp;
                                          <a data-toggle="modal" data-target="#sub-modal" data-id="<?php echo $sub_id; ?>" id="sub-del" class="btn btn-xs btn-danger"><i  class=" fa fa-times"></i></a>
                                          
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
<div  id="sub-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="sub-load"></div>
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
    <?php include("sub_cat.js");?>
  </script>   
  </body>
</html> 
        


    

        