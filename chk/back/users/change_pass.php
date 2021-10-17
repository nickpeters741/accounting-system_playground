<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    $get_customer_details = mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$id'") or die("Could not get the user details");
    $row = mysqli_fetch_assoc($get_customer_details);
}
?>
<div class="modal-content">
<div class="modal-body">
    <div class="form-group">
        <span id='message' style="margin-top: 5px ; margin-bottom: 5px;"></span>
        <label >Previous Password</label>
        <input type="hidden" class="form-control " id="showpass" placeholder="Previous Password" value="<?php echo $row['user_password'];?>" / >
        <input type="password" class="form-control " id="prpass" placeholder="Previous Password" required="" />
        <input type="hidden" class="form-control " id="staff_id" placeholder="Previous Password" value="<?php echo $id;?>" / >
    </div>
    <div class="form-group">
        <label >New Password</label>
        <input type="password" class="form-control " id="password" placeholder="New Password" required="" /> 
        <div class="pwstrength_viewport_progress" style="margin-top: 10px;"></div>
    </div>
    <div class="form-group">
        <label >Confirm Password</label>
        <input type="password" class="form-control " id="confirmpassword" placeholder="ConfirmPassword" required="" />
    </div>
<script type="text/javascript">
    $('#showpass, #prpass').on('keyup', function () {
        if ($('#showpass').val() == $('#prpass').val()) {
             document.getElementById("btn_pass").disabled = false;
            $('#message').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Perfect Match.</div>');
        } else {
             document.getElementById("btn_pass").disabled = true;
        $('#message').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Passwords Does Not Match.</div>');
    }
    });
</script>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
    <button type="button" class="btn btn-info" id="btn_pass" disabled="true">Submit</button>
</div>
</div>
<script type="text/javascript">
    $(document ).ready(function() {
        document.getElementById('btn_pass').addEventListener('click', changePass);
        function changePass(){
            var staff_id = $("#staff_id").val();
            var password = $("#password").val();
            var confirmpassword = $("#confirmpassword").val();
            if( password != confirmpassword){
                $('#message').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Passwords Do Not Match!!.</div>');
            } else if (password==null || password.length==0){
                $('#message').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Password Cannot be empty!!.</div>');
            } else if (confirmpassword==null || confirmpassword.length==0){
                $('#message').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Password confirmation Cannot be empty!!.</div>');
            }else{
                $.ajax({
                    url: '../users/pass_act.php',
                    typr: 'POST',                           
                    data: 'staff_id='+staff_id+'&confirmpassword='+confirmpassword,
                    dataType: 'html'
                })
                .done(function(data)
                 {
                    $('#message').html(''); // blank before load.
                    $('#message').html(data);
                })
                .fail(function()
                {
                    $('#message').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
                    window.setTimeout(function(){
                        window.location.href = 'user_index.php';
                    }, 100);
                });
            }
        }
    });
</script> 
