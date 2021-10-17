<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id'])){
	$id = $_REQUEST['id'];
    $get_customer_details = mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$id'") or die("Could not get the customer details");
    $row = mysqli_fetch_assoc($get_customer_details);
    }
?>
<div class="modal-content">
<div class="modal-body">
    <div id="results"></div>
    <div class="alert alert-warning">Confirm archiving of - <?php echo $row['name']; ?>.</div>
    <input type="hidden" class="form-control" id="cust_id" value="<?php echo $id; ?>" placeholder="Email..." />
    <div class="modal-footer">
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
        <button type="button" id="btn_delete" class="btn btn-danger waves-effect " onclick="archive();ss">DELETE</button>
    </div>
</div>
</div>
<script type="text/javascript"> 
    function archive(){
        // $('#btn_delete').text('');
        // $('#btn_delete').append('<span> Processing... </span>');
        // $('#btn_delete').attr('disabled',true);
        var cust_id = $("#cust_id").val();
        $.ajax({
            url: 'del_cust_act.php',
            typr: 'POST',                           
            data: 'cust_id='+cust_id,
            dataType: 'html'
        })
        .done(function(data){
            $('#results').html(''); // blank before load.
            $('#results').html(data);
        })
        .fail(function(){
            $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
        });
    }
sss</script>
