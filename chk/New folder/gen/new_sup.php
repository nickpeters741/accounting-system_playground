      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title" id="upload-avatar-title">CREATE NEW SUPPLIER</h4>
        </div>
        <div class="modal-body">
          <div class="" id="sup_result"></div>
          <div class="row">
          <div class="form-group col-md-6">
            <label class="col-form-label">Name* :</label>
            <div class="">
              <input class="form-control" type="text" id="sup_name" name="sup_name"  placeholder="Ente Supplierr Name..."  data-parsley-required="true" />
            </div>
          </div>
          <div class="form-group col-md-6">
            <label class="col-form-label">Phone Number* :</label>
            <div class="">
              <input class="form-control" type="text" id="sup_phone" name="sup_phone"  placeholder="Enter Supplier Phone..."  data-parsley-required="true" />
            </div>
          </div>
           <div class="form-group col-md-6">
            <label class="col-form-label">Email* :</label>
            <div class="">
              <input class="form-control" type="text" id="sup_email" name="sup_email"  placeholder="Enter the Supplier Email..."  data-parsley-required="true" />
            </div>
          </div>
          <div class="form-group col-md-6">
            <label class="col-form-label">Location* :</label>
            <div class="">
              <input class="form-control" type="text" id="sup_loc" name="sup_loc"  placeholder="Enter Supplier Location..."  data-parsley-required="true" />
            </div>
          </div>
          <div class="form-group col-md-8">
                  <label>Address</label> 
                  <textarea  class="form-control" name="sup_address" id="sup_address" placeholder="Enter Supplier Address ..." style="text-transform: uppercase" ></textarea>
              </div> 

          <div class="form-group col-md-6">
            <label class="col-form-label">VAT* :</label>
            <div class="">
              <input class="form-control" type="text" id="vat" name="vat"  placeholder="Enter Supplier VAT..."  data-parsley-required="true" />
            </div>
          </div>
          <div class="form-group col-md-6">
            <label class="col-form-label">PIN* :</label>
            <div class="">
              <input class="form-control" type="text" id="pin" name="pin"  placeholder="Enter Supplier KRA Pin..."  data-parsley-required="true" />
            </div>
          </div>
        </div>
        </div>
        <div class="modal-footer">
          <a  class="btn btn-danger btn-xs"  data-dismiss="modal" >Close</a>
          <button type="submit" id="btnsup_save" class="btn btn-purple btn-xs">Save</button>
        </div>  
      </div> 
<script type="text/javascript">
	$(document).on('click','#btnsup_save', function(e){
	    var  name = $('#sup_name').val();
	    var  email = $('#sup_email').val(); 
	    var loc = $('#sup_loc').val(); 
	    var phone = $('#sup_phone').val();
	    var address = $('#sup_address').val();
	    var vat= $('#vat').val(); 
	    var pin = $('#pin').val();      
	    $.ajax({
	      url: '../../gen/sup_act.php',
	      typr: 'POST',
	      data: 'name='+name+'&email='+email+'&loc='+loc+'&phone='+phone+'&pin='+pin+'&vat='+vat+'&address='+address,
	      dataType: 'html'
	    })
	    .done(function(data){
	    	console.log(data);
	      	$('#sup_result').html(''); // blank before load.
	      	$('#sup_result').html(data); 
	      	$("#sup_form").trigger('reset');
	      	$('#modal2').modal('toggle');
	      	$('#sup_result').empty(); 
	      	$.fn.get_sup();
	    })
	    .fail(function(){
	      $('#sup_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again... NOT LOADING PAGE'); 
	    });
  	});
</script>