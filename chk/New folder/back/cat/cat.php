<?php 
require("../clude/head.php");
$no=0;
 $folder="back/cat/";
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
                <!-- begin col-6 -->
			    <div class="col-lg-12">
			        <!-- begin panel -->
                    	<div class="panel panel-inverse" data-sortable-id="index-1">
						<div class="panel-heading"> 
               <div class="pull-right">
                <Button href="#cat-modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="cat-add" ><i class="fa fa-plus"></i> &nbsp;ADD DEPARTMENT</Button> &nbsp; &nbsp; &nbsp; &nbsp;
          
               </div>
              
							<h4 class="panel-title">DEPARTMENT LIST</h4>
             	</div>
						<div class="panel-body">
							 <?php
                  $get_category = mysqli_query($connection,"SELECT * FROM kp_category") or die("Could not get any items");
                  if (mysqli_num_rows($get_category ) < 1) {
                    echo "There are no registered categories in the database";
                  }else{
                ?>
                <table id="data-table-combine" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>DEPARTMENT ID</th>
                                        <th>DEPARTMENT NAME</th>
                                        <th>DEPARTMENT CODE</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                while ($row = mysqli_fetch_assoc($get_category)) {
                                  $cat_id = $row['cat_id'];
                                  $cat_name=$row['name'];
                                  $code=$row['code'];                                
                                ?>
                                    <tr>
                                      <td><?php echo $cat_id; ?></td>
                                      <td><?php echo $cat_name; ?></td>
                                      <td><?php echo $code; ?></td>
                                        <td>
                                          <a data-toggle="modal" data-target="#cat-modal" data-id="<?php echo $cat_id; ?>" id="cat-edit" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a>
                                          |&nbsp;
                                          <a data-toggle="modal" data-target="#cat-modal" data-id="<?php echo $cat_id; ?>" id="cat-del" class="btn btn-xs btn-danger"><i  class=" fa fa-times"></i></a>
                                          
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
<div  id="cat-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="cat-load"></div>
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
    <?php include("cat.js");?>
  </script>   
  </body>
</html> 
        


    

        