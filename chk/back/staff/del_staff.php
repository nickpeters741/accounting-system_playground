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
?>
    }
?>
<div class="modal-content">
<div class="modal-body">
    <div id="results3"></div>
    <div class="alert alert-warning">Confirm Archiving - <?php echo $row['staff_name']; ?>.</div>
    <input type="hidden" class="form-control" id="staff_id" value="<?php echo $id; ?>" placeholder="Email..." />
</div>
<div class="modal-footer">
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
        <button type="button" id="btn_delete" class="btn btn-danger waves-effect ">ARCHIVE</button>
      </div>
   
</div>
<script type="text/javascript">
    // Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    document.getElementById('btn_delete').addEventListener('click', Delete);
        function Delete()
        {
            $('#btn_delete').text('');
            $('#btn_delete').append('<span> Processing... </span>');
            $('#btn_delete').attr('disabled',true);

            var staff_id = $("#staff_id").val();
            $.ajax(
                {
                    url: '../staff/del_act.php',
                    typr: 'POST',                           
                    data: 'staff_id='+staff_id,
                    dataType: 'html'
                })

                .done(function(data)
                 {
                    $('#results3').html(''); // blank before load.
                    $('#results3').html(data);

                })

                .fail(function()
                {
                    $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
                    
                });
        }

    });
             
    </script>
