<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
    {
        $id = $_REQUEST['id'];
        //echo $id;

        $get_item_details = mysqli_query($connection,"SELECT * FROM kp_category WHERE cat_id='$id'") or die("Could not get the Category details");

        $row = mysqli_fetch_assoc($get_item_details);
        $cat_id = $row['cat_id'];

         
    }
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['name']; ?> Details</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="results2"></div>
   			<form action="#" method="#" role="form">
                <div class="form-group row">
                 <div class="form-group col-md-6">
                    <label >Item Name</label>
                    <input type="text" class="form-control"  id="name" value="<?php echo $row['name']; ?>" name="item_name" placeholder="Item Name" required />
                </div>
                <div class="form-group">
                <label >Category Description</label>
                <input type="text" class="form-control" id="desc" name="desc" placeholder="Description"/>
            </div>  
                 <div class="form-group col-md-6">
                    <label >Code</label>
                    <input type="text" class="form-control" id="code" name="code" value="<?php echo $row['code']; ?>" placeholder="Category code" required />
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
            // $('#prods-edit').text('');
            // $('#prods-edit').append('<span> Please wait... </span>');
            // $('#staff-edit').attr('disabled',true);

            var name = $("#name").val(); 
            var cat_id = '<?php echo $cat_id; ?>'; 
            var code = $("#code").val(); 
            var desc = $("#desc").val(); 
            $.ajax(
                {
                    url: 'cat_edit_act.php',
                    typr: 'POST',                           
                    data: 'name='+name+'&cat_id='+cat_id+'&code='+code+'&desc='+desc,
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
		
