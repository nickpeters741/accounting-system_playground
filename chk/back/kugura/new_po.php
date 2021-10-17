<?php 
require("../clude/head.php");
$no=0;
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 

if ($po_id==0) {
  header("Location: init_page.php");
}else{
  $folder="back/kugura/";
  $page= $folder.basename($_SERVER['PHP_SELF']);  
  $create_thesion= mysqli_query($connection,"UPDATE kp_thesion SET current_page='$page',datime=CURRENT_TIMESTAMP WHERE user_id='$user_id'") or die(mysqli_error($connection));
  $action="LOADED PURCHASE ORDER PAGE FOR | ".$po_id;
  $url="../../";
  logs($action,$url);
}
?> 
  <style type="text/css">
    .contents{
      margin: 5px;
    }
    input[type="radio"]{
    margin-right: 5px;
  }
  </style>
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
  ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
  
  <!-- end #sidebar -->
 
<div id="contents" class="contents">
  <div class="form-group row">
    <!-- START COL-MD-8 -->
    <div class="col-md-8">
      <div class="panel panel-inverse" data-sortable-id="index-1">
        <div id="results"></div>
        <div class="panel-body"> 
         <!--  <form role="form" id="sales_form" > -->
            <div class="form-group row">
              <div class="col-md-3"> 
                <div class="input-group mb-3 input-group-xs">
                <div class="input-group-prepend">
                  <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modal" id="new-item" onclick="quick_item();"><i class='fa fa-lg fa-plus' ></i></a>
                </div> 
                <select type="text" class="selectpicker form-control form-control-xsl col-lg-12"  id="item_id" name="items" style="width: 80%;"> </select>
              </div>
            </div> 
            <!-- <div class="col-md-2"> 
              <select type="text" class="selectpicker form-control form-control-xs" id="uom_id" name="uom_id">  
              </select>
            </div> -->
            <!-- <div class="col-md-2 col-lg-2"> 
              <input id="qty" type="text" placeholder="Quantity"  class="form-control form-control-xs">
            </div>
            <div class="col-md-2 col-lg-2"> 
              <input id="price" type="text" class="form-control form-control-xs" placeholder="Price" >
            </div>
            <div class="col-md-2 col-lg-2"> 
              <input id="total" type="text" class="form-control form-control-xs" placeholder="Total" >
            </div>
            <div class="col-md-1"> 
            <a  onclick="btnSubmitForm();" value="Add Item" class="btn btn-purple btn-xs" ><i class='fa fa-lg fa-plus' ></i></a>
          </div> -->
          <div class="col-md-2 col-lg-2"> 
              <input id="qty" type="text" placeholder="Quantity"  class="form-control">
            </div>
            <div class="col-md-2 col-lg-2"> 
              <input id="price" type="text" onkeyup="get_price();" class="form-control" placeholder="Price" >
            </div>
            <div class="col-md-2 col-lg-2"> 
              <input id="total" type="text" onkeyup="get_total();" class="form-control" placeholder="Total" >
            </div>
            <div class="col-md-1"> 
              <a  onclick="btnSubmitForm();" value="Add Item" class="btn btn-primary btn-xs" ><i class='fa fa-lg fa-plus' ></i> ADD</a>
            </div>
          </div> 
        <!-- </form> -->
        <div id="panelChart3" class="panel" style="margin-top: 10px;">
          <div id="d1"> </div> 
          </div> 
        </div> 
      </div> 
    </div>
    <!-- end col-md-8-->
    <!-- start col-md-4-->
    <div class="col-lg-4">
      <form  id="sup_form" method="POST">
        <div class="panel panel-inverse ">
        <!-- <div class="panel-heading">
          <h4 class="panel-title">ITEMS BELOW REORDER LEVEL</h4>
        </div> -->
         <div class="panel-body">
           <div>
              <label style="font-size: 18px; color: orange;">SELECT SUPPLIER FOR PO NO: <?php echo $po_id; ?></label>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <a class="btn btn-warning" data-toggle="modal" data-target="#modal" id="new-sup"><i class='fa fa-lg fa-plus' ></i></a> 
                </div> 
                <select type="text" class="selectpicker form-control col-lg-12" name="sup_id" id="sup_id" data-size="10" data-live-search="true" onchange="sup();" style="width: 80%;"> </select>
              </div>
            </div>

         <!--    <div class="">
          <ul class="list-group">
            <li class="list-group-item global-discount-group">
              <div class="pull-left" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>Summary Discount:</b></div>
              <div class="pull-right">
                <input type="text" class="form-control" name="disc" id="disc" value="0" onkeyup="clear_tax();" />
              </div>
            </li>
          </ul> 
          </div> <br> -->
          <div class="row" > 
              <div class="col-md-6">
              <ul class="list-group">
            <li class="list-group-item global-discount-group" style="height: 150px"> 
                <div class="row">
                  <label style="text-align: center; color: #6FD64B; font-size: 18px;">TAX:</label>
                  <div class="radio col-md-12">
                    <label><input type="radio" name="tax" value="0" checked id="none">None</label>
                  </div>
                  <div class="radio col-md-12">
                    <label><input type="radio" name="tax" value="1">Inclusive</label>
                  </div>
                  <div class="radio col-md-12">
                    <label><input type="radio" name="tax" value="2">Exclusive</label>
                  </div>
                </div>
              </li>
            </ul>
              </div>
              <div class="col-md-6">
                <ul class="list-group">
                  <li class="list-group-item global-discount-group" style="height: 150px;">
                    <div class="row" id="div-perc" style="display: none;">
                      <label style="text-align: center; color: #6FD64B; font-size: 18px;">%:</label>
                      <div class="radio col-md-12">
                        <label><input type="radio" name="perc" id="perc" value="1" checked>16%</label>
                      </div>
                      <div class="radio col-md-12">
                        <label><input type="radio" name="perc" id="perc" value="2">Others</label>
                        <input type="text" class="form-control" name="others" id="perc-input" onkeyup="tax_perc();" />
                      </div> 
                    </div>
                  </li>
                </ul>
              </div>
            </div> 
          </div>
          <div class="">
            <ul class="list-group">
              <li class="list-group-item global-discount-group"> 
                <div class="pull-left" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>VATABLE:</b>&nbsp;<b id="vatable"></b></div>
                <div class="pull-right" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>VAT:</b>&nbsp;<b id="vatt">0</b></div> 
              </li>
              <li class="list-group-item global-discount-group"> 
                <div class="pull-left" style="text-align: center; color: #6FD64B; font-size: 22px;"><b>TOTAL:</b>&nbsp;<b id="tt"></b></div> 
              </li>
            </ul> 
          </div>
          <div class="panel-footer" style="height: 50px;">
            <a data-toggle="modal" data-target="#modal" id="cancel-po" onclick="$('#modal-load').html(''),cancel();"  class="btn btn-danger btn-xs pull-left btnSubmit">CANCEL</a>
            &nbsp;&nbsp;
            <a data-toggle="modal" data-target="#modal"  id="print-po" onclick="$('#modal-load').html(''),confirm_po();" class="btn btn-lime btn-xs pull-right btnSubmit" style="display: none; margin-left: 10px;">SUBMIT PO</a>
            &nbsp;&nbsp;
            <a data-toggle="modal" data-target="#modal" id="hold-po" onclick="$('#modal-load').html(''),hold();" style="margin-left: 10px;"  class="btn btn-warning btn-xs pull-left btnSubmit">HOLD</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div> 
      
    </div> 
    <!-- end col-md-4-->
  </div>
</div>
<!-- end content -->
<div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" id="load"> 
  </div>
</div>
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

  <script src="../../assets/js/apps.min.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  <!-- ================== END BASE JS ================== --> 

  <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 


  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
  <!-- ================== END PAGE LEVEL JS ================== --> 
  <script src="kugura.js"></script>
 
</body>
</html>

