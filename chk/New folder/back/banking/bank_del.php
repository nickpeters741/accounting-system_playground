<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
	{
        $id = $_REQUEST['id'];
        $get_details = mysqli_query($connection,"SELECT * FROM kp_banks WHERE bank_id='$id'") or die("Could not get the customer details");
        $row = mysqli_fetch_assoc($get_details);

        $get_pay_bank = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE bank_id='$id'") or die("Could not get the parent details");
        $dow = mysqli_fetch_assoc($get_pay_bank);
    }
?>
<div class="modal-content">
<div class="modal-body">
    <div id="results3"></div>
    <div class="alert alert-warning">Confirm Closure of- <?php echo $row['acc_name']; ?>.</div>
    <input type="hidden" class="form-control" id="bank_id" value="<?php echo $id; ?>" />
     <?php 
    if (mysqli_num_rows($get_pay_bank)<1) {
    ?>
    <script type="text/javascript">
      $('#btn_delete').attr('disabled',false);
    </script>
    <?php
    }else{
      ?>
    <div class="form-group  col-md-12">
          <label>SELECT BANK TO TRANSFER MONEY TO <?php echo $row['name']; ?></label>
          <select class="form-control" id="menu" name="menu" onchange="menu();"> 
            <option  value="<?php echo $menu_id; ?>">--------SELECT BANK-------</option>     <?php
          $cat = "SELECT * FROM kp_banks WHERE  bank_id!='$id'";
          $cat_r = mysqli_query($connection,$cat) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($cat_r)) {
              $name = $ct['acc_name'];
              $bank_id = $ct['bank_id'];
              ?>
              <option  value="<?php echo $bank_id; ?>"><?php echo $name; ?></option>
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
        <button type="button" id="btn_delete" class="btn btn-danger waves-effect " onclick="Delete()">DELETE</button>
      </div>
   
</div>
<script type="text/javascript">
function Delete(){
            // $('#btn_delete').text('');
            // $('#btn_delete').append('<span> Processing... </span>');
            // $('#btn_delete').attr('disabled',true);
            var bank_id = $("#bank_id").val();
            var bank = $("#bank").val();
            $.ajax({
                url: 'bank_del_act.php',
                typr: 'POST',                           
                data: {bank:bank,bank_id:bank_id},
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

 
             
    </script>
