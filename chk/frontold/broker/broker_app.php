<?php
  session_start();
  include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$item_id = $_REQUEST['item_id'];

$sup_id = $_REQUEST['sup'];
$qty = $_REQUEST['qty'];
$price= $_REQUEST['price'];
$action="LOADED|-|-|-|APPROVE MODAL FOR ".get_item($item_id)."|";
logs($action,"../../");  
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">AUTHORISE <?php echo get_item($item_id); ?> PURCHASE ON BROKER MODULE</h4>
	</div>
	<div class="modal-body">
  <div id="app-results"></div> 
  <p style="color:red;">Remember this action adds stock automatically and creates a grn..</p> 
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td><B>SUPPLIER</B></td>
        <td><?php echo get_sup($sup_id); ?></td>
      </tr>

      <tr>
        <td><B>QTY</B></td>
        <td><?php echo $qty ?></td>
      </tr>
      <tr>
        <td><B>Price</B></td>
        <td><?php echo $price ?></td>
      </tr>
    </tbody>
  </table>
     <div class="form-group">
        <label >Supervisor's Password</label> *
        <input type="password" class="form-control "  id="pin" name="pin"/>
        <p style="color:red; display: none" id="error-name"> </p>
      </div>
    </div>
    <div class="modal-footer">
      <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
      <button type="button" id="btn-app" class="btn btn-sm btn-success">APPROVE</button>
    </div>
  </div> 
  <script type="text/javascript">
    document.getElementById('btn-app').addEventListener('click', app);
    function app(){   
    var pin = $("#pin").val();
    var item_id = '<?php echo $item_id; ?>'; 
    var qty = '<?php echo $qty; ?>';
    var price = '<?php echo $price; ?>';
    var sup_id = '<?php echo $sup_id; ?>'; 
    $.ajax({
      url: 'broker_app_act.php',
      typr: 'POST',                           
      data: 'pin='+pin+'&item_id='+item_id+'&qty='+qty+'&price='+price+'&sup_id='+sup_id,
      dataType: 'html'
    })
    .done(function(data){  
      $('#app-results').html(' ');
      $('#app-results').html(data);
        })
    .fail(function(){
        $('#app-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
        
    });
  }
  </script>