<?php include("../clude/head.php"); 
$user_id = $_SESSION['user_id'];
$folder="front/return/"; 
thesion_page($folder);
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];

$stotal=0;
if ($ret_id==0 OR empty($ret_id)) {
      header("Location:return.php");  
   }
 ?>
<body>
    <!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
        <!-- begin #menu -->
        <?php include("../clude/header.php") ?>
    <!-- end #menu -->
        <!-- begin #menu -->
        <?php //include("../includes/menu.php") ?>
		<!-- end #menu -->
    <!-- begin #content -->
		<div id="contents" class="contents" style="margin: 10px;">
      <!-- begin row -->
      <div class="row">
        <!-- begin col-6 -->
        <div class="col-md-6">
          <!-- begin panel -->
                     <!--<div class="panel panel-inverse" data-sortable-id="form-validation-2">
                      <div class="panel-body row"> 
                        <div id="div-imei" class="col-md-12"></div>
                        <div class="col-md-6">  
                            <input type="text" name="filter-imei" id="filter-imei" class="form-control" autofocus="true" placeholder="SCAN IMEI"> 
                        </div> 
                          <div id="filt-btn" class="col-md-2" style="display: none;"> 
                            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#ret-modal" id="btn-imei"  >Return</button>
                          </div>
                      </div>
                    </div>-->
          <!-- begin panel -->
          <div class="panel">
            <div class="panel-heading"> 
              <h4 class="panel-title">SALE ITEMS ON SALE ID: <?PHP echo $sale_id; ?></h4>
            </div>
            <!-- begin panel-body -->
            <div class="panel-body ">
              <table  class="table table-bordered">
                <thead>
                  <tr>
                  <!-- <th>Imei</th>   -->
                    <th>Item Name</th> 
                    <th>Qty</th>
      <th>Ret_Qty</th>
                    <th>Price</th>
                    <th>Total</th>   
                    <th>Action</th>
                 </tr>
              </thead>
              <tbody>
                <?php
                $get_items = mysqli_query($connection,"SELECT * FROM kp_sale_items WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
                while ($row = mysqli_fetch_assoc($get_items)) { 
                    $item_id = $row['item_id'];
                    $qty=$row['qty']; 
                    $imei=$row['imei'];
                    $price=$row['price'];
                    $total=$qty*$price;
                    $stotal=$stotal+$total;
                    $ret_status=$row['ret_status'];
                     
                    $get_returned= mysqli_query($connection,"SELECT sum(qty) as qty FROM kp_ret_items WHERE sale_id='$sale_id' AND item_id='$item_id'");
                    $tow = mysqli_fetch_assoc($get_returned); 
                    $rqty=$tow['qty'];
                  ?>
                  <tr>
                     <!-- <td><?php echo $imei; ?></td>--->
                    <td><?php echo get_item($item_id); ?></td>
                    <td><?php echo $qty; ?></td>
                    <td><?php echo $rqty; ?></td>
                    <td><?php echo $price; ?></td>
                    <td><?php echo $total; ?></td>
                    <?php
                    if ($ret_status==2) {
                       
                      ?>
                      <td> 
                        <button class="btn btn-xs btn-primary" data-toggle="modal" data-target="#ret-modal" data-id="<?php echo $sale_id; ?>" data-id2="<?php echo $item_id; ?>"  id="getItem" >Return</button>
                      </td>
                      <?php 
                    }else{
                      if ($rqty<$qty) {
                        ?> 
                         <td><button class="btn btn-xs btn-purple" data-toggle="modal" data-target="#ret-modal" data-id="<?php echo $sale_id; ?>" data-id2="<?php echo $item_id; ?>"  id="getItem" >Return</button> </td>
                      <?php
                      }else{
                      ?>
                        <td> <button class="btn btn-sm btn-warning">Returned</button></td>
                      <?php
                      }
                       }
                      ?> 
                  </tr>
                <?php
                }
                ?>
              </tbody> 
            <tfoot>
              <tr>
                <th colspan="4" class="text-center" style="color: black; font-size: 20px;">Total</th>
                <th style="color: black; font-size: 20px;"><?php echo $stotal; ?></th>
                <th></th>
              </tr>
            </tfoot>
          </table>
      </div>
      <!-- end panel-body --> 
  </div>
</div> 
<!-- begin col-6 -->
<div class="form-group col-md-6 row">
  <!-- begin panel --> 
  <div class="panel col-md-12">
    <div class="panel-heading"> 
        <h4 class="panel-title">RETURNED ITEMS RET ID: <?PHP echo $ret_id; ?></h4>
    </div>
    <!-- begin panel-body -->
    <div class="panel-body" id="returned"> </div>
     <div class="panel-footer">  
    <a data-toggle="modal" data-target="#ret-modal" id="cancel-po" onclick="ret_cancel();"  class="btn btn-danger btn-xs pull-left btnSubmit">CANCEL</a>
    &nbsp;&nbsp;
    <a data-toggle="modal" data-target="#ret-modal" id="sus-po" onclick="ret_hold();" style="margin-left: 10px;"  class="btn btn-warning btn-xs pull-left btnSubmit">HOLD</a>
    &nbsp;&nbsp;
    <!-- <a name="app-ret" id="note-print" class="btn btn-sm btn-success pull-right"  data-toggle="modal" data-target="#ret-modal" >PRINT NOTES</a> -->
    <a name="app-ret" id="app-ret" class="btn btn-xs btn-success pull-right"  data-toggle="modal" data-target="#ret-modal" >APPROVE</a>
  </div> 
  </div>
  <!-- end panel-body -->  
 
  <div class="panel col-md-12">
    <div class="panel-heading"> 
        <h4 class="panel-title">RETURNED ITEMS FROM THIS SALE</h4>
    </div>
    <!-- begin panel-body -->
    <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>IMEI</th>
          <th>ITEM</th>
          <th>RET ID</th>
          <th>APPROVAL DATE</th>
          <th>RETURN BY</th>
          <th>APPROVAL STATUS</th>
          <th>STOCK STATUS</th>
        </tr>
    </thead>
    <tbody>
      <?php
      $get_items = mysqli_query($connection,"SELECT * FROM kp_ret_items INNER JOIN kp_ret on kp_ret.ret_id=kp_ret_items.ret_id WHERE kp_ret_items.sale_id='$ret_id'") or die(mysqli_error($connection));
      while ($iow = mysqli_fetch_assoc($get_items)) { 
        $item_id=$iow['item_id'];
        $day=$iow['app_date'];
        $imei=$iow['imei'];
        $ret_id=$iow['ret_id'];
        $user_id=$iow['ret_user'];

        $app_status=$iow['app_status'];
        if ($iow['app_status']==2) {
          $app_status="APPROVED";
        }else{
          $app_status="NOT APPROVED";
        }
         
        if ($iow['store_status']==2) {
          $store_status="NOT ACCEPTED";
        }else{
          $store_status="ACCEPTED";
        }

      ?>
      <tr>
        <!-- <td><?php echo $imei; ?></td> -->
        <td><?php echo get_item($item_id); ?></td>
        <td><?php echo $ret_id; ?></td>
        <td><?php echo $day; ?></td>
        <td><?php echo get_user($user_id); ?></td>
        <td><?php echo $app_status; ?></td>
        <td><?php echo $store_status; ?></td>
      </tr>
      <?php
    }
    ?>
    </tbody>
    </table> </div>
  </div>
  <!-- end panel-body --> 
<div class="form-group"> </div>
  </div>
  <!-- end col-6  --> 
</div>
<!-- end ROW -->
</div> 
<!-- end #content -->
</div>
<!-- end page container -->

<div id="ret-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" id="ret-load"> </div>
</div>
<?php include("../clude/foot.php") ?>
   
<script type="text/javascript">
  
function del_ret_this(item_id){
  $.ajax({
    url: 'del_ret_item.php',
    type: 'POST',
    data: 'item_id='+item_id,
    dataType: 'html'
  })
  .done(function(data)
  { 
    ret_items();
  })
  .fail(function()
  {
    //
    $('#d1').html(''); // blank before load.
    $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function ret_hold(){
  $('#ret-load').html(''); // blank before load.
    $.ajax({
      url: 'trans_modal.php',
      type: 'POST',
      data: 'trans=HOLD',
      dataType: 'html'
    })
    .done(function(data){
      $('#ret-load').html(''); // blank before load.
      $('#ret-load').html(data); // blank before load.
    })
    .fail(function(){
      $('#ret-load').html(''); // blank before load.
      $('#ret-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }
function ret_cancel(){
  $('#ret-load').html(''); // blank before load.
    $.ajax({
      url: 'trans_modal.php',
      type: 'POST',
      data: 'trans=CANCEL',
      dataType: 'html'
    })
    .done(function(data){
      $('#ret-load').html(''); // blank before load.
      $('#ret-load').html(data); // blank before load.
    })
    .fail(function(){
      $('#ret-load').html(''); // blank before load.
      $('#ret-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }

function ret_items(){
  $('#ret-load').html(''); // blank before load.
    $.post("select_items.php", {},
      function (data) { 
          $('#returned').html(data); 
      });
  }
$(document).ready(function(){ 
  App.init();
  ret_items();

  // $(document).keydown(function(e) {
  //   var code = (e.keyCode ? e.keyCode : e.which);
  //   if(code==13) {  
  //     var imei= $("#filter-imei").val(); 
  //     $('#div-imei').html(''); // leave this diff blank 
  //     $.ajax({
  //       url: 'sale_imei.php',
  //       typr: 'POST',
  //       data: 'imei='+imei+'&id='+<?php echo $id; ?>,
  //       dataType: 'html'
  //     })
  //     .done(function(data){  
  //         $('#div-imei').html(data);  
  //     });
  // }
  // }); 
  $(document).on('click','#getItem', function(e){
    //$('#getItem').attr('disabled', 'disabled'); 
    $('#ret-load').html(''); // blank before load.
        var uid = $(this).data('id');
        var id = $(this).data('id2');  
            $('#ret-load').html('');
        $.ajax({
            url: 'ret_modal.php',
            typr: 'POST',
            data: 'id='+uid+'&it='+id,
            dataType: 'html'
        })
        .done(function(data){
          $('#ret-load').html(''); // blank before load.
            $('#ret-load').html(data);
        })
        .fail(function(){
            $('#ret-load').html('<i class="fa  fa-info-sign"></i> Something went wrong.....');
            $('#modal-loader').hide();
        }); 
    });

   

});
</script> 