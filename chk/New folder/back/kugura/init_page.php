<?php 
include("../clude/head.php");
 $folder="back/kugura/";
  thesion_page($folder); 
 ?>
<body>
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
			    <div class="col-lg-5">
                    <!-- begin panel --> 

                     <div class="panel">
                      <div class="panel-heading"> 
                        <div class="pull-right">
                          <a data-toggle="modal" data-target="#modal" name="new-po" id="new-po" class="btn btn-lime btn-xs pull-right">NEW PO</a>
                        </div>
                        <h4 class="panel-title">ONGOING PURCHASE ORDERS</h4>
                      </div>
                      <div class="panel-body"> 
                         <table  class="table table-bordered">
                <thead>
                  <tr> 
                    <th>PO ID</th>   
                    <th>USER</th> 
                    <th>DATIME</th>  
                    <th>ACTION</th>
                 </tr>
              </thead>
              <tbody>
                <?php
                $get_items = mysqli_query($connection,"SELECT * FROM kp_po_status") or die(mysqli_error($connection));
                while ($oow = mysqli_fetch_assoc($get_items)) { 
                    $po_id = $oow['po_id'];   
                    $user_id=$oow['po_user_id'];  
                    $po_status=$oow['po_status']; 
                    $datime=$oow['datime'];   
                  ?>
                  <tr>
                    <td><?php echo $po_id; ?></td> 
                    <td><?php echo get_user($user_id); ?></td> 
                    <td><?php echo $datime; ?></td> 
                    <td>
                      <?php 
                      if ($_SESSION['user_id']==$user_id OR empty($user_id) OR $user_id==0) {
                      ?>
                      <a href="init_po.php?id=<?php echo $po_id; ?>&cont=3" style="margin-left: 10px;" type="button"  name="filter" class="btn btn-purple btn-xs">CONTINUE</a>  
                      <?php
                      } 
                      ?>
                    </td>
                  </tr>
                <?php
                }
                ?>
              </tbody>  
          </table>
                      </div>
                    </div>
                </div>
                <!-- end col-6 -->
                <div class="col-md-7">
                  <!-- begin panel -->
                  <div class="panel panel-inverse">
                  <div class="panel-heading"> 
                    <h4 class="panel-title">TODAY'S PURCHASE ORDERS</h4>
                  </div>
                  <!-- begin panel-body -->
                  <div class="panel-body ">
                    <table id="data-table-combine" class="table table-striped table-bordered">
                      <thead>
                        <tr> 
                          <th>Order Number</th> 
                          <th>Supplier</th>
                          <th>Order By</th>
                          <th>Total Price</th>
                          <th>Date</th> 
                          <th>Status</th>                                       
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                  <?php
                  $pending_orders = mysqli_query($connection,"SELECT * FROM kp_po WHERE ord_date=CURRENT_DATE") or die("Could not fetch the purchase orders");
                  if (mysqli_num_rows($pending_orders) < 1) {
                    ?>
                    <tr>
                      <td colspan="7">There are no raised Purchase orders today</td>
                    </tr>
                    <?php 
                  }else{ 
                    while ($row = mysqli_fetch_assoc($pending_orders)) { 
                      $id = $row['po_id'];
                      $sup_id = $row['sup_id']; 
                      $user_id = $row['ord_user'];
                      $rec_status = $row['rec_status'];  
                      $stock_status = $row['stock_status']; 
                      $ord_date = $row['ord_date'];
                      ?>
                      <tr> 
                        <td><?php echo $id; ?></td> 
                        <td><?php echo get_sup($sup_id); ?></td>
                        <td><?php echo get_user($user_id); ?></td>
                        <td><?php echo po_total($id); ?></td>
                        <td><?php echo $ord_date; ?></td>
                        <td>
                          <?php 
                          if ($rec_status==2) {
                            echo "PENDING RECEIVE";
                          }elseif ($rec_status==1 AND $stock_status==2) {
                            echo "PENDING SEND TO STORE";
                          }elseif ($rec_status==1 AND $stock_status==1) {
                            echo "COMPLETELY PROCESSED";
                          } ?>
                        </td>
                        <td class="with-btn-group" nowrap>
                          <div class="btn-group">
                            <a href="#" class="btn btn-warning btn-xs width-60" style="color: white;">Actions</a>
                            <a href="#" class="btn btn-warning btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                            <span class="caret"  style="color: white;"></span>
                            </a>
                            <ul class="dropdown-menu pull-right" style="background-color: purple;">
                              <li><a href="../kugura/init_rec.php?id=<?php echo $id; ?>">Receive Items</a></li>
                              <li><a href="../../print/po_print.php?po_id=<?php echo $id; ?>">Re-print</a></li>
                              <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $id; ?>" id="view"  >View Order</a></li> 
                            </ul>
                          </div>
                        </td>
                      </tr>
                      <?php
                    }
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>  
      </div>
    </div>
  </div>
  <!-- end page container -->
  <div id="ret-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" id="ret-load"> </div>
  </div>
	 
<!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/apps.min.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  <!-- ================== END BASE JS ================== --> 

  <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 

  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
  <!-- ================== END PAGE LEVEL JS ================== -->

 <!--  <script src="../../assets/js/demo/general_scripts.js"></script> -->
<script>
    $(document).ready(function() {
      App.init(); 
      $(document).on('click','#new-po', function(e){       
      $.ajax({
        url: 'confirm_new.php',
        typr: 'POST',
        data: {},
        dataType: 'html'
      })
      .done(function(data){ 
        $('#load').html(''); // blank before load.
        $('#load').html(data); 
      })
      .fail(function(){
        $('#sup_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again... NOT LOADING PAGE'); 
      });
    });
  });
</script>
 
</body>
</html>