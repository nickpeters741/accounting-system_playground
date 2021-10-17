<?php
session_start();
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    $get_details = mysqli_query($connection,"SELECT * FROM kp_tax WHERE tax_id='$id'") or die("Could not get the item");
    $row = mysqli_fetch_assoc($get_details);
}
?>
<div class="modal-content" style="width: 300px;">
    <div class="modal-body">
        <div id="dis-results"></div>
        <div class="alert alert-danger">Confirm Disabling - <?php echo strtoupper($row['name']); ?>.</div>
        <input type="hidden" class="form-control" id="tax_id" value="<?php echo $id; ?>"  />
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <button type="button" id="btn_delete" class="btn btn-warning btn-xs">Disable Payment</button>
    </div>
</div>
<script type="text/javascript">
    // Add your custom JS code here
    $( document ).ready(function() {
        document.getElementById('btn_delete').addEventListener('click', Delete);
        function Delete(){
            var pay_id = $("#pay_id").val();
            $.ajax({
                url: 'tax_dis_act.php',
                typr: 'POST', 
                data: 'id='+id,
                dataType: 'html'
            })
            .done(function(data){
                $('#dis-results').html(data);
                $('#modal').modal('toggle');
            })
            .fail(function(){
                $('#dis-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
            });
        }
    });
</script>

