<?php
session_start();
include("../../inc/connection.php");

 if(isset($_REQUEST['id']))

	{

        $id = $_REQUEST['id'];

        $get_details = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE pay_id='$id'") or die("Could not get the item");

        $row = mysqli_fetch_assoc($get_details);

    }

?>

<div class="modal-content">

<div class="modal-body">

    <div id="results3"></div>

    <div class="alert alert-danger">Confirm Disabling - <?php echo strtoupper($row['name']); ?>.</div>

    <input type="hidden" class="form-control" id="pay_id" value="<?php echo $id; ?>"  />

</div>

<div class="modal-footer">

        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>

        <button type="button" id="btn_delete" class="btn btn-danger waves-effect ">Disable Payment</button>

      </div>

   

</div>

<script type="text/javascript">

    // Add your custom JS code here

$( document ).ready(function() {

    document.getElementById('btn_delete').addEventListener('click', Delete);

    function Delete(){

        var pay_id = $("#pay_id").val();

        $.ajax({

            url: 'pay_dis_act.php',

            typr: 'POST',                           

            data: 'pay_id='+pay_id,

            dataType: 'html'

        })

        .done(function(data){

             $('#results3').html(data);

            $('#pay-modal').modal('toggle');   

        })

            .fail(function(){

                $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');

            });

        }



    });

             

    </script>

