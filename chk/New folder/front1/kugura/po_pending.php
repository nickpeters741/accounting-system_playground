<?php 
require("../clude/head.php");
$no=0;
$user_id = $_SESSION['user_id'];  
$folder="back/kugura/";
$page= $folder.basename($_SERVER['PHP_SELF']);  
$create_thesion= mysqli_query($connection,"UPDATE kp_thesion SET po_id=0,current_page='$page',datime=CURRENT_TIMESTAMP WHERE user_id='$user_id'") or die(mysqli_error($connection));
$action="LOADED PENDING POS PAGE FOR | ";
$url="../../";
logs($action,$url);
?>
<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<link href="../../assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/plugins/DataTables/extensions/Buttons/css/buttons.bootstrap.min.css" rel="stylesheet" />
<link href="../../assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" /> 
<link href="../../assets/plugins/DataTables/extensions/ColReorder/css/colReorder.bootstrap.min.css" rel="stylesheet" /> 
<link href="../../assets/plugins/DataTables/extensions/RowReorder/css/rowReorder.bootstrap.min.css" rel="stylesheet" /> 
<!-- ================== END PAGE LEVEL STYLE ================== --><!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed"> 
  <!-- begin #sidebar -->
<?php 
  require("../clude/header.php");

  require("../clude/menu.php");
?>
  <!-- end #sidebar -->
<!-- begin #content -->
<div id="content" class="content">
  <!-- begin row -->
  <div id="stats"></div>
  <?php
  if (isset($_GET['msg'])) {
    if ($_GET['msg'] == 1) {
      ?>
      <div class="alert alert-success">
        <p>Receiving And Sending to store finished</p>
      </div>
    <?php
    }
  }
  ?>
			
            <!-- /.row -->
			<div class="row" >
				<!-- begin col-8 -->
                <div class="col-md-12">
                    <div class="panel panel-purple" data-sortable-id="index-1" style="margin-top: 10px;">
                      
                        <div class="panel-heading">
                            <h4 class="panel-title" style="color: white;"><b>PENDING PURCHASE ORDERS LIST</b></h4>
                        </div>                       
                        <div class="panel-body">
                        <p id="results"></p><?php
                        $po = mysqli_query($connection,"SELECT * FROM kp_po WHERE rec_status=2 OR stock_status=2") or die("Could not fetch the purchase orders");
                        if (mysqli_num_rows($po) < 1) {
                            echo "There are no purchase orders in the system at the moment";
                        }else{
                        ?>
                          <table id="data-table-combine" class="table table-striped table-bordered">

                                <thead>
                                    <tr>
                                        <th>No:</th>
                                        <th>PO No.</th>
                                        <th>Supplier</th> 
                                        <th>Placed By</th>
                                        <th>Date</th>                                        
                                        <th>Action</th>
                                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                               
                                while ($row = mysqli_fetch_assoc($po)) {
                                    $po_id = $row['po_id'];
                                    $sup_id = $row['sup_id'];
                                    $ord_user= $row['ord_user']; 
                                    $date = $row['ord_date'];
                                    $no=$no+1;
 
                                    ?>
                                    <tr>
                                        <td><?php echo $no; ?></td>
                                        <td><?php echo $row['po_id']; ?></td>
                                        <td><?php echo get_sup($sup_id); ?></td>
                                        <td><?php echo get_user($ord_user); ?></td> 
                                        
                                                                        
                                        <td><?php echo  $date; ?></td>
                                        <td><a type="button" class="btn  waves-effect waves-light btn-info btn-xs" onclick="view_this(<?php echo $po_id; ?>);">Receive Items</a></td>
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
                <!-- end col-8 -->
			</div>
			<!-- end row -->
		</div>
		
   <script type="text/javascript">
    function view_this(id){ 
    window.location.href = 'init_rec.php?id='+id;
    }                      
   </script>
   
		<!-- end #content -->
	 <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
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
  </script> 
</body>
</html>
  
        