      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="btnCancel" aria-hidden="true">×</button>
          <h4 class="modal-title" id="upload-avatar-title">SELECT DAY TO VIEW TEH Z REPORT </h4>
        </div>
        <form action="../day_close/index.php" id="zform" method="POST" data-parsley-validate="true">
            	<div class="modal-body">
            		<div class="" id="cust_results"></div>
            		<div class="form-group  col-md-10 ">
						<label>Select Date:</label>
							<input class="form-control" type="date" id="day" name="day"  date-format="yyyy-mm-dd"/>
					</div>  

            		<!-- <div class="form-group col-md-10 col-sm-10 col-xs-12" >
                        <label>SELECT SHOP</label>
                    <div>
                        <div class="radio radio-css radio-inline">
                            <input type="radio" name="shop" id="shop3" value="3" onclick="shop_change();" />
                            <label for="shop3">ALL SHOPS</label>
                        </div>
                        <div class="radio radio-css radio-inline">
                            <input type="radio" name="shop" id="shop1" value="1" onclick="shop_change();" />
                            <label for="shop1">SHOP 1</label>
                        </div>
                        <div class="radio radio-css radio-inline">
                            <input type="radio" name="shop" id="shop2" value="2" onclick="shop_change();" />
                            <label for="shop2">SHOP 2</label>
                        </div>
                    </div>
                </div> -->
				</div>
				<div class="modal-footer">
					<a  class="btn btn-danger close btn-xs" id="btnClose" >CLOSE</a>
					<a  id="cust-save" class="btn btn-sm btn-success btn-xs">SUBMIT</a>
				</div> 
			</form>
      </div> 
<script type="text/javascript">
	$(document).on('click','#cust-save', function(e){ 
		//CHECK IF DATE IS INPUTED
		var day= $("#day").val();
		if (!Date.parse(day)) {
	        var hulla = new hullabaloo();
			hulla.send("DATE CANT BE EMPTY!!!!!", "danger");
	    } else  {
			document.getElementById('zform').submit();
		} 
	});
</script>