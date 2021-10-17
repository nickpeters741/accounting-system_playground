<?php

include("../../inc/connection.php");
include('funcs.php');
if(isset($_REQUEST['id'])) {
  $id = $_REQUEST['id'];
  $get_details = mysqli_query($connection,"SELECT * FROM kp_suppliers WHERE sup_id='$id'") or die("Could not get the customer details");
  $row = mysqli_fetch_assoc($get_details);
  $action="LOADED SUPPLIER DISCONTINUE MODAL FOR| ".$row['sup_name'];
  $url="../../";
  logs($action,$url);
}
?>
<div class="modal-content">
  <div class="modal-body">
      <div id="results3"></div>
      <div class="alert alert-warning">Confirm Arciving- <?php echo $row['sup_name']; ?>.</div>
      <input type="hidden" class="form-control" id="sup_id" value="<?php echo $id; ?>" /> 
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
    <button type="button" id="btn_delete" class="btn btn-danger waves-effect">ARCHIVE</button>
  </div>
</div>
<script type="text/javascript"> 
$( document ).ready(function() { 
  document.getElementById('btn_delete').addEventListener('click', Delete);
  function Delete(){ 
    var sup = $("#sup").val();
    var sup_id = $("#sup_id").val();
    $.ajax({
      url: 'sup_del_act.php',
      typr: 'POST',                           
      data: 'sup_id='+sup_id,
      dataType: 'html'
    })
    .done(function(data){
      $('#results3').html(''); 
      $('#results3').html(data);
    })
    .fail(function(){
      $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
    });
  }
});
</script>
