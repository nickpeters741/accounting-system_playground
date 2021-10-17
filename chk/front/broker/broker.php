<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');  
$item_id=$_REQUEST['item_id'];
$action="LOADED|-|-|-|BROKER MODULE FOR ".get_item($item_id);
logs($action,"../../");

?>		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" style="font-size: 18px; color: purple;">BROKER <?php echo get_item($item_id); ?></h4>
            </div>
            <!-- <form action="menu_action.php" method="POST" data-parsley-validate="true">
            	 --><div class="modal-body">
            		<div class="" id="beba_results"></div>
            		<div class="form-group row">
	            		<div class="form-group col-md-12">
			              <label style="font-size: 18px; color: orange;">SELECT SUPPLIER </label>
			              <div class="input-group mb-3">
			                <div class="input-group-prepend">
			                  <a class="btn btn-warning"id="supbtn"><i class='fa fa-lg fa-plus' ></i></a> 
			                </div> 
			                <select type="text" class="selectpicker form-control col-lg-12" name="sup_id" id="sup_id" data-size="10" data-live-search="true" onchange="sup();" style="width: 80%;"> </select>
			              </div>
			            </div>
			            <div class="form-group col-md-6">
							<label class="col-form-label">QTY* :</label> 
							<input class="form-control" type="text" id="po-qty" name="po-qty"  placeholder="Enter Qty..."/>
							<p id="qty-er" style="color: red; display: none;"></p> 
						</div>
						<div class="form-group  col-md-6">
							<label class="col-form-label">PRICE* :</label>
							<input class="form-control" type="text" id="po-price" name="po-price"  placeholder="Enter price..."/>
							<p id="price-er" style="color: red; display: none;"></p> 
						</div>
				</div>
				<div class="modal-footer" id="broker-foot">
					<a href="javascript:;" class="btn btn-danger btn-xs " id="beba_close" data-dismiss="modal">Close</a>
					<button class="btn btn-purple btn-xs"  id="brokerp" disabled="true">CONTINUE</button>
				</div>
			<!-- </form> -->
           
        </div>
        <script type="text/javascript">
		$('.selectpicker').select2({
		     dropdownParent: $('#modal')
		});
		function sup(){
  			var sup = document.getElementById("sup_id").value;
		  	if(sup>0){ 
		    	$("#brokerp").prop('disabled', false);
		  	}else{
		    	$("#brokerp").prop('disabled', true);
		  	}
		}
		$(document).on('click','#brokerp', function(e){ 
		    $('#load2').html('');
		    var item_id='<?php echo $item_id; ?>';
		    var sup=document.getElementById("sup_id").value;
		    var qty=$("#po-qty").val();
		    var price=$("#po-price").val();
		    	$("#qty-er").hide();
		    	$("#price-er").hide();

		    if (qty==0) {
		    	$("#qty-er").html("Qty is required");
				$("#qty-er").show();
		    } else if (price==0){
		    	$("#qty-er").hide();
		    	$("#price-er").html("Price is required");
				$("#price-er").show();
		    }else{
		    	$('#modal2').modal('show');
		    	$.ajax({
			      url: '../broker/broker_app.php',
			      typr: 'POST',
			      data: 'item_id='+item_id+'&sup='+sup+'&qty='+qty+'&price='+price,
			      dataType: 'html'
			    })
			    .done(function(data){ 
			      $('#load2').html(''); // blank before load.
			      $('#load2').html(data);
			    })
			    .fail(function(){
			      $('#load2').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
			    });
			}
  		});
		$(document).on('click','#supbtn', function(e){ 
		    $('#load2').html('');
		    $('#modal2').modal('show');
	    	$.ajax({
		      url: '../../back/sup/sup_new.php',
		      typr: 'POST',
		      data: '',
		      dataType: 'html'
		    })
		    .done(function(data){ 
		      $('#load2').html(''); // blank before load.
		      $('#load2').html(data);
		    })
		    .fail(function(){
		      $('#load2').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
		    }); 
  		}); 
		</script>