
<div class="modal-content " style="width: 900px;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title">NEW STAFF</h4>
					</div>
					<div class="modal-body"> 
            <div id="results"></div>
            <form id="quick-form">
            <div class="form-group row">
              <div class="form-group col-md-6">
            <fieldset>
               <legend style="color: orange;text-transform: uppercase;">Personal Details:</legend>
              <div class="form-group row">
                <div class="form-group col-md-6">
                  <label>Name</label>
                  <input type="text" class="form-control" name="name" id="name"  placeholder="Enter Staff name..." / required style="text-transform: uppercase">
                  <p style="color:red; display: none" id="error-name"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>National ID</label>
                  <input type="text" class="form-control" name="id" id="id" placeholder="Enter Staff National ID..." / style="text-transform: uppercase">
                  <p style="color:red; display: none" id="error-nid"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Phone Number</label>
                  <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter Phone Number..." / required>
                  <p style="color:red; display: none" id="error-phone"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Email</label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="Enter email..." / required>
                  <p style="color:red; display: none" id="error-email"> </p>
              </div>
              <div class="form-group col-md-6">
                  <label>Address</label>
                  <input type="text" class="form-control" name="address" id="address" placeholder="Enter Address.." style="text-transform: uppercase" />
              </div> 
              <div class="form-group col-md-6">
                  <label>Residence</label>
                  <input type="text" class="form-control" name="residence" id="residence" placeholder="Enter Residence" required style="text-transform: uppercase"/>
              </div>
              <!-- <div class="form-group col-md-6">
                  <label>Nursing Number</label>
                  <input type="text" class="form-control" name="nurse-no" id="nurse-no" placeholder="Enter Nursing Certificate Number" required style="text-transform: uppercase"/>
              </div> -->
              <div class="form-group col-md-6">
                  <label>NHIF NUMBER</label>
                  <input type="text" class="form-control" name="nhif" id="nhif" placeholder="Enter NHIF Card" required style="text-transform: uppercase"/>
              </div>
              <div class="form-group col-md-6">
                  <label>NSSF Number</label>
                  <input type="text" class="form-control" name="nssf" id="nssf" placeholder="Enter NSSF Card Number" required style="text-transform: uppercase"/>
              </div>
              <div class="form-group col-md-6">
                  <label>KRA PIN</label>
                  <input type="text" class="form-control" name="pin" id="pin" placeholder="Enter KRA PIN" required style="text-transform: uppercase"/>
              </div>
            

            </div>
            </fieldset>
          </div>
          <div class="form-group col-md-6">
            <fieldset >
               <legend style="color: orange;text-transform: uppercase;">Next of Kin Details:</legend>
              <div class="form-group row">
                <div class="form-group col-md-6">
                  <label>Name</label>
                  <input type="text" class="form-control" name="next-name" id="next-name"  placeholder="Enter  n.o.k name..." / required style="text-transform: uppercase">
              </div> 
              <div class="form-group col-md-6">
                  <label>Phone Number</label>
                  <input type="text" class="form-control" name="next-phone" id="next-phone" placeholder="Enter n.o.k Phone Number..." / required style="text-transform: uppercase">
              </div> 
              <div class="form-group col-md-6">
                  <label>Address</label>
                  <input type="text" class="form-control" name="next-address" id="next-address" placeholder="Enter  n.o.k Address" style="text-transform: uppercase" />
              </div> 
              <div class="form-group col-md-6">
                  <label>Residence</label>
                  <input type="text" class="form-control" name="next-residence" id="next-residence" placeholder="Enter n.o.k Residence" required style="text-transform: uppercase"/>
              </div>
            </div>
            </fieldset>
          </div>
        </div>
            </div>
            <div class="modal-footer">
            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
            <button type="button" name="new_customer" id="btn-customer" class="btn btn-success">Save</button>
          </div>
        </form> 
        </div>
      </div>
 
<script type="text/javascript">
document.getElementById('btn-customer').addEventListener('click', staff);

function staff(){ 
  var str = $( "#quick-form" ).serialize(); 
  $.ajax({
    url: 'new_act.php',
    type: 'POST',                           
    data: str,
    dataType: 'html'
  })
  .done(function(data){
          $('#results').html(''); // blank before load.
          $('#results').html(data);
        })
        .fail(function()
        {
            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
            
        });
} 
  
</script>