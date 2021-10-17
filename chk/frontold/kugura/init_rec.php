<?php 
include("../clude/head.php"); 
$po_id=$_GET['id'];
 $folder="back/kugura/";
  thesion_page($folder);
 ?>
<body>
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #menu -->
    <?php include("../clude/header.php") ?>
    <!-- end #menu -->
    <!-- begin #content -->
    <div id="contents" class="contents" style="margin: 5px;">
      <!-- begin row -->
      <div class="row">
        <!-- begin col-6 -->
        <div class="col-lg-4">
          <!-- begin panel --> 
          <div class="panel panel-purple">
            <div class="panel-heading"> 
              <div class="pull-right">
                <a data-toggle="modal" data-target="#modal" name="new-rec" id="new-rec" class="btn btn-lime btn-xs pull-right">START RECEIVING</a>
              </div> 
              <h3 class="panel-title">ON GOING  RECEIVING FOR PURCHASE ORDER NO <?php echo $po_id; ?></h3>
            </div>
            <div class="panel-body"> 
              <table  class="table table-bordered">
                <thead>
                  <tr> 
                    <th>REC ID</th>   
                    <th>USER</th> 
                    <th>DATIME</th>  
                    <th>Action</th>  
                 </tr>
                </thead>
                <tbody>
                  <?php
                  $get_items = mysqli_query($connection,"SELECT * FROM kp_grn_status WHERE po_id='$po_id'") or die(mysqli_error($connection));
                  while ($oow = mysqli_fetch_assoc($get_items)) { 
                      $grn_id = $oow['grn_id'];   
                      $user_id=$oow['user_id'];   
                      $po_id=$oow['po_id'];  
                      $datime=$oow['datime'];   
                    ?>
                    <tr>
                      <td><?php echo $grn_id; ?></td> 
                      <td><?php echo get_user($user_id); ?></td> 
                      <td><?php echo $datime; ?></td>  <td>
                      <?php 
                      if ($_SESSION['user_id']==$user_id OR empty($user_id) OR $user_id==0) { 
                      ?>
                      <a href="init_rec_act.php?gid=<?php echo $grn_id; ?>&cont=3&id=<?php echo $po_id; ?>" style="margin-left: 10px;" type="button"  name="filter" class="btn btn-purple btn-xs">CONTINUE</a>  
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
        <!-- begin col-6 -->
        <div class="col-lg-4">
          <!-- begin panel --> 
          <div class="panel panel-purple">
            <div class="panel-heading">  
              <h3 class="panel-title">RECEIVING LIST FOR PURCHASE ORDER NO <?php echo $po_id; ?></h3>
            </div>
            <div class="panel-body"> 
              <table  class="table table-bordered">
                <thead>
                  <tr> 
                    <th>GRN ID</th>   
                    <th>USER</th> 
                    <th>DATIME</th>   
                 </tr>
                </thead>
                <tbody>
                  <?php
                  $get_items = mysqli_query($connection,"SELECT * FROM kp_grn WHERE po_id='$po_id'") or die(mysqli_error($connection));
                  while ($oow = mysqli_fetch_assoc($get_items)) { 
                      $grn_id = $oow['grn_id'];   
                      $user_id=$oow['user_id'];  
                      $datime=$oow['datime'];   
                    ?>
                    <tr>
                      <td><?php echo $grn_id; ?></td> 
                      <td><?php echo get_user($user_id); ?></td> 
                      <td><?php echo $datime; ?></td>  
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
        <div class="col-md-4">
          <!-- begin panel -->
          <div class="panel panel-purple">
            <div class="panel-heading"> 
                        
              <h3 class="panel-title">ITEMS WAITING RECEIVING</h3>
            </div>
            <!-- begin panel-body -->
            <div class="panel-body ">
              <table id="data-table-combine" class="table table-striped table-bordered">
                <thead>
                  <tr> 
                    <th>No</th>
                    <th>ITEM</th>  
                    <th>ORDERED QTY</th> 
                    <th>RECEIVED QTY</th> 
                    <th>BALANCE</th>    
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $no=0;
                  $pending_orders = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id'") or die("Could not fetch the purchase orders");
                  if (mysqli_num_rows($pending_orders) < 1) {
                    ?>
                    <tr>
                      <td colspan="7">ALL ITEMS HAVE BEEN RECEIVED</td>
                    </tr>
                    <?php 
                  }else{ 
                    while ($row = mysqli_fetch_assoc($pending_orders)) { 
                      $id = $row['item_id'];  
                      $qty = $row['qty'];  
                      $rec_qty = $row['rec_qty']; 
                      $no=$no+1;
                      ?>
                      <tr> 
                        <td><?php echo $no; ?></td>
                        <td><?php echo get_item($id); ?></td> 
                        <td><?php echo $qty; ?></td>
                        <td><?php echo $rec_qty; ?></td>
                        <td><?php echo $qty-$rec_qty; ?></td>  
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
  <div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" id="load"> </div>
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
    $(document).on('click','#new-rec', function(e){ 
      var id='<?php echo $po_id; ?>';      
      $.ajax({
        url: 'confirm_rec.php',
        typr: 'POST',
        data: {id:id},
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