<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
  $id = $_REQUEST['id'];
  $get_tax_details = mysqli_query($connection,"SELECT * FROM kp_tax WHERE tax_id='$id'") or die("Could not get the tax details");
  $row = mysqli_fetch_assoc($get_tax_details);
  $name = $row['name'];
  $percent = $row['percent'];   
  $code = $row['code'];
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
            <label>Percent</label>
            <input type="text" class="form-control" name="percent" id="percent" value="<?php echo $percent;?>" />
          </div> 
          <div class="form-group col-md-12">
            <label>Code</label>
            <input type="text" class="form-control" name="code" id="code" value="<?php echo $code;?>" />
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
    var percent = $("#percent").val();
    var code = $("#code").val();
    var id = <?php echo $id; ?>;     
    $.ajax({
      url: 'tax_edit_act.php',
      typr: 'POST',                           
      data: { name:name, percent:percent, id:id },
        dataType: 'html'
    })
    .done(function(data){
      $('#edit-results').html(''); // blank before load.
      $('#edit-results').html(data);
      $('#modal').modal('toggle');
      load_list("tax-res","tax_list.php");
    })
    .fail(function(){
      $('#edit-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }
</script>
					


		<!--modal add-->
		

    
