<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
  $id = $_REQUEST['id'];
  $get_tax_details = mysqli_query($connection,"SELECT * FROM kp_uom WHERE uom_id='$id'") or die("Could not get the tax details");
  $row = mysqli_fetch_assoc($get_tax_details);
  $name = $row['name'];
  $qty = $row['qty'];    
}
?>
<div class="modal-content " style="width: 300px;">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $name; ?> Details</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="edit-results"></div>
   			  <div class="form-group col-md-12">
            <label>Name</label>
            <input type="text" class="form-control" name="name" id="name" value="<?php echo $name;?>" />
          </div>
          <div class="form-group col-md-12">
            <label>Qty</label>
            <input type="text" class="form-control" name="qty" id="qty" value="<?php echo $qty;?>" />
          </div>      
      </div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-danger btn-xs" data-dismiss="modal">Close</a>
				<button type="button"  id="edit-tax" class="btn btn-success btn-xs" onclick="edit();">Save</button>
			</div> 
   	</div> 
 <script> 
  function edit(){
    var name = $("#name").val();
    var qty = $("#qty").val(); 
    var id = <?php echo $id; ?>;     
    $.ajax({
      url: 'uom_edit_act.php',
      typr: 'POST',                           
      data: { name:name, qty:qty, id:id },
        dataType: 'html'
    })
    .done(function(data){
      $('#edit-results').html(''); // blank before load.
      $('#edit-results').html(data);
      $('#modal').modal('toggle');
      load_list("uom-res","uom_list.php");
    })
    .fail(function(){
      $('#edit-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }
</script>
					


		<!--modal add-->
		

    
