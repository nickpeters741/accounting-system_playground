<?php 
require("../clude/head.php");
$no=0;
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);  
$shop = $row['shop'];
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
    <div class="row" >
      <!-- begin col-8 -->
      <div class="col-md-12">
        <div class="panel panel-inverse" data-sortable-id="index-1" style="margin-top: 10px;">
          <div class="panel-heading"> 
            <div class="pull-right">
              <Button href="#modal" class="btn btn-sm btn-lime pull-right" data-toggle="modal" id="new-prod" ><i class="fa fa-plus"></i> &nbsp;Add Produce</Button> &nbsp; &nbsp; &nbsp; &nbsp;
              <Button href="#modal" class="btn btn-sm btn-lime pull-center" data-toggle="modal" id="re-stock" ><i class="fa fa-check"></i> &nbsp;Re- Stock</Button> &nbsp; &nbsp; &nbsp; &nbsp;
            </div>
            <h4 class="panel-title">Output Inventory</h4>
          </div>
          <div class="panel-body">  
            <?php
            $lpo = mysqli_query($connection,"SELECT * FROM kp_production_items ") or die("Could not fetch the Items ");
            if (mysqli_num_rows($lpo) < 1) {
              echo "There are no items in the system at the moment";
            }else{
            ?>
            <table id="data-table-combine" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>StockCode</th> 
                  <th>Name</th>  
                  <th>Stock</th> 
                </tr>
              </thead>
              <tbody>
                <?php
                while ($row = mysqli_fetch_assoc($lpo)) {
                  $item_id = $row['item_id'];
                  $stock_code = $row['stock_code'];
                  $name = $row['name'];
                  $wprice = $row['wprice']; 
                  $sprice = $row['sprice'];
                  $stock = $row['qty'];
                  $bprice = $row['bprice'];
                  
                  $no=$no+1;
                  ?>
                  <tr> 
                    <td><?php echo $stock_code; ?></td>
                    <td><?php echo $name; ?></td> 
                    <td><?php echo  $stock; ?></td> 

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
    </div>
<!-- end #content -->
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
    <script type="text/javascript"> 
      <?php include("prods.js");?>
    </script>  
  </body>   
<script>

  $(document).ready(function() {
    App.init();
    TableManageCombine.init();
    $(document).on('click','#invoice', function(e){ 
      var uid = $(this).data('id'); // get id of clicked row  
      $('#load').html(''); // leave this diff blank 
      console.log(uid)
      $.ajax({
        url: 'gen_inv.php',
        typr: 'GET',
        data: 'id='+uid,
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    });

      $(document).on('click','#view', function(e){ 
      var uid = $(this).data('id'); // get id of clicked row  
      $('#load').html(''); // leave this diff blank 
      console.log(uid)
      $.ajax({
        url: 'lpo_items.php',
        typr: 'GET',
        data: 'id='+uid,
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    });
  }); 
</script> 
</body>
</html>
  
