<?php
include("../../inc/connection.php");
include('../clude/funcs.php');
 if(isset($_REQUEST['id']))
	{
		$id = $_REQUEST['id'];
    $get_role = mysqli_query($connection,"SELECT * FROM kp_roles WHERE role_id='$id'") or die("Could not get the user details");
    $row = mysqli_fetch_assoc($get_role);
    }
?>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">CONFIRM DELETE "<?php echo $row['role_name']; ?>" ROLE</h4>
    </div>
    <div class="modal-body">
        <div id="results3"></div>
        <?php
        $get_role = mysqli_query($connection ," SELECT * FROM kp_users WHERE user_role_id='$id'") or die(mysqli_error($connection));
        if( mysqli_num_rows($get_role) < 1){
            $dis="";
         ?>
         <button class="btn btn-lime">YOU CAN DELETE!!!!NO USERS ASSIGNED...</button>
         <?php
        }else{
            $dis="disabled";
        ?>
         <div class="form-group  col-md-12">

          <input type="hidden" class="form-control" id="role_id" value="<?php echo $id; ?>" />
          <label>Select Role to Assign All Users assigned to this <?php echo $row['name']; ?></label>
          <select class="form-control" id="role" name="role" onchange="role();"> 
            <option  value="0">--------SELECT ROLE-------</option>     <?php
          $role = "SELECT * FROM kp_roles";
          $role_r = mysqli_query($connection,$role) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($role_r)) {
              $name = $ct['role_name'];
              $role_id = $ct['role_id'];
              ?>
              <option  value="<?php echo $role_id; ?>"><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
      </div>
         <?php
                }
              ?> 
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
        <button type="button" id="btn_delete" class="btn btn-danger waves-effect " <?php echo $dis; ?>>CONFIRM</button>
    </div>
</div>
<script type="text/javascript">
function role(){ 
    var role_id = $("#role_id").val();
    var role = document.getElementById("role").value;
    if(role>0 && !(role==role_id)){  
        $('#btn_delete').attr('disabled',false);
    }else{ 
        $('#btn_delete').attr('disabled',true);
    }
}
$( document ).ready(function() {

  //  $(".select-picker").select2({
  //   dropdownParent: $("#role-modal") 
  // });
    document.getElementById('btn_delete').addEventListener('click', Delete);
    function Delete(){
        $('#btn_delete').text('');
        $('#btn_delete').append('<span> Processing... </span>');
        $('#btn_delete').attr('disabled',true);
        var id = '<?php echo $id; ?>' ;
        var role = $("#role").val();
        $.ajax({
            url: 'role_del_action.php',
            typr: 'POST',                           
            data: 'id='+id+'&role='+role,
            dataType: 'html'
        })
        .done(function(data){
            $('#results3').html(''); // blank before load.
            $('#results3').html(data);
        })
        .fail(function(){
            $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
        });
    }
    });
</script>
