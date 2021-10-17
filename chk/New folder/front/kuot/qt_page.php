<?php 
require("../clude/head.php");
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$qt_id = $row['qt_id'];
$cust_id = $row['cust_id'];
$no=0;
?>

<script type="text/javascript">

</script>
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
  ?>
  <!-- end #header -->   
  <!-- begin #sidebar -->
  <?php 
    //require("../clude/menu.php");
  ?>
  <!-- end #sidebar -->
 
<div id="contents" class="contents" style="margin:5px;">
  <div class="row">
    <!-- START COL-MD-8 -->
    <div class="col-md-8">
      <div class="panel panel-inverse" data-sortable-id="index-1"> 
        <div id="results"></div>
        <div class="panel-body">
          <form role="form" id="sales_form" >
            <div class="form-group row">
              <div class="col-md-4"> 
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <a class="btn btn-warning" data-toggle="modal" data-target="#quick-modal" id="quick-item"><i class='fa fa-lg fa-plus' ></i></a>   
                  </div> 
                  <select type="text" class="selectpicker form-control col-lg-12"  id="item_id" name="items" data-size="10" data-live-search="true" style="width: 80%;"> 
                    <?php 
                    
                      $items = mysqli_query($connection,"SELECT * FROM kp_items ");
                      while ($row = mysqli_fetch_assoc($items)){
                        ?>
                        <option value="<?php echo $row['item_id']; ?>"><?php echo strtoupper($row['stock_code']." ".$row['name']); ?></option>
                        <?php
                      }
                      
                    ?>
                  </select>
                </div>
              </div> 
              <div class="col-md-2 col-lg-3"> 
                <input id="qty" type="text" placeholder="Quantity"  class="form-control">
              </div>
              <div class="col-md-2 col-lg-3"> 
                <input id="price" type="text" class="form-control" placeholder="Price" >
              </div>
              <div  class="col-md-2 col-lg-2">
                <button   onclick="btnSubmitForm();"   type="button" id="btnSubmit" value="Add Item" class="btn btn-warning" >ADD</button>
              </div>
            </div> 
        </form>
        <div id="panelChart3" class="panel" style="margin-top: 10px;">
          <div id="d1"> </div> 
        </div> 
      </div> 
    </div>
  </div>

    <!-- end col-md-8-->

  <div class="col-lg-4" >
    <!-- begin panel -->
    <div class="panel paper-cut  col-md-12">
      <div class="panel-heading row"> 
        <div class="col-md-3 text-center" >
          <button type="button"  data-toggle="modal"data-target="#modal" id="hold" class="btn btn-sm btn-warning">HOLD</button>
        </div>
        <div class="col-md-4 text-center" style="height: 40px; padding: 10px 15px; border-right: 1px solid #eee;">
          <h6>QUOTE NO :<br><b><?php echo $qt_id; ?></b></h6> 
        </div>
        <div class="col-md-4 text-center" style="height: 40px; padding: 10px 15px;">
          <a  data-toggle="modal"data-target="#modal" id="customer" onclick="$('#load').html('');cust_change()"> 
            <h6 id="custo">CUSTOMER:<br> <b><?php echo get_cust($cust_id); ?></b></h6> 
          </a>
        </div>   
      </div>
      <div class="panel-body"> 
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
              <div class="col-md-12 m-t-5">
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
            </div>
      </div>
      <div class="panel-footer"  style="height: 50px;">
        <a  data-toggle="modal" data-target="#modal"  id="raise-qt" class="btn btn-purple btn-xs pull-right" onclick="raise_quote();">Raise Quote</a> 
        <a data-toggle="modal" data-target="#modal" id="cancel_btn" class="btn btn-danger btn-xs pull-left"> CANCEL</a> 
      </div>
    </div> 
    <div class="panel col-md-12">
      <div class="panel-heading">
        <h4 class="panel-title">CUSTOMER QUOTATIONS</h4>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead> 
            <tr> 
              <th>Quote No:</th>
              <th>Date</th>
              <th>Amount</th>
              <th>Raised By</th>
              <th>Status</th>
              <th>ACTION</th>
            </tr>
          </thead>
          <tbody>
              <?php
                $get_qty = mysqli_query($connection,"SELECT * FROM kp_qt WHERE cust_id='$cust_id' ORDER BY qt_id DESC") or die("Could not get Items below reorder level");
                  while ($row = mysqli_fetch_array($get_qty)) {
                    $user_id=$row['user_id'];
                    $amount=$row['amount'];
                    $status=$row['status'];
                    $qt_id=$row['qt_id'];
                    $qt_date=$row['day'];
                    $no=$no+1;
              ?>
            <tr>
              <td><?php echo $qt_id; ?></td>
              <td><?php echo $qt_date; ?></td>
              <td><?php echo $amount; ?></td>
              <td><?php echo get_user($user_id); ?></td> 
              <td><?php echo $status; ?></td>
               <td><?php echo "action"; ?></td>  
            </tr>
              <?php 
                }
              ?>
          </tbody>
        </table>
      </div>
    </div>
  </div> 
