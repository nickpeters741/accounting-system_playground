<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    $get_customer_details = mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$id'") or die("Could not get the customer details");
    $row = mysqli_fetch_assoc($get_customer_details);
}
?>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h1 class="panel-title">Edit <?php echo $row['name']; ?> Details</h1>
	</div>
    <div class="modal-body">
        <div id="results"></div>
        <div class="form-group row">
            <div class="form-group col-md-6">
                <label>Customer Name</label>
                <input type="text" class="form-control" name="name" id="name" value="<?php echo $row['name']; ?>" placeholder="Business Name..." required style="text-transform: uppercase" />
            </div>
            <div class="form-group col-md-6">
                <label>Alias/Known Name</label>
                <input type="text" class="form-control" name="alias" id="alias" value="<?php echo $row['alias']; ?>" placeholder="Enter alias..." required style="text-transform: uppercase" />
            </div>
            <div class="form-group col-md-6">
                <label>Phone Number</label>
                <input type="text" class="form-control" name="phone" id="phone" value="<?php echo $row['phone']; ?>" placeholder="Enter Phone Number..." required />
            </div>

            <div class="form-group col-md-6">
                <label>Email</label>
                <input type="email" class="form-control" name="email" id="email" value="<?php echo $row['email']; ?>"  placeholder="Enter Email..." required />
            </div>

            <div class="form-group col-md-6">
                <label>Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<?php echo $row['address']; ?>" placeholder="Enter Address..." required  style="text-transform: uppercase"/>
            </div>

            <div class="form-group col-md-6">
                <label>Location.</label>
                <input type="text" class="form-control" id="location" name="location" value="<?php echo $row['location']; ?>" placeholder="Enter Location..." required style="text-transform: uppercase" />
            </div>
            <input type="hidden" class="form-control" name="cust_id" id="cust_id" value="<?php echo $row['cust_id']; ?>" />
        </div>
    </div>
    <div class="modal-footer">
    	<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    	<button type="button" name="edit_customer" id="edit_customer" class="btn btn-success" onclick="edit_customer()">Save</button>
    </div>
</div>
<script type="text/javascript"> 
function edit_customer(){
    // $('#edit_customer').text('');
    // $('#edit_customer').append('<span> Please wait... </span>');
    // $('#edit_customer').attr('disabled',true);

    var name = $("#name").val();
    var alias = $("#alias").val();
    var phone = $("#phone").val();
    var address = $("#address").val();
    var location = $("#location").val();
    var cust_id = $("#cust_id").val();
    var email = $("#email").val();

    $.ajax({
        url: 'edit_cust_act.php',
        typr: 'POST',                           
        data: 'name='+name+'&alias='+alias+'&phone='+phone+'&address='+address+'&location='+location+'&cust_id='+cust_id+'&email='+email,
        dataType: 'html'
    })
    .done(function(data){
        $('#results').html(''); // blank before load.
        $('#results').html(data);
    })
    .fail(function(){
        $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
    });
}
</script>


		
