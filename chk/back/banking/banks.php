<?php 
include("../clude/head.php"); 
$folder="back/cat/";
thesion_page($folder);
$no=0;
?>
<body> 
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
                <Button href="#modal" class="btn btn-xs btn-lime pull-right" data-toggle="modal" id="bank-add" ><i class="fa fa-plus"></i> &nbsp;NEW BANK</Button> &nbsp; &nbsp; &nbsp; &nbsp;
          
               </div>
              
							<h4 class="panel-title">BANK LIST</h4>
             	</div>
						<div class="panel-body">
							 <?php
                  $get_category = mysqli_query($connection,"SELECT * FROM kp_banks WHERE del_status=2") or die("Could not get any items");
                  if (mysqli_num_rows($get_category ) < 1) {
                    echo "There are no registered Banks in the database";
                  }else{
                ?>
                <table id="data-table-combine" class="table table-striped table-bordered">
                  <thead>
                      <tr>
                          <th>Name</th>
                          <th>Bank</th>
                          <th>Branch</th>
                          <th>Acc Number</th>
                          <th>Location</th>
                          <th>Balance</th>
                          <th>Action</th>
                      </tr>
                  </thead>
                  <tbody>
                      <?php
                  while ($row = mysqli_fetch_assoc($get_category)) {                                 
                  ?>
                      <tr>
                         <td><?php echo $row['acc_name']; ?></td>
                         <td><?php echo $row['bank_name']; ?></td>
                          <td><?php echo $row['branch']; ?></td>
                          <td><?php echo $row['acc_no']; ?></td>
                          <td><?php echo $row['location']; ?></td>
                          <td id="bank<?php echo $row["bank_id"]; ?>"><?php echo $row['bal']; ?></td>
                          <td>
                            <div class="btn-group">
                              <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                              <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu pull-right">
                                <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $row["bank_id"]; ?>" id="bank-edit">Edit Bank</a></li>
                                <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $row["bank_id"]; ?>" id="bank-del">Close Account</a></li>
                                <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $row["bank_id"]; ?>" id="bank-trans">Transfer Money</a></li>
                                <!-- <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $row["bank_id"]; ?>" id="bank-adj">Bank History</a></li> --> 
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
                <!-- end col-6 -->


            </div>
            <!-- end row -->
		</div>
		<!-- end #content -->

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
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
  <script>
    $(document).ready(function() {
      App.init();
      TableManageCombine.init();
    });
    <?php include("bank.js");?>
  </script>   
  </body>
</html> 

        