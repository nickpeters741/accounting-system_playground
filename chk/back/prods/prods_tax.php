<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
if(isset($_REQUEST['items'])){
  $items = $_REQUEST['items']; 
  $action="LOADED|-|-|TAX CHANGE MODAL FOR |";
  logs($action,"../../");
  $arr = explode(',', $items);
}
?>
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">CHANGE TAX FOR 
      <?php echo count($arr); ?> ITEMS</h4>
  </div>
		<div class="modal-body">
			<div id="results"></div>
			<form  id="cat-form">
      <div class="form-group row">
        <div class="form-group col-md-12">
          <select type="text" class="form-control pickers col-md-12" id="tax_id" name="tax_id" style="width:100%;">
            <option  value="0">---SELECT TAX TO APPLY----</option>
            <?php
              $get_tax = mysqli_query($connection,"SELECT * FROM kp_tax ORDER BY name ASC ") or die("Could not get the Taxes");
              while ($cat = mysqli_fetch_assoc($get_tax)) {
            ?>
            <option  value="<?php echo $cat['tax_id']; ?>"> <?php echo $cat['name']; ?> </option>
            <?php
              }
            ?> 
          </select> 
          <input type="hidden"  class="form-control" value="<?php echo $items; ?>" name="items" id="items">
        </div> 
      </div>
      <div class="modal-footer p-4">
        <a  class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
				<a  id="edit-tax" class="btn btn-xs btn-success">Save</a>
			</div>
		</form>
		</div>
	</div> 

<script type="text/javascript">
// Add your custom JS code here
$( document ).ready(function(){
   $('.pickers').select2({
    dropdownParent: $('#modal')
  }); 
  document.getElementById('edit-tax').addEventListener('click', cat_act);
  function cat_act(){ 
    var str = $( "#cat-form" ).serialize(); 
    $('#results').html('');
    $.ajax({
      url: 'prods_tax_act.php',
      type: 'POST',                           
      data: str,
      dataType: 'html'
    })
    .done(function(data){
      $('#results').html(data);
      //$('#modal').modal('toggle'); 
    })
    .fail(function(){
      $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
   
});
</script>
<!--modal add-->
		
