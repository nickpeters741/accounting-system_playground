<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
    {
        $id = $_REQUEST['id'];
        //echo $id;

        $get_item_details = mysqli_query($connection,"SELECT * FROM kp_banks WHERE bank_id='$id'") or die("Could not get the bank details");

        $row = mysqli_fetch_assoc($get_item_details);
        $bank_id = $row['bank_id'];

         
    }
?>
<div class="modal-content">
	<div class="modal-header"> 
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; TRANSFER MONEY FROM  <?php echo $row['acc_name']; ?> </h4> 
	</div>
	<div class="modal-body">
		<div id="results2"></div> 
    <div class="form-group row">
         <div class="form-group col-md-12">
            <label ><?php echo $row['acc_name']; ?> BALANCE: <?php echo $row['bal']; ?></label>
            <input type="hidden" class="form-control" id="bal" value="<?php echo $row['bal']; ?>" />
        </div>
        <input type="hidden" class="form-control" id="bank_id" value="<?php echo $bank_id; ?>" />
             <div class="form-group  col-md-12">
          <label>TO:</label>
          <select class="form-control" id="bank" name="bank" > 
            <option  value="0">--------SELECT BANK TO TRANSFER TO-------</option>     <?php
          $cat = "SELECT * FROM kp_banks WHERE bank_id!='$id' AND del_status=2";
          $cat_r = mysqli_query($connection,$cat) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($cat_r)) {
              $name = $ct['acc_name'];
              $ban_id = $ct['bank_id'];
              ?>
              <option  value="<?php echo $ban_id; ?>"><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
      </div>
        <div class="form-group col-md-12">
            <label >AMOUNT</label>
            <input type="text" class="form-control" id="amount" name="amount" placeholder="ENTER AMOUNT TO TRANSFER" required />
        </div>
                 
            </div>
        </div>
					
		<div class="modal-footer">
			<a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
			<a class="btn btn-lime btn-xs"  data-toggle="modal" data-target="#modal2" id="app-trans">Save</a>
		</div> 
   		</div>
   	</div> 

<script type="text/javascript">                       
 
    document.getElementById('app-trans').addEventListener('click', app_trans);
        function app_trans()
        {
            // $('#prods-edit').text('');
            // $('#prods-edit').append('<span> Please wait... </span>');
            // $('#staff-edit').attr('disabled',true);

            var amount = $("#amount").val(); 
            var bank_id = '<?php echo $bank_id; ?>'; 
            var bank = $("#bank").val();
            console.log(bank);
            $.ajax(
                {
                    url: 'bank_trans_app.php',
                    typr: 'POST',                           
                    data: {amount:amount,bank_id:bank_id,bank:bank},
                    dataType: 'html'
                })

                .done(function(data)
                 {
                    $('#load2').html(''); // blank before load.
                    $('#load2').html(data);

                })

                .fail(function()
                {
                    $('#results2').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
                    
                });
        }
 
                    </script>
					


		<!--modal add-->
		
