<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type'];

$action="LOADED|-|-|-|CHANGE SALES PERSON MODAL|";
logs($action,"../../");  
?>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CHANGE THE SALES TYPE TO  <?php if($sale_type==2){ echo "RECEIPT";}else{ echo "INVOICE";} ?></h4>
            </div>
            <div class="modal-body" id="modal-load"> 
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
                <a class="btn btn-purple btn-xs" id="new-sale"  >CHANGE</a>
            </div>
        </div>

<script type="text/javascript"> 
  $(document).on('click','#new-sale', function(e){ 
    $('#load2').html(''); 
    $.ajax({
      url: 'sale_type_act.php',
      typr: 'POST',
      data: '',
      dataType: 'html'
    })
    .done(function(data){ 
      $('#modal-load').html(''); // blank before load.
      $('#modal-load').html(data);
    })
    .fail(function()
    {
      $('#modal-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
</script>