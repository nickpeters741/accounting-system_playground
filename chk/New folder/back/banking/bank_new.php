<?php
include("../../inc/connection.php"); 
?>
<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title">NEW BANK </h4>
					</div>
					<div class="modal-body"> 
            <div id="results"></div> 
            <div class="form-group">
                <label >Account Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="ENTER ACCOUNT NAME" required />
            </div>
            <div class="form-group">
                <label >Bank Name</label>
                <input type="text" class="form-control" id="bank_name" name="bank_name" placeholder="ENTER BANK NAME" required />
            </div>
            <div class="form-group">
                <label >Bank Branch</label>
                <input type="text" class="form-control" id="branch" name="branch" placeholder="ENTER BANK BRANCH" required />
            </div>
            <div class="form-group">
                <label >Account Number</label>
                <input type="text" class="form-control" id="acc_no" name="acc_no" placeholder="ENTER BANK ACCOUNT NUMBER" required />
            </div>
            <div class="form-group">
                <label >Bank Location</label>
                <input type="text" class="form-control" id="loc" name="loc" placeholder="ENTER BANK LOCATION" required />
            </div>
            <div class="form-group">
                <label >Bank Balance</label>
                <input type="text" class="form-control" id="bal" name="bal" value="0"  required />
            </div>
            <div class="modal-footer">
            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
            <button type="button" name="new_bank" id="new_bank" class="btn btn-success">Save</button>
          </div>
        </div>
      </div>

<script type="text/javascript">
document.getElementById('new_bank').addEventListener('click', bank);
  function bank()
  {
    $('#new_cat').text('');
    $('#new_cat').append('<span> Please wait... </span>');
    $('#new_prod').attr('disabled',true);
    var name = $("#name").val(); 
    var bank_name = $("#bank_name").val(); 
    var branch = $("#branch").val(); 
    var acc_no = $("#acc_no").val(); 
    var loc = $("#loc").val(); 
    var bal = $("#bal").val(); 
    $.ajax(
        {
            url: 'bank_new_act.php',
            typr: 'POST',                           
            data: 'name='+name+'&bank_name='+bank_name+'&branch='+branch+'&acc_no='+acc_no+'&loc='+loc+'&bal='+bal,
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