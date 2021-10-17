<?php 
$sale_id = $_REQUEST['id'];
$type = $_REQUEST['type'];
$act = $_REQUEST['act'];
if ($act=='CANCEL') {
  $function="cancel()";
}elseif ($act=='REPRINT') {
  $function="reprint()";
}
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">AUTHORISE <?php echo $act; ?> ORDER NO <?php echo $sale_id; ?></h4>
	</div>
	<div class="modal-body">
  <div id="cancel-results"></div> 
  <p style="color:red;">Remember Voiding an order means cancellation of all requistion that deducted inventory, return of all items,  also deduction of Salesperson sales</p> 
     <div class="form-group">
        <label >Supervisor's Password</label> *
        <input type="password" class="form-control "  id="pin" name="pin"/>
        <p style="color:red; display: none" id="error-name"> </p>
      </div>
    </div>
    <div class="modal-footer">
      <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
      <button type="button" id="btn-cancel" class="btn btn-sm btn-success" onclick="<?php echo $function; ?>">Submit</button>
    </div>
  </div> 
  <script type="text/javascript">
function cancel(){  
  var name = $("#pin").val();
  var sale_id = '<?php echo $sale_id; ?>'; 
  $.ajax({
    url: 'cancel_act.php',
    typr: 'POST',                           
    data: 'name='+name+'&sale_id='+sale_id,
    dataType: 'html'
  })
  .done(function(data){  
    $('#cancel-results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
function reprint(){  
  var name = $("#pin").val();
  var sale_id = '<?php echo $sale_id; ?>'; 
  $.ajax({
    url: 'reprint_act.php',
    typr: 'POST',                           
    data: 'name='+name+'&sale_id='+sale_id,
    dataType: 'html'
  })
  .done(function(data){  
    $('#cancel-results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
  </script>