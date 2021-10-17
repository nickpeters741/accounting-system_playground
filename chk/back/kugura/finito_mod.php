<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id']; 
$po_id=$_REQUEST['id']; 
$action="LOADED SUSPEND MODAL FOR PURCHASE ORDER NO | ";
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
  <div id="results"></div>
	<div class="modal-header">
    <h4 class="modal-title">HAVE YOU FINISHED RECEIVING ALL ITEMS</h4>
  </div>
  <div class="modal-body"> 
  </div>
  <div class="modal-footer">
  	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">No</button>
    <a class="btn btn-lime btn-xs" id="btn-fini">Yes</a>
  </div>
</div>
<script type="text/javascript"> 
$(document).ready(function() {
    $(document).on('click','#btn-fini', function(e){
    e.preventDefault();  
    $('#results').html(''); // leave this diff blank 
    $.ajax({
      url: 'finito_act.php',
      typr: 'POST',
      data: '',
      dataType: 'html'
  })
    .done(function(data){ 
    console.log(data); 
    $('#results').html(data);
  })
    .fail(function(){
      $('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  });
});
</script>