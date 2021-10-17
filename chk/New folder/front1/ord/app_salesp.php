<?php
  session_start();
  include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$mkt = $_REQUEST['mkt'];
$action="LOADED|-|-|-|APPROVE MODAL FOR ".get_user($mkt)."|";
logs($action,"../../");  
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">AUTHORISE CHANGE OF SALES PERSON</h4>
	</div>
	<div class="modal-body">
  <div id="app-results"></div> 
  <p style="color:red;">Remember will remove this sale from current Salesperson sales</p> 
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
    var mkt = '<?php echo $mkt; ?>';  
    $.ajax({
      url: 'app_salep_act.php',
      typr: 'POST',                           
      data: 'pin='+pin+'&mkt='+mkt,
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