<?php
require_once('../../inc/connection.php');
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">CREATE NEW USERS</h4>
	</div>
	<div class="modal-body"> 
    <div id="results"></div>
   <div class="form-group row"> 
      <div class="form-group col-md-8 col-sm-12">
        <label >Select Staff</label><BR>
        <select class="form-control pickers" name="staff" id="staff" style="width: 100%;">
          <option value="0">---SELECT STAFF-----</option>
          <?php
          $staff = mysqli_query($connection,"SELECT * FROM kp_staff WHERE staff_user_status=2") or die(mysql_error());
          // while($fetch_r=mysqli_fetch_assoc($role)) {

            foreach ($staff as $fetch_r) { 
          ?>
          <option value="<?=$fetch_r['staff_id']?>"><?=$fetch_r['staff_name']?></option>
          <?php
          }
          ?>
        </select>
      </div>
      <div class="form-group col-md-6 col-sm-12">
        <label >Username</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="Username" required />
      </div>  
      <div class="form-group col-md-6 col-sm-12">
        <label >User Roles</label><BR>
        <select class="form-control pickers" name="roles" id="roles"  style="width: 100%;">
          <?php
          $role = mysqli_query($connection,"SELECT * FROM kp_roles") or die(mysql_error());
          while($fetch_r=mysqli_fetch_assoc($role)) {
          ?>
          <option value="<?=$fetch_r['role_id']?>"><?=$fetch_r['name']?></option>
          <?php
          }
          ?>
        </select>
      </div>
      <div class="form-group col-md-6 col-sm-12">
        <label >Password</label>
        <input type="password" class="form-control" id="pass" name="password" placeholder="Password" required />
      </div>
      <div class="form-group col-md-6 col-sm-12">
        <label >Confirm Password</label>
        <input type="password" class="form-control" id="cpass" name="cpassword" placeholder="Confirm password" required />
        <div style="font-size: 16px;" id="msg"></div>
      </div>
    </div>
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    <button type="button" name="new_user" id="btn-user" class="btn btn-success">Save</button>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $(".pickers").select2({
    dropdownParent: $("#user-modal")
  });
      $("#cpass").keyup(function(){
          if ($("#pass").val() != $("#cpass").val()) {
              $("#msg").html("Passwords entered do not match").css("color","red");
              $("#btn-user").hide();
          }else{
              $("#msg").html("Passwords entered matched").css("color","green");
              $("#btn-user").show();
          }
      });
  }); 

document.getElementById('btn-user').addEventListener('click', customer);
  function customer()
  {
    // $('#btn-user').text('');
    // $('#btn-user').append('<span> Please wait... </span>');
    // $('#btn-user').attr('disabled',true);
    var staff = $("#staff").val();  
    var username = $("#username").val();
    var cpass = $("#cpass").val();
    var role = $("#roles").val();
    $.ajax(
        {
            url: '../users/new_act.php',
            typr: 'POST',                           
            data: 'staff='+staff+'&username='+username+'&cpass='+cpass+'&role='+role,
            dataType: 'html'
        })
        .done(function(data)
         {
            $('#results').html(''); // blank before load.
            $('#results').html(data);

        })
        .fail(function()
        {
            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
            
        });
  }
</script>