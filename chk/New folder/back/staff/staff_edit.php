<?php
session_start();
include("../../inc/connection.php");
include('../../inc/gen_funcs.php');
 if(isset($_REQUEST['id']))
	{
		$id = $_REQUEST['id'];
		
        $get_details = mysqli_query($connection,"SELECT * FROM kp_staff WHERE staff_id='$id'") or die("Could not get the customer details");

        $row = mysqli_fetch_assoc($get_details);
         $action="LOADED|-|-|STAFF ARCHIVE MODAL FOR |".$row['staff_name'];
    logs($action,"../../");
    }
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['staff_name']; ?> Details</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="results"></div>
   			<form id="staff-edit">
                       
                       <div class="form-group row">
                        <div class="form-group col-md-6">
                  <label>Name</label>
                  <input type="text" class="form-control" name="name" id="name" value="<?php echo $row['staff_name']; ?>"  placeholder="Enter Staff name..." / required style="text-transform: uppercase">
                  <p style="color:red; display: none" id="error-name"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>National ID</label>
                  <input type="text" class="form-control" name="id" id="id" value="<?php echo $row['staff_nid']; ?>" placeholder="Enter Staff National ID..." / style="text-transform: uppercase">
                  <p style="color:red; display: none" id="error-nid"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Phone Number</label>
                  <input type="text" class="form-control" name="phone" value="<?php echo $row['staff_phone']; ?>" id="phone" placeholder="Enter Phone Number..." / required>
                  <p style="color:red; display: none" id="error-phone"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Email</label>
                  <input type="email" class="form-control" name="email" value="<?php echo $row['staff_email']; ?>" id="email" placeholder="Enter email..." / required>
                  <p style="color:red; display: none" id="error-email"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Address</label>
                  <input type="text" class="form-control" name="address" value="<?php echo $row['staff_address']; ?>" id="address" placeholder="Enter Address.." style="text-transform: uppercase" />
              </div> 
              <div class="form-group col-md-6">
                  <label>Residence</label>
                  <input type="text" class="form-control" name="residence" value="<?php echo $row['staff_name']; ?>" id="residence" placeholder="Enter Residence" required style="text-transform: uppercase"/>
              </div>
              <div class="form-group col-md-6">
                  <label>Nursing Number(NCK)</label>
                  <input type="text" class="form-control" name="nurse-no" value="<?php echo $row['staff_nck_no']; ?>" id="nurse-no" placeholder="Enter Nursing Certificate Number" required style="text-transform: uppercase"/>
              </div>
              <div class="form-group col-md-6">
                  <label>NHIF NUMBER</label>
                  <input type="text" class="form-control" name="nhif" value="<?php echo $row['staff_nhif']; ?>" id="nhif" placeholder="Enter NHIF Card" required style="text-transform: uppercase"/>
              </div>
              <div class="form-group col-md-6">
                  <label>NSSF Number</label>
                  <input type="text" class="form-control" name="nssf" value="<?php echo $row['staff_nssf']; ?>" id="nssf" placeholder="Enter NSSF Card Number" required style="text-transform: uppercase"/>
              </div>
                <div class="form-group col-md-6">
                   <label>KRA PIN</label>
                   <input type="text" class="form-control" name="pin" value="<?php echo $row['staff_kra_pin']; ?>" id="pin" placeholder="Enter KRA PIN" required style="text-transform: uppercase"/>
                </div> 
                <input type="hidden" class="form-control" name="staff_id" id="staff_id" value="<?php echo $row['staff_id']; ?>" />
            </div>
					
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
				<button type="button" name="edit_customer" id="btn-edit" class="btn btn-success">Save</button>
			</div>
		 </form>
   		</div>
   	</div> 

<script type="text/javascript">  
$( document ).ready(function() {
    document.getElementById('btn-edit').addEventListener('click', edit_staff);
    function edit_staff(){ 
        var str = $( "#staff-edit" ).serialize(); 
        $.ajax({
            url: 'edit_act.php',
            type: 'POST',                           
            data: str,
            dataType: 'html'
        })
        .done(function(data){
            $('#results').html(''); // blank before load.
            $('#results').html(data);
        })
        .fail(function(){
            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
        });
    } 
});
                    </script>
					


		<!--modal add-->
		