</div>
</div>
<!-- end content -->
<div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load" style="padding: 10px;"> </div>
</div>
<div  id="modal2" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load2" style="padding: 10px;"> </div>
</div>

<div  id="qt-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title"><i class="fa fa-stats"></i> &nbsp;&nbsp;Confirm Quotaton</h4>
      </div> 
     
      <div class="modal-body">
        <div class="row">
          <div class="alert alert-danger">
            <p>WARNING!! This action is irreversible and will delete currently placed orders.</p>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">No</button> 
        <a href="#" class="btn btn-lime pull-right" onclick="print_quote();">Yes</a> 
      </div>
    </div>
  </div>
</div> 
<!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/plugins/gritter/js/jquery.gritter.js"></script>
  <script src="../../assets/js/apps.min.js"></script>
  <!-- <script src="../../assets/js/theme/default.min.js"></script>
  ================== END BASE JS ================== --> 

 
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/select2/dist/js/select2.min.js"></script> 
 
 <script>
  function load_items(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","../kuot/qt_items.php",false);
    xmlhttp.send(null);
    document.getElementById("d1").innerHTML = xmlhttp.responseText;
    document.getElementById("d1").style.visibility = "visible";
    qt_total();
  } 
  function qt_total(){ 
    var total=$('#ttt').html(); 
    $('#tt').html(total); 
  }
  function tax_perc(){
    var vat_type=$('input[name="tax"]:checked').val();
    var perc= $('#perc-input').val();
    var total =$('#ttt').html();
    var disc= 0;
    total=total-disc;
    var add=parseInt(100) + parseInt(perc);
    if (vat_type==1) {
      //inclusive 
      var multi=parseInt(perc)/add; 
      var vat=parseInt(total)*multi;
      var vatt=vat.toFixed(2);
      var vatable=total- vatt;
      var vatable=vatable.toFixed(2);
      var tt=total;
    } else if (vat_type==2){
      //exclusive 
      var multi=parseInt(add)/100;
      var vat= total *multi;
      var vatt=  vat - total ;
      var vatt=vatt.toFixed(2);
      var vatable= total ;
      var tt=vat.toFixed(2);
    }  
    $('#vatable').html(vatable); 
    $('#vatt').html(vatt);
    $('#tt').html(tt);  
  } 
  function clear_tax(){
    $("#none").click();
    var total =$('#ttt').html();
    var disc= $('#disc').val();
    total=total-disc;
    $('#tt').html(total);
  }
  function btnSubmitForm() {
    var item_id = $("#item_id").val();
    var quantity = $("#qty").val();
    var price = $("#price").val();
    $.post("../kuot/qt_action.php", { item_id: item_id, quantity: quantity ,price : price },
    function(data) {
      $('#results').html(data);
      $('#sales_form')[0].reset();
      load_items(); 
    });
  }
  function raise_quote(){
    var disc= 0;
    var vatable= $('#vatable').html(); 
    var vatt= $('#vatt').html();
    var perc= $('#perc-input').val();
    var cust = <?php echo $cust_id; ?>; 
    var tt= $('#tt').html();
    if (cust==0) {
      var hulla = new hullabaloo();
        hulla.send('Warning!!! Customer Cannot be Empty', "warning");
        $('#modal').modal('toggle');
    }else if (tt==0) {
      var hulla = new hullabaloo();
        hulla.send('Warning!!! Sale Cannot be Empty', "warning");
        $('#modal').modal('toggle');
    }else{
      $.ajax({
        url: 'confirm_modal.php',
        type: 'POST',
        data: {disc:disc,vatable:vatable,vatt:vatt,tt:tt,perc:perc,cust:cust},
        dataType: 'html'
      })
      .done(function(data){ 
        $('#load').html(data); // blank before load.
      })
      .fail(function(){ 
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      });
    }
  }
  // function print_quote() {
  //   var cust_id = $("#cust_id").val(); 
  //   var samount=document.getElementById("ttt").innerHTML;  
  //   if (samount==0) {
  //     var hulla = new hullabaloo();
  //     hulla.send('Warning!!! Sale Cannot be Empty', "warning");
  //     $('#qt-modal').modal('toggle');  
  //   } else {
  //     $.post("../kuot/qt_place.php", { cust_id: cust_id },
  //     function(data) {
  //       $('#results').html(data); 
  //     });
  //   }
  // }
  function cust(){
    var cust = document.getElementById("cust_id").value;
    if(cust>0){ 
      document.getElementById("print-qt").style.display = "block";
    }else{
      document.getElementById("print-qt").style.display = "none";
    }
  }
function del_this(item_id){
  $.ajax({
    url: 'del_item.php',
    type: 'POST',
    data: 'item_id='+item_id,
    dataType: 'html'
  })
  .done(function(data){
    load_items();
  })
  .fail(function(){
    //console.log("Fail To Delete");
    $('#d1').html(''); // blank before load.
    $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function cust_change(){  
  $('#load').html('');   
  $.ajax({
      url: 'cust_change.php',
      typr: 'POST',
      data: '',
      dataType: 'html'
    })
    .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
    .fail(function(){
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    }); 
}

  $(".selectpicker").select2();

  $.fn.get_cust = function(){ 
    $('#cust_id').empty();
    $.ajax({
      type: "GET",
      url: '../../gen/get_cust.php',
      // Your creation of the data object is incorrect
      data: { },
      success:  function(data) {
        // Here just append the straight data
        $('#cust_id').append(data);
      }
    });
  }
  $(document).ready(function() {
    App.init();
    load_items(); 
    $.fn.get_cust();
    $('.selectpickers').select2({
        dropdownParent: $('#sup-modal')
    });
    $('input[name="tax"]').click(function() { 
      var total =$('#ttt').html();
      var vat=0;
      if($(this).val() == '0') {
        $('#div-perc').hide();  
        $('#vat').val(0);
        $('#tt').html(total);
        $('#total').val(total); 
        $('#vatable').html(''); 
        $('#vatt').html('');
        $('#perc-input').val(0); 
        $('#vatable').html(0); 
        $('#vatt').html(0);
      }else if($(this).val() == '1'){ 
        $('#div-perc').show();
        $('#others').prop("disabled", true);
        $('#vatable').html(0); 
        $('#vatt').html(0);
        $('#others').prop("disabled", true);
        $('#perc-input').val(16);  
        $('#perc-input').prop("disabled", true);
        tax_perc();
      }else if($(this).val() == '2'){   
        $('#div-perc').show();
        $('#others').prop("disabled", true);
        $('#vatable').html(0); 
        $('#vatt').html(0); 
        $('#others').prop("disabled", true);
        $('#perc-input').val(16);  
        $('#perc-input').prop("disabled", true);
        tax_perc();
      }
    });

    $('input[name="perc"]').click(function() {
      if($(this).val() == '1') {
        $('#others').prop("disabled", true);
        $('#perc-input').val(16);  
        $('#perc-input').prop("disabled", true);
        tax_perc();     
      }else{ 
        $('#vatable').html(0); 
        $('#vatt').html(0);
        $('#perc-input').val(0);
        $('#others').prop("disabled", false);
        $('#perc-input').prop("disabled", false);  
      }
    }); 
    $(document).on('click','#hold', function(e){  
      $('#gen-load').html(''); 
      $.ajax({
        url: 'hold_modal.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){ 
        $('#load').html(''); // blank before load.
        $('#load').html(data);
      })
      .fail(function()
      {
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
    $(document).on('click','#cancel_btn', function(e){  
      $('#gen-load').html(''); 
      $.ajax({
        url: 'cancel_modal.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){ 
        $('#load').html(''); // blank before load.
        $('#load').html(data);
      })
      .fail(function()
      {
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
    $(document).on('click','#btnsup_save', function(e){
      var  name = $('#sup_name').val();
      var  alias = $('#sup_alias').val(); 
      var loc = $('#sup_loc').val(); 
      var phone = $('#sup_phone').val();
      var address = $('#sup_address').val();    
      $.ajax({
        url: '../kugura/sup_act.php',
        typr: 'POST',
        data: 'name='+name+'&alias='+alias+'&loc='+loc+'&phone='+phone+'&pin='+pin+'&vat='+vat+'&address='+address,
        dataType: 'html'
      })
      .done(function(data){
        $('#sup_result').html(''); // blank before load.
        $('#sup_result').html(data);
        console.log(data);
         $("#sup_form").trigger('reset');
        $('#sup_result').empty(); 
        $('#supModal').modal('toggle');
        $.fn.get_sup();
      })
      .fail(function(){
        $('#sup_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    }); 
    $.fn.inputFilter = function(inputFilter) { 
      return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
        if (inputFilter(this.value)) {
          this.oldValue = this.value;
          this.oldSelectionStart = this.selectionStart;
          this.oldSelectionEnd = this.selectionEnd;
        } else if (this.hasOwnProperty("oldValue")) {
          this.value = this.oldValue;
          this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        }
      });
    };
    $("#qty").inputFilter(function(value) {
      return /^\d*$/.test(value); 
    });
    $("#price").inputFilter(function(value) {
      return /^\d*$/.test(value); 
    });
  }); 
  </script>
  
</body>
</html>

