<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
if(isset($_REQUEST['items'])){
  $items = $_REQUEST['items'];
  $action="LOADED|-|-|CATEGORY CHANGE MODAL FOR |";
  logs($action,"../../"); 

  $arr = explode(',', $items);
}
?>
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">CHANGE SUB CATEGORY <?php echo count($arr); ?> ITEMS</h4>
  </div>
		<div class="modal-body p-5">
			<div id="results"></div>
			<form id="sub-form">
      <div class="form-group row">
        <div class="form-group col-md-12">
          <select type="text" class="form-control pickers" id="sub_id" name="sub_id" style="width:100%;">
            <option  value="0">---SELECT A SUB CATEGORY----</option>
            <?php
              $get_categories = mysqli_query($connection,"SELECT * FROM kp_sub_cat") or die("Could not get the categories");
              while ($cat = mysqli_fetch_assoc($get_categories)) {
            ?>
            <option  value="<?php echo $cat['sub_id']; ?>"  <?php if ($cat['sub_id']==$sub_id) { echo "selected"; } ?> > <?php echo $cat['name']; ?> </option>
            <?php
              }
            ?> 
          </select> 
          <input type="hidden"  class="form-control" value="<?php echo $items; ?>" name="items" id="items">
        </div> 
      </div>
      <div class="modal-footer p-5">
        <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
				<a  id="edit-prods" class="btn btn-xs btn-purple">Save</a>
			</div>
		</form>
		</div>
	</div> 

<script type="text/javascript">                       
 
// Add your custom JS code here
$( document ).ready(function() { 
   $('.pickers').select2({
    dropdownParent: $('#modal')
  }); 
  document.getElementById('edit-prods').addEventListener('click', sub_act);
    function sub_act(){ 
    var str = $( "#sub-form" ).serialize(); 
    $('#results').html('');
    $.ajax({
      url: 'prod_sub_act.php',
      type: 'POST',                           
      data: str,
      dataType: 'html'
    })
    .done(function(data){
      $('#results').html(data);
      $('#modal').modal('toggle'); 
    })
    .fail(function(){
      $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
  });
                    </script>
					


		<!--modal add-->
		
