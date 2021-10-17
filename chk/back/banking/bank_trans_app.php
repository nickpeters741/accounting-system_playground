<?php 
include("../../inc/connection.php");
include("../../inc/gen_funcs.php"); 
$amount = $_REQUEST['amount'];
$bank_id = $_REQUEST['bank_id'];
$bank = $_REQUEST['bank'];
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">AUTHORISE TRANSFER OF <?php echo $amount; ?> FROM <?php echo get_bank($bank_id); ?> TO <?php echo get_bank($bank); ?></h4>
	</div>
	<div class="modal-body">
  <div id="app-results"></div> 
  <p style="color:red;">Remember This will affect your cash or banks balances at closing</p> 
     <div class="form-group">
        <label >Supervisor's Password</label> *
        <input type="password" class="form-control "  id="pin" name="pin"/>
        <p style="color:red; display: none" id="error-name"> </p>
      </div>
    </div>
    <div class="modal-footer">
      <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">CLOSE</a>
      <button type="button" id="btn-app" class="btn btn-xs btn-lime">APPROVE</button>
    </div>
  </div> 
  <script type="text/javascript">
    document.getElementById('btn-app').addEventListener('click', approve);
    function approve(){   
    var amount = '<?php echo $amount; ?>';
    var from = '<?php echo $bank_id ?>';
    var to = '<?php echo $bank; ?>';   
    var pin = $('#pin').val();
    $.ajax(
        {
          url: 'bank_trans_act.php',
          typr: 'POST',                           
          data: 'pin='+pin+'&amount='+amount+'&from='+from+'&to='+to,
          dataType: 'html'
        })
        .done(function(data){  
          $('#app-results').html(' ');
          $('#app-results').html(data);
            })
        .fail(function()
        {
            $('#app-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
            
        });
  }
  </script>  