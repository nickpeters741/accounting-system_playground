<?php
include("../../inc/connection.php");?>

<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">Re-Stock</h4>
	</div>
	<div class="modal-body"> 
    <div id="results"></div>
    <div class="form-group row">
      <div class="form-group col-md-6">
        <label>Item</label>
            <div class="input-group input-group-xs mb-3"> 
            <select  type="text" class="form-control form-control-xs pickers"  id="item" name="item" style="width: 100%; height: 25px;">
              <?php
                $get_phy = mysqli_query($connection,"SELECT * FROM kp_production_items order by name asc") or die("Could not get the any Item");
                while ($ser = mysqli_fetch_assoc($get_phy)) {
              ?>
              <option  value="<?php echo $ser['item_id']; ?>"> <?php echo $ser['name']; ?> </option>
              <?php
                }
              ?> 
            </select>  
            </div>
      </div>
      <div class="form-group col-md-6">
          <label>Quantity</label>
          <input type="text" class="form-control" name="qty" id="qty" placeholder="Enter The Quantity ..." / >
      </div>
    </div>
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    <button type="button" name="new_customer" id="btn-customer" class="btn btn-success" onclick="customer()">Add Stock</button>
  </div>
</div>
<script type="text/javascript"> 
function customer(){
  $('#btn-customer').text('');
  $('#btn-customer').append('<span> Please wait... </span>');
  $('#btn-customer').attr('disabled',true);

  var item = $("#item").val();
  var qty = $("#qty").val();

  $.ajax({
    url: 'new_act.php',
    typr: 'POST',                           
    data: 'item='+item+'&qty='+qty,
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