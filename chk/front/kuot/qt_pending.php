<?php 
require("../clude/head.php");
$no=0;
$user_id = $_SESSION['user_id'];
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
        
           <div class="row" style="padding: 10px;">
              <div class="col-md-3">
                <select type="text" class="selectpicker form-control col-lg-12"  id="item_id" name="items" data-size="10" data-live-search="true" style="width: 80%;"> 
                  <option value="0">-----SELECT FILTER</option> 
                  <option value="*">ALL</option>
                  <option value="1">Pending</option>
                  <option value="2">Received </option> 
                </select>
              </div>
              <button type="submit" style="background-color: purple;"><i class="fa fa-search" style="color: white;"></i></button>
       <!--        <h4 class="panel-title" style="color: purple;">QUOTATIONS LIST</h4> -->
            </div>
          <div class="panel-body">  
            <?php
            $po = mysqli_query($connection,"SELECT * FROM kp_qt WHERE  shop='$shop'") or die("Could not fetch the purchase orders");
            if (mysqli_num_rows($po) < 1) {
              echo "There are no purchase orders in the system at the moment";
            }else{
            ?>
            <table id="data-table-combine" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th>Quote No:</th> 
                  <th>Customer</th> 
                  <th>Raised By</th>
                  <th>Date</th> 
                  <th>Amount</th> 
                  <th>VAT</th>
                  <th>Total</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                while ($row = mysqli_fetch_assoc($po)) {
                  $qt_id = $row['qt_id'];
                  $cust_id = $row['cust_id'];
                  $user_id = $row['user_id']; 
                  $date = $row['day'];
                  $amount = $row['amount'];
                  $vatable = $row['vatable'];
                  $vat = $row['vat'];
                  $no=$no+1;
                  ?>
                  <tr> 
                    <td><?php echo $qt_id; ?></td>
                    <td><?php echo get_cust($cust_id); ?></td>
                    <td><?php echo get_user($user_id); ?></td> 
                    <td><?php echo  $date; ?></td> 
                    <td><?php echo  $amount; ?></td> 
                    <td><?php echo  $vat; ?></td> 
                    <td><?php echo  $vatable; ?></td>
                    <!-- <td><a type="button" class="btn  waves-effect waves-light btn-info btn-sm " href="qt_view.php?qt_id=<?php echo $qt_id; ?>">View</a></td> -->
                       <td class="with-btn-group" nowrap>
                        <div class="btn-group">
                          <a href="#" class="btn btn-warning btn-xs width-60" style="color: white;">Actions</a>
                          <a href="#" class="btn btn-warning btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                          <span class="caret"  style="color: white;"></span>
                          </a>
                          <ul class="dropdown-menu pull-right" style="background-color: purple;">
                            <li><a href="qt_print.php?id=<?php echo $qt_id; ?>" style="color: white;">Re-print</a></li>
                            <li><a data-toggle="modal" data-target="#modal" data-id="<?php echo $qt_id; ?>" id="gensale" style="color: white;">Generate Sale</a></li> <!----> 
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
   
<script>
  $(document).ready(function() {
    App.init();
    TableManageCombine.init();

     $(document).on('click','#gensale', function(e){
        var id = $(this).data('id');  
        $.ajax({
          url: 'gensale.php',
          data: 'id='+id,
          typr: 'POST',
          dataType: 'html'
        })
        .done(function(data){ 
          $('#load').html(''); // blank before load.
          $('#load').html(data);
        })
        .fail(function(){
          $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
          $('#modal-loader').hide();
        });
      });

  }); 
</script> 
</body>
</html>
  
        