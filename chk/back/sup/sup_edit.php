<?php
include("../../inc/connection.php");
include('funcs.php');
if(isset($_REQUEST['id'])) {
    $sup_id = $_REQUEST['id'];
    $get_item_details = mysqli_query($connection,"SELECT * FROM kp_suppliers WHERE sup_id='$sup_id'") or die("Could not get the Category details");
    $row = mysqli_fetch_assoc($get_item_details); 
    $action="LOADED SUPPLIER EDIT MODAL FOR| ".$row['sup_name'];
    $url="../../";
    logs($action,$url);
}
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['sup_name']; ?> Details</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="results2"></div>
   			<form action="#" method="#" role="form">
                <div class="form-group row">
                 <div class="form-group col-md-6">
                    <label >Supplier Name</label>
                    <input type="text" class="form-control" value="<?php echo $row['sup_name']; ?>" id="sup_name" placeholder="Item Name" required />
                </div> 
                <div class="form-group col-md-6">
                    <label >Supplier Phone</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_phone']; ?>" id="sup_phone" placeholder="Item Name" required />
                </div>
                <div class="form-group col-md-6">
                    <label >Supplier  Email</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_email']; ?>" id="sup_email" placeholder="Item Name" required />
                </div>
                <div class="form-group col-md-6">
                    <label >Supplier Address</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_address']; ?>" id="sup_address" placeholder="Item Name" required />
                </div>
                <div class="form-group col-md-6">
                    <label >Supplier Location</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_location']; ?>" id="sup_location" placeholder="Item Name" required />
                </div>
                <div class="form-group col-md-6">
                    <label >Supplier Pin</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_pin']; ?>" id="sup_pin" placeholder="Item Name" required />
                </div>
                <div class="form-group col-md-6">
                    <label >Supplier Vat</label>
                    <input type="text" class="form-control"  value="<?php echo $row['sup_vat']; ?>" id="sup_vat" placeholder="Item Name" required />
                </div>
                 
            </div>
					
							<div class="modal-footer">
								<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
								<button type="button"  id="edit-sup" class="btn btn-success">Save</button>
							</div>
					 </form>
   		</div>
   	</div> 

<script type="text/javascript">                       

// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    document.getElementById('edit-sup').addEventListener('click', edit_sup);
        function edit_sup()
        { 
            var sup_name = $("#sup_name").val(); 
            var sup_id = '<?php echo $sup_id; ?>';  
            var sup_phone = $("#sup_phone").val(); 
            var sup_address = $("#sup_address").val(); 
            var sup_loc = $("#sup_location").val();
            var sup_email = $("#sup_email").val(); 
            var sup_pin = $("#sup_pin").val();
            var sup_vat = $("#sup_vat").val(); 
            $.ajax(
                {
                    url: 'sup_edit_act.php',
                    typr: 'POST',                           
                    data: 'name='+sup_name+'&sup_id='+sup_id+'&sup_phone='+sup_phone+'&sup_email='+sup_email+'&sup_address='+sup_address+'&sup_pin='+sup_pin+'&sup_vat='+sup_vat+'&sup_loc='+sup_loc,
                    dataType: 'html'
                })

                .done(function(data)
                 {
                    $('#results2').html(''); // blank before load.
                    $('#results2').html(data);

                })

                .fail(function()
                {
                    $('#results2').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
                    
                });
        }

    });
                    </script>
					


		<!--modal add-->
		
