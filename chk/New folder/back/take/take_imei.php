<?php
include("../../inc/connection.php");
include("../clude/funcs.php");
include('../../inc/gen_funcs.php'); 
$item_id = $_REQUEST['item_id'];
$qty = $_REQUEST['qty'];

$day = $_REQUEST['day'];
$con_imei = mysqli_query($connection,"UPDATE kp_items_imei SET adj_status=2  WHERE item_id='$item_id' AND status=2") or die(mysqli_error($connection));


?>
<div class="modal-content" >
  <div class="modal-header"> 
    <h5 class="modal-title">
      <i class="fa fa-stats"></i> SCAN <?php echo $qty; ?> IMEI FOR <?php echo get_item($item_id); ?>
    </h5>
  </div> 
  <div class="modal-body" >
    <div id="imei-results"></div>
    <div class="form-group "> 
      <div class="col-md-12">
       <input class="form-control" type="text" id="scanned-imei" placeholder="scan/scan imei number......" />
      </div>
    </div>
    <div id="received"></div>
  </div>
  <div class="modal-footer"> 
    <button type="submit" id="btn-finish" class="btn btn-warning pull-right btnSubmit" onclick="fin();">FINISH</button>
  </div>
</div> 
<script type="text/javascript"> 
function confirmedimei(){ 
  var item='<?php echo $item_id; ?>'; 
  $('#received').empty();  
  $.ajax({
      url: 'taken_imeis.php',
      typr: 'POST',
      data: 'id='+item,
      dataType: 'html'
    })
    .done(function(data){  
      $('#received').html(''); // blank before load.
      $('#received').html(data);
    })
    .fail(function(){
      $('#received').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
}

function fin(){  
        var day = '<?php echo $day; ?>'; 
        $.ajax({
          url: 'take_act.php',
          typr: 'POST',                           
          data: 'qty='+qty+'&id='+item_id+'&day='+day+'&func=2',
          dataType: 'html'
        })
        .done(function(data){ 
        console.log(data); 
        $('#modal').modal('toggle');
            $.ajax({
              type: "GET",
              url: 'fetchitems.php',
              data: { },
              success:  function(data) {
                $('#id').append(data); 
              }
            });  
            $('#results').html(''); // blank before load.
            $('#results').html(data);
            $("#qty").val('');
            $("#qty").focus();
            load_items();
        })
        .fail(function(){
            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
        });
    }

$(document).ready(function() {
  $("#scanned-imei").focus();
  confirmedimei(); 
  $(document).keydown(function(e) { 
    var item='<?php echo $item_id; ?>';
    var imei=$("#scanned-imei").val();
    var code= (e.keyCode ? e.keyCode : e.which); 
    if(code==13) {  
      $('#imei-results').html('test');
      $.ajax({
        url: 'take_imei_act.php',
        typr: 'POST',
        data: 'imei='+imei+'&item='+item,
        dataType: 'html'
      })
      .done(function(data){  
        $("#scanned-imei").val(''); 
        $("#scanned-imei").focus();
        confirmedimei();    
        $('#imei-results').html(data);
      })
    }
  });
});
</script> 