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
   		<div class="modal-body">
   			<div id="results"></div>
   			<form id="staff-edit">
          <div class="form-group row">
            <fieldset > 
              <legend style="color: orange;text-transform: uppercase;">Edit <?php echo $row['staff_name']; ?> NOK Details:</legend>
              <div class="form-group row">
                <div class="form-group col-md-6">
                  <label>Name</label>
                  <input type="text" class="form-control" name="next-name" id="next-name" value="<?php echo $row['staff_kin_name']; ?>"  placeholder="Enter  n.o.k name..." / required style="text-transform: uppercase">
                </div> 
                <div class="form-group col-md-6">
                  <label>Phone Number</label>
                  <input type="text" class="form-control" name="next-phone" id="next-phone" value="<?php echo $row['staff_kin_phone']; ?>" placeholder="Enter n.o.k Phone Number..." / required style="text-transform: uppercase">
                </div> 
                <div class="form-group col-md-6">
                  <label>Address</label>
                  <input type="text" class="form-control" name="next-address" id="next-address" value="<?php echo $row['staff_kin_address']; ?>" placeholder="Enter  n.o.k Address" style="text-transform: uppercase" />
                </div> 
                <div class="form-group col-md-6">
                  <label>Residence</label>
                  <input type="text" class="form-control" name="next-residence" id="next-residence" value="<?php echo $row['staff_kin_residence']; ?>" placeholder="Enter n.o.k Residence" required style="text-transform: uppercase"/>
                </div>
              </div>
            </fieldset>
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
      url: 'change_nok_act.php',
      type: 'POST', 
      data: str,
      dataType: 'html'
    })
    .done(function(data){
      $('#results').html('');
      $('#results').html(data);
    })
    .fail(function(){
      $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
});
</script>

		
