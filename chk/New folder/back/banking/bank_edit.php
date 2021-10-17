<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
    {
        $id = $_REQUEST['id'];
        //echo $id;

        $get_item_details = mysqli_query($connection,"SELECT * FROM kp_banks WHERE bank_id='$id'") or die("Could not get the bank details");

        $row = mysqli_fetch_assoc($get_item_details);
        $bank_id = $row['bank_id'];

         
    }
?>
<div class="modal-content">
	<div class="modal-header"> 
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['acc_name']; ?> Details</h4> 
	</div>
	<div class="modal-body">
		<div id="results2"></div>
		<form action="#" method="#" role="form">
    <div class="form-group row">
            <div class="form-group col-md-6">
                <label >Account Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo $row['acc_name']; ?>"  placeholder="ENTER ACCOUNT NAME" required />
            </div>
            <div class="form-group col-md-6">
                <label >Bank Name</label>
                <input type="text" class="form-control" id="bank_name" value="<?php echo $row['bank_name']; ?>" name="bank_name" placeholder="ENTER BANK NAME" required />
            </div>
            <div class="form-group col-md-6">
                <label >Bank Branch</label>
                <input type="text" class="form-control" id="branch" name="branch" value="<?php echo $row['branch']; ?>" placeholder="ENTER BANK BRANCH" required />
            </div>
            <div class="form-group col-md-6">
                <label >Account Number</label>
                <input type="text" class="form-control" id="acc_no" name="acc_no" value="<?php echo $row['acc_no']; ?>" placeholder="ENTER BANK ACCOUNT NUMBER" required />
            </div>
            <div class="form-group col-md-6">
                <label >Bank Location</label>
                <input type="text" class="form-control" id="loc" name="loc" value="<?php echo $row['location']; ?>" placeholder="ENTER BANK LOCATION" required />
            </div> 
                 
            </div>
					
							<div class="modal-footer">
								<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
								<button type="button"  id="edit-prods" class="btn btn-success">Save</button>
							</div>
					 </form>
   		</div>
   	</div> 

<script type="text/javascript">                       

// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    document.getElementById('edit-prods').addEventListener('click', edit_prod);
        function edit_prod()
        {
            $('#prods-edit').text('');
            $('#prods-edit').append('<span> Please wait... </span>');
            $('#staff-edit').attr('disabled',true);

            var name = $("#name").val(); 
            var cat_id = '<?php echo $cat_id; ?>'; 
            $.ajax(
                {
                    url: 'cat_edit_act.php',
                    typr: 'POST',                           
                    data: 'name='+name+'&cat_id='+cat_id,
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
		
