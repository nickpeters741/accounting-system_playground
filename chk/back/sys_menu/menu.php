<?php 
require("../clude/head.php");
$no=0;
 if ($_GET['pnl']==1) {
  $title="BACK END MENUS";
}elseif ($_GET['pnl']==2) {
  $title="FRONT END MENUS";
}else{
$title="ERROR";
}
$panel=$_GET['pnl'];
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
			<!-- begin col-12-->
			<div class="col-lg-12">
				<!-- begin panel -->
				<div class="panel panel-inverse" data-sortable-id="form-validation-2">
					<!-- begin panel-heading -->
					<div class="panel-heading">
						<div class="panel-heading-btn">
							<a href="#modal" class="btn btn-sm btn-icon btn-circle btn-lime" data-toggle="modal" data-id="<?php echo $panel; ?>" id="new-menu" ><i class="fa fa-plus"></i></a>
						</div>
						<h4 class="panel-title"><?php echo $title; ?></h4>
                        </div>
                        <!-- end panel-heading -->
                        <!-- begin panel-body -->
                        <div class="panel-body">
                           <table id="data-table-combine" class="table table-striped table-bordered">
                                <thead>
                                	<tr>
                                		<th>Icon</th> 
                                		<th>Menu</th>
                                		<th>Level</th>
                                		<th>Sub</th>
                                		<th>Link</th>
                                		<th>Parent</th>
                                		<th>Action</th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<?php
					                    $get_menu = mysqli_query($connection,"SELECT * FROM kp_menu WHERE panel='$panel'");
					                    while ($mat = mysqli_fetch_assoc($get_menu)) {
					                    	$name=$mat['name'];
					                    	$menu_id=$mat['menu_id'];
					                    	$link=$mat['link'];
					                    	$level=$mat['level'];
					                    	$icon=$mat['icon'];
					                    	$parent=$mat['parent'];
					                    	$sub=$mat['sub'];
					                    	if ($sub==1) {
					                    		$sub="HAS SUB";
					                    		 
					                    	}else{
					                    		$sub="NO SUB";
					                    	}
					                ?>
                	<tr>
                		<td><i class="<?php echo $icon; ?>"></i></td>
                		<td><?php echo $name; ?></td>
                		<td><?php echo $level; ?></td>
                		<td><?php echo $sub; ?></td>
                		<td><?php echo $link; ?></td>
                		<td><?php echo $parent; ?></td>
                		<td>
                			<a data-toggle="modal" data-target="#modal" data-id="<?php echo $menu_id; ?>" id="edit" class="btn btn-xs btn-info"><i  class="fa fa-edit"></i></a> |&nbsp;
                			<a data-toggle="modal" data-target="#modal" data-id="<?php echo $menu_id; ?>" data-id2="<?php echo $panel; ?>" id="del-menu" class="btn btn-xs btn-danger"><i  class=" fa fa-trash"></i></a>
		                </td>
                	</tr>
                	<?php
                      }
                    ?> 
                </tbody>
            </table>
        </div>
        <!-- end panel-body --> 
    </div>
    <!-- end panel -->
</div>
<!-- end col-12 -->
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
  
  <script src="../../assets/plugins/gritter/js/jquery.gritter.js"></script>
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
  <script src="../../assets/plugins/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
  <script src="menu.js"> </script> 
</body>
</html>
 