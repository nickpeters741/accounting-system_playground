<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
  $id = $_REQUEST['id'];
  $get_item_details = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$id'") or die("Could not get the product details");
  $row = mysqli_fetch_assoc($get_item_details);
  $item_id = $row['item_id'];
}
if (isset($_REQUEST['st'])) {
  $st = $_REQUEST['st'];
}else{
  $st=1;
}
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['name']; ?> Barcode</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="results-bar"></div>
   			<form action="#" method="#" role="form">
                <div class="form-group row">
                 <div class="form-group col-md-12"> 
                    <input type="text" class="form-control"  id="code"  name="code" placeholder="SCAN OR ENTER BAR CODE" />
                </div> 
                 
            </div>
					
							<div class="modal-footer">
								<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
								<button type="button"  id="edit-bar" class="btn btn-success">Save</button>
							</div>
					 </form>
   		</div>
   	</div> 

<script type="text/javascript">                       

// Add your custom JS code here
$( document ).ready(function() {
  $('#prods-modal').on('shown.bs.modal', function () {
  $('#code').focus()
})

  document.getElementById('edit-bar').addEventListener('click', edit_prod);
  $(document).keydown(function(e) {
    var code = (e.keyCode ? e.keyCode : e.which);
    if(code==13){
      $('#edit-bar').click()
      //edit_prod();

      return false;
    }   
  });

  function edit_prod(){
    $('#results-bar').html('');
    var bar= $("#code").val(); 
    var id='<?php echo $item_id; ?>';
    var st='<?php echo $st; ?>';  
    $.ajax({
      url: '../../back/prods/bar_edit_act.php',
      typr: 'POST',                           
      data: 'bar='+bar+'&id='+id+'&st='+st,
      dataType: 'html'
    })
    .done(function(data){
      $('#results-bar').html(data);
    })
    .fail(function(){
      $('#results-bar').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
    });
  }
});
</script>
		
