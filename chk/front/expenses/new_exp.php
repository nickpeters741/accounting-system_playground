<?php
include("../../inc/connection.php");?>

<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">New expense</h4>
	</div>
	<div class="modal-body"> 
    <div id="results"></div>
    <div class="form-group row">
      <div class="form-group col-md-6">
        <label>Expense</label>
            <div class="input-group input-group-xs mb-3"> 
            <select  type="text" class="form-control form-control-xs pickers"  id="exp_type" name="exp_type" style="width: 100%; height: 25px;">
              <?php
                $get_phy = mysqli_query($connection,"SELECT * FROM kp_expensetypes order by type asc") or die("Could not get the any Type");
                while ($ser = mysqli_fetch_assoc($get_phy)) {
              ?>
              <option  value="<?php echo $ser['id']; ?>"> <?php echo $ser['type']; ?> </option>
              <?php
                }
              ?> 
            </select>  
            </div>
      </div>
      <div class="form-group col-md-6">
          <label>Amount</label>
          <input type="text" class="form-control" name="exp_amnt" id="exp_amnt" placeholder="Enter Expense Amount..." / >
      </div>
      <div class="form-group col-md-6">
          <label>Expense Date</label>
          <input type="date" class="form-control" name="exp_date" id="exp_date" / >
      </div>


    </div>
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    <button type="button" name="new_customer" id="btn-customer" class="btn btn-success" onclick="customer()">Save</button>
  </div>
</div>
<script type="text/javascript"> 
function customer(){
  $('#btn-customer').text('');
  $('#btn-customer').append('<span> Please wait... </span>');
  $('#btn-customer').attr('disabled',true);

  var exp_type = $("#exp_type").val();
  var exp_amnt = $("#exp_amnt").val();
  var exp_date = $("#exp_date").val();


  $.ajax({
    url: 'new_act.php',
    typr: 'POST',                           
    data: 'exp_type='+exp_type+'&exp_amnt='+exp_amnt+'&exp_date='+exp_date,
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