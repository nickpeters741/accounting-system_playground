<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');

$action="LOADED|-|-|-|CHANGE SALES PERSON MODAL";
logs($action,"../../");  
?>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CHANGE THE SALES PERSON</h4>
            </div>
            <div class="modal-body">
            	 <div class="form-group">
        <label>Select Marketer</label><br>
        <select type="text" class="selectpicker form-control  col-lg-12" name="mkt" id="mkt"  onchange="salesp_change();" style="width: 100%;">
          <option value="empty">--------SELECT NEW SALESPERSON-----------</option>
          <?php
          $get_types = mysqli_query($connection,"SELECT user_id,username FROM kp_users ORDER BY username ASC") or die("Could not get the users");
            while ($type = mysqli_fetch_assoc($get_types)) {
          ?>
          <option value="<?php echo $type['user_id']; ?>"><?php echo strtoupper($type['username']); ?></option>
          <?php
            }
          ?>
        </select>
      </div>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
                <button class="btn btn-purple btn-xs"   data-toggle="modal" data-target="#modal2" id="new-salep" disabled="true">CONTINUE</button>
            </div>
        </div>

<script type="text/javascript">
  $('.selectpicker').select2({
      dropdownParent: $('#modal')
  });
  function salesp_change(){
  selectVal = $('#mkt').val();
  if (selectVal == "empty") {
    document.getElementById("new-salep").disabled =true;
  }else{ 
    document.getElementById("new-salep").disabled =false;
  }
}
  $(document).on('click','#new-salep', function(e){ 
    $('#load2').html('');
    var mkt=$('#mkt').val(); 
    $.ajax({
      url: 'app_salesp.php',
      typr: 'POST',
      data: 'mkt='+mkt,
      dataType: 'html'
    })
    .done(function(data){ 
      $('#load2').html(''); // blank before load.
      $('#load2').html(data);
    })
    .fail(function()
    {
      $('#load2').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
</script>