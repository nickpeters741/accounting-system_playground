<?php 
require("../clude/head.php");
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id']; 

if (empty($po_id) OR $po_id==0) {
  header("Location: po_pending.php");
}elseif (empty($grn_id) OR $grn_id==0) {
  header("Location: init_rec.php?id=$po_id");
}else{}
  $folder="back/kugura/";
  thesion_page($folder);
  $url="../../";
  $action="LOADED RECEIVING PAGE FOR PO NO | ".$po_id;
  logs($action,$url);

  $no=0;
?>
 
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed"> 
  <!-- begin #sidebar -->
  <?php 
  require("../clude/header.php");

  //require("../clude/menu.php");
  ?>
  <!-- end #sidebar -->
<!-- begin #content -->
<div id="contents" class="contents"> 
  <?php
      if (isset($_GET['msg'])) {
        if ($_GET['msg'] == 6) {
          ?>
          <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert"> &times; </a>
					   <strong>Approved !</strong> Requisition updated Succesfully.
					</div>
          <?php
        }elseif ($_GET['msg'] == 2){
          ?>
          <div class="alert alert-lime col-md-6" >
            <a href="#" class="close" data-dismiss="alert">&times;</a>
					   <strong>Stock</strong> was updated Succesfully.
					</div>
          <?php
            }
          }
          ?>
            <!-- begin row -->
      <div class="row">
        <!-- begin col-6 -->
        <div class="col-md-7">
          <div class="panel  panel-purple " data-sortable-id="index-1">
            <div class="panel-heading">
              <div class="panel-heading-btn"> 
                <a href="po_pending.php" class="btn  btn-warning btn-xs pull-right "  ><i class="fa fa-pause"></i>&nbsp;PAUSE </a>
                <a href="po_rec_sheet.php" class="btn  btn-purple btn-xs pull-right "><i class="fa fa-print"></i>&nbsp;PRINT R-SHEET</a>
              </div>
              <p style="color:white;">VIEW TO RECEIVE PURCHASE ORDER NO: <?PHP echo $po_id; ?> </p>
            </div>
            <div class="panel-body" onload=""> 
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr >
                        <th><small>Item Name</small></th> 
  						      	  <th><small>Order Qty</small></th>
  						      	  <th><small>Price</small></th>
  						      	  <th><small>Total</small></th>
  						      	  <th><small>Received Qty</small></th>
                        <th><small>Received Price</small></th>
                        <th><small>Received Total</small></th>  
							          <th>Action</th>		       
							      </tr>
                  </thead>
                 <tbody>
                    <?php
                     update_po($po_id);
                       $po_items = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id'");
                         if (mysqli_num_rows($po_items) < 1) {
                          $update_status = mysqli_query($connection,"UPDATE kp_po SET rec_status=1,rec_staff = '$user_id',rec_date=CURRENT_DATE, stock_status=1  WHERE po_id='$po_id'") or die(mysqli_error($connection));
                         ?>
                          <script> location.replace("po_pending.php?msg=1"); </script>
                          <?php
                         }else{
                             while ($sa = mysqli_fetch_assoc($po_items)) {
                              $item_id = $sa['item_id']; 
                    ?>
                  <tr>
                    <td><?php echo get_item($item_id); ?></td>
                    <td><?php echo $sa['qty']; ?></td>
                    <td><?php echo $sa['price']; ?></td>
                    <td><?php echo $sa['total']; ?></td>
                    <td><?php echo $sa['rec_qty']; ?></td>
                    <td><?php echo $sa['rec_price']; ?></td>
                    <td><?php echo $sa['rec_total']; ?></td> 
                    <td>
                      <?php if ($sa['rec_status']==2) {
                       ?> <button data-toggle="modal" data-target="#rec-modal" data-id="<?php echo $po_id; ?>" data-id2="<?php echo $item_id; ?>" id="receive"  class="fa fa-md btn btn-purple btn-xs">Receive</button>
                       <?php
                      }else{ 
                         
                          ?>
                           <p style="color: green;">RECEIVED</p>
                          <?php                       }
                      ?> 
                    </td>
                  </tr>
                  <?php
                    }
                  }
                  ?>
                </tbody>
              </table> 
            <?php
            $po_items = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id' AND rec_status=2");
              if (mysqli_num_rows($po_items) > 0) {
            ?>
            <!-- <a href="po_rec_all.php?id=<?php echo $po_id; ?>" class="btn btn-lime btn-xs pull-left">Receive All</a>  -->
            <?php
              } 
            ?>
               
          </div>
        </div>
      </div> 
      <div class="col-md-4">
          <div class="panel  panel-purple " data-sortable-id="index-1">
            <div class="panel-heading"> 
              <p style="color:white;">RECEIVED ITEMS IN GRN : <?PHP echo $grn_id; ?> </p>
            </div>
            <div class="panel-body" onload="">
              <div class="dataTable_wrapper">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr >
                        <th><small>Item Name</small></th> 
                        <th><small>Ordered Qty</small></th>
                        <th><small>Price</small></th> 
                        <th>Action</th>          
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                     update_po($po_id);
                       $po_items = mysqli_query($connection,"SELECT * FROM kp_grn_items WHERE grn_id='$grn_id'");
                         
                             while ($sa = mysqli_fetch_assoc($po_items)) {
                              $item_id = $sa['item_id']; 
                              $s2s = $sa['s2s']; 
                    ?>
                  <tr>
                    <td><?php echo get_item($item_id); ?></td>
                    <td><?php echo $sa['qty']; ?></td>
                    <td><?php echo $sa['price']; ?></td>  
                    <td>
                      <?php 
                      if ($s2s==1) {
                        ?>
                        <p style="color: green;">COMPLETE</p>
                        <?php
                      }else{
                        ?>
                        <a type="button" class="btn btn-warning btn-xs " data-toggle="modal" data-target="#rec-modal" data-id="<?php echo $po_id; ?>" data-id2="<?php echo $item_id; ?>" id="send">Add to Stock</a> 
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
            <?php
            $po_items = mysqli_query($connection,"SELECT * FROM kp_grn_items WHERE grn_id='$grn_id' AND s2s=2");
              if (mysqli_num_rows($po_items) < 1) {
            ?>
             <a  data-toggle="modal" data-target="#rec-modal" id="finito" class="btn btn-lime btn-xs pull-left">FINISH RECEIVING</a> 
            <?php
              } 
            ?>
               
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div  id="rec-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" id="rec-load"> </div>
</div>   
 <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../assets/crossbrowserjs/html5shiv.js"></script>
    <script src="../assets/crossbrowserjs/respond.min.js"></script>
    <script src="../assets/crossbrowserjs/excanvas.min.js"></script>
  <![endif]-->
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
   
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== --> 
   
  <script>
    $(document).ready(function() {
      App.init(); 
      $(document).on('click','#finito', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          var item = $(this).data('id2'); // get id of clicked row  
          $.ajax({
            url: 'finito_mod.php',
            typr: 'POST',
            data: 'id='+uid+'&item='+item,
            dataType: 'html'
        })
          .done(function(data){ 
          $('#rec-load').html(''); // blank before load.
          $('#rec-load').html(data);
          
        })
          .fail(function(){
            $('#rec-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
          });
        });
    }); 
  </script>
  <script type="text/javascript"> 
    function assign(id){
      $.ajax({
        url: '../../gen/assign_store_items.php',
        typr: 'POST',
        data: 'id='+id,
        dataType: 'html'
      })
      .done(function(data){
        $('#rec-load').html(''); // blank before load.
        $('#rec-load').html(data);
      })
      .fail(function(){
        $('#rec-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    } 
</script>
  <script type="text/javascript">
      $(document).ready(function() {
        $(document).on('click','#receive', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          var item = $(this).data('id2'); // get id of clicked row  
          $.ajax({
            url: 'po_item_rec.php',
            typr: 'POST',
            data: 'id='+uid+'&item='+item,
            dataType: 'html'
        })
          .done(function(data){ 
          $('#rec-load').html(''); // blank before load.
          $('#rec-load').html(data);
          
        })
          .fail(function(){
            $('#rec-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
          });
        });
         $(document).on('click','#send', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          var item = $(this).data('id2'); // get id of clicked row  
          $.ajax({
            url: 'to_stock.php',
            typr: 'POST',
            data: 'id='+uid+'&item='+item,
            dataType: 'html'
        })
          .done(function(data){ 
          $('#rec-load').html(''); // blank before load.
          $('#rec-load').html(data);
          
        })
          .fail(function(){
            $('#rec-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
          });
        });
      });
    </script> 
</body>
</html>
    

