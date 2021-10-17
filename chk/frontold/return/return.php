<?php 
    include("../clude/head.php"); 
    $user_id = $_SESSION['user_id'];
    $get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
    $row=mysqli_fetch_assoc($get_details);
    $dash = $row['dashboard'];


    $action="LOADED RETURN PAGE|-|-|-|-";
    logs($action,"../../"); 
?>
<body>
    <!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
        <!-- begin #header -->
    <?php include("../clude/header.php") ?>
    <!-- end #header -->
    <!-- begin #menu -->
    <?php //include("../includes/menu.php") ?>
    <!-- end #menu -->
        <!-- begin #content -->
		<div id="contents" class="contents"  style="margin: 10px;"> 
      <!-- begin row -->
      <div class="row">
        <!-- begin col-6 -->
        <div class="col-lg-5 col-md-5" style="margin-left: 10px" > 
          <div class="row">
            <!-- begin panel-body -->
            <div class="panel col-md-12" style="padding: 3px !important;">
              <div class="form-group row">
                <div class="form-group col-md-12" style="margin-bottom:1px;">
                  <a href="../dash/<?php echo $dash; ?>" name="filter" class="btn btn-purple btn-xs pull-right"><i class="fa fa-home"></i> HOME</a>
                </div>
                <div class="form-group col-md-12" >
                  <label>SEARCH BY</label> <br>  
                  <div class="radio radio-css radio-inline">
                    <input type="radio" name="search_by" id="ord" value="1"/>
                    <label for="ord" style="color:blue;">ORDER NUMBER</label>
                  </div>
                  <div class="radio radio-css radio-inline">
                    <input type="radio" name="search_by" id="cust" value="2"/>
                    <label for="cust"  style="color:blue;">CUSTOMER</label>
                  </div> 
                </div> 
                 <div class="form-group col-md-8" id="div-ord" style="display: none;">
                  <input type="text" name="ord" class="form-control" id="order" value="" placeholder="Order number/ref no" >
                </div>
                 <div class="form-group col-md-4" id="div-cust" style="display: none;">
                  <label class="sr-only" for="pick">Customer</label>
                    <select class="form-control selectpicker" id="cust_id" name="cust" style="width: 100%;">
                    <option>----SELECT CUSTOMER----</option> 
                    <?php
                    $cust = "SELECT * FROM kp_customers";
                    $cust_r = mysqli_query($connection,$cust) or die("Error getting categories");
                    while ($ct = mysqli_fetch_assoc($cust_r)) {
                      $name = $ct['name'];
                      $cust_id = $ct['cust_id'];
                      ?>
                      <option  value="<?php echo $cust_id; ?>"><?php echo $name; ?></option>
                      <?php
                      }
                      ?>
                    </select>
                </div>
                <div class="form-group col-lg-3" id="div-start" style="display: none;">
                  <label class="sr-only" for="pick">Date</label>
                  <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" id="day1" class="form-control">
                </div>
                <div class="form-group col-lg-3" id="div-end" style="display: none;">
                  <label class="sr-only" for="pick2">Date</label>
                  <input type="date" data-provide="datepicker" data-date-format="yyyy-mm-dd" id="day2" class="form-control">
                </div>
                <div class="form-group col-lg-1" id="div-submit" style="display: none;">
                  <button  type="button" onclick="submit_ord()" name="filter" class="btn btn-warning btn-md"><i class="fa fa-search"></i></button>
                </div>
                <div class="form-group col-lg-1" id="div-submit-cust" style="display: none;">
                  <button  type="button" onclick="submit_cust()" name="filter" class="btn btn-warning btn-md"><i class="fa fa-search"></i></button>
                </div>
              </div> 
            </div>
        <!-- end panel-bodyid="data-table-combine"  --> 
       
            <div class="panel col-md-12" id="filter_result"> 
                <table class="table table-striped table-bordered">
                <thead>
                  <tr> 
                    <th>RET ID</th> 
                    <th>SALE ID</th>  
                    <th>CUSTOMER</th>
                    <th>USER</th>  
                    <th>ACTION</th>
                 </tr>
              </thead>
              <tbody>
                <?php
                $get_items = mysqli_query($connection,"SELECT * FROM kp_ret_status") or die(mysqli_error($connection));
                while ($oow = mysqli_fetch_assoc($get_items)) { 
                    $ret_id = $oow['ret_id'];
                    $sale_id = $oow['sale_id'];
                    $cust_id=$oow['cust_id']; 
                    $user_id=$oow['user_id']; 
                  ?>
                  <tr>
                    <td><?php echo $ret_id; ?></td>
                    <td><?php echo $sale_id; ?></td>
                    <td><?php echo get_cust($cust_id); ?></td> 
                    <td><?php echo get_user($user_id); ?></td>  
                    <td>
                      <?php if ($_SESSION['user_id']==$user_id) {
                        ?>
                      
                     <a href="init_ret.php?cust_id=<?php echo $cust_id; ?>&id=<?php echo $sale_id; ?>" style="margin-left: 10px;" type="button"  name="filter" class="btn btn-warning btn-xs">CONTINUE</a>  <?php
                      } ?>
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
        <div class="col-lg-6 col-md-6" style="margin:1px;" >
           
                <div class="panel  panel-purple">
                    <div class="panel-heading"> 
                        <h4 class="panel-title">TODAY'S RETURNS</h4>
                    </div>
                    <div class="panel-body"> 
                        <table id="data-table-combine" class="table table-striped table-bordered">
                <thead>
                  <tr> 
                    <th>RET ID</th> 
                    <th>SALE ID</th>  
                    <th>CUSTOMER</th>
                    <th>USER</th>  
                 </tr>
              </thead>
              <tbody>
                <?php
                $get_items = mysqli_query($connection,"SELECT *,kp_sales.cust_id FROM kp_ret INNER JOIN kp_sales on kp_sales.sale_id=kp_ret.sale_id WHERE ret_date=CURRENT_DATE") or die(mysqli_error($connection));
                while ($oow = mysqli_fetch_assoc($get_items)) { 
                    $ret_id = $oow['ret_id'];
                    $sale_id = $oow['sale_id'];
                    $cust_id=$oow['cust_id']; 
                    $user_id=$oow['ret_user']; 
                  ?>
                  <tr>
                    <td><?php echo $ret_id; ?></td>
                    <td><?php echo $sale_id; ?></td>
                    <td><?php echo get_cust($cust_id); ?></td> 
                    <td><?php echo get_user($user_id); ?></td>  
                    
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
      </div>

            </div>
            <!-- end row -->
        </div>
		<!-- end #content -->
	</div>
    <!-- end page container -->

     <div id="ret-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" id="ret-load"> </div>
    </div>
    <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script> 
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../../assets/crossbrowserjs/html5shiv.js"></script>
    <script src="../../assets/crossbrowserjs/respond.min.js"></script>
    <script src="../../assets/crossbrowserjs/excanvas.min.js"></script>
  <![endif]-->
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== --> 
 
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== --> 
<script src="../../assets/plugins/select2/dist/js/select2.js"></script>  
<!-- ================== END PAGE LEVEL JS ================== -->
<!-- <script src="../scripts/sales.js"></script> -->
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
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
	 
   <script>
    $(document).ready(function() {
      App.init();
      TableManageCombine.init();

      $(".selectpicker").select2();
      $('input[name="search_by"]').change(function () {
        var fid=$(this).val(); 
        if (fid==1) { 
          document.getElementById('div-cust').style.display = 'none';
          document.getElementById('div-start').style.display = 'none';
          document.getElementById('div-end').style.display = 'none';
          document.getElementById('div-ord').style.display = 'block';
          document.getElementById('div-submit').style.display = 'block';
          document.getElementById('div-submit-cust').style.display = 'none';
           $('#filter_result').html('');
        }else if (fid==2) { 
          document.getElementById('div-cust').style.display = 'block';
          document.getElementById('div-start').style.display = 'block';
          document.getElementById('div-end').style.display = 'block';
          document.getElementById('div-ord').style.display = 'none';          
           document.getElementById('div-submit').style.display = 'none';
          document.getElementById('div-submit-cust').style.display = 'block';
                          $('#filter_result').html('');
        }  
      });
    }); 
 function submit_ord() {
            var ord = $("#order").val(); 
            $.post("ord_items.php", {ord: ord},
                function (data) {
                $('#filter_result').html(data); 
                });
        }
        function submit_cust() {
            var cust = $("#cust_id").val();
            var  start= $("#day1").val();
            var  end= $("#day2").val(); 
            $.post("cust_orders.php", {cust: cust,start: start,end: end},
                function (data) {
                $('#filter_result').html(data); 
                });
        }
 
    </script>
    </body>
</html>