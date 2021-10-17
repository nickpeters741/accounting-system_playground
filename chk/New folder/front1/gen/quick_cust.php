      <div class="modal-content" style="width: 350px;">
        <div class="modal-header">
          <button type="button" class="close" id="btnCancel" aria-hidden="true">×</button>
          <h4 class="modal-title" id="upload-avatar-title">CREATE NEW CUSTOMER</h4>
        </div>
        <form action="#" id="cust_form" method="POST" data-parsley-validate="true">
            	<div class="modal-body">
            		<div class="" id="cust_results"></div>
            		<div class="form-group row">
	            		<div class="form-group col-md-12">
							<label class="col-form-label">Name* :</label> 
							<input class="form-control" type="text" id="cust_name" name="cust_name"  placeholder="Enter Name..."  data-parsley-required="true" />
							</div>
						<div class="form-group col-md-12">
							<label class="col-form-label">Phone Number* :</label> 
							<input class="form-control" type="text" id="cust_phone" name="cust_phone"  placeholder="Enter Phone..."  data-parsley-required="true" /> 
						</div>
						<div class="form-group col-md-12">
							<label class="col-form-label">Location* :</label> 
							<input class="form-control" type="text" id="loc" name="loc"  placeholder="Enter Customers Location..."/> 
						</div>
					</div> 
					<!-- <div class="form-group row m-b-15">
						<label class="col-md-4 col-sm-4 col-form-label">Email* :</label>
						<div class="col-md-8 col-sm-8">
							<input class="form-control" type="text" id="email" name="email"  placeholder="Enter Location..."  data-parsley-required="true" />
						</div>
					</div> -->
				</div>
				<div class="modal-footer">
					<a  class="btn btn-danger btn-xs" id="btnClose" data-dismiss="modal" >Close</a>
					<a  id="cust-save" class="btn btn-sm btn-purple btn-xs">Save</a>
				</div> 
			</form>
      </div> 
<script type="text/javascript">
	$(document).on('click','#cust-save', function(e){ 
	    var  name = $('#cust_name').val(); 
	    var  mail = "na";
	    var phone = $('#cust_phone').val();  
	    var loc= $('#loc').val();
	    console.log(loc);  
	    $.ajax({
	      url: '../gen/quick_cust_act.php',
	      typr: 'POST', 
	      data: 'name='+name+'&phone='+phone+'&email='+mail+'&loc='+loc,
	      dataType: 'html'
	    })
	    .done(function(data){
	      $("#cust_form").trigger('reset'); 
	      $('#cust_results').html(''); // blank before load.
	      $('#cust_results').html(data);
	      $('#modal2').modal('toggle');
	      $.fn.get_cust();
	    })
	     .fail(function(){
	      $('#cust_results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
	    });
	});
</script>