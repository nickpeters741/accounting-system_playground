<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">New Customers</h4>
	</div>
	<div class="modal-body"> 
    <div id="results"></div>
    <div class="form-group row">
      <div class="form-group col-md-6">
        <label>Customer Name</label>
        <input type="text" class="form-control" name="name" id="name"  placeholder="Business Name..." / required style="text-transform: uppercase">
      </div>
      <div class="form-group col-md-6">
          <label>Alias/Known Name</label>
          <input type="text" class="form-control" name="alias" id="alias" placeholder="Enter alias..." / style="text-transform: uppercase">
      </div>
      <div class="form-group col-md-6">
          <label>Phone Number</label>
          <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone Number..." / >
      </div>
      <div class="form-group col-md-6">
          <label>Email</label>
          <input type="email" class="form-control" name="email" id="email" placeholder="Enter email..." / >
      </div>
      <div class="form-group col-md-6">
          <label>Address</label>
          <input type="text" class="form-control" name="address" id="address" placeholder="Email..." style="text-transform: uppercase" />
      </div> 
      <div class="form-group col-md-6">
          <label>Location</label>
          <input type="text" class="form-control" name="location" id="location" placeholder="Enter Location" required style="text-transform: uppercase"/>
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

  var name = $("#name").val();
  var alias = $("#alias").val();
  var phone = $("#phone").val();
  var address = $("#address").val();
  var location = $("#location").val();
  var email = $("#email").val();
  $.ajax({
    url: 'new_act.php',
    typr: 'POST',                           
    data: 'name='+name+'&alias='+alias+'&phone='+phone+'&address='+address+'&location='+location+'&email='+email,
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