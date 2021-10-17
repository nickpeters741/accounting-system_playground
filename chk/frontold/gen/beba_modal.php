<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');  

$action="LOADED|-|-|-|NEW DELIVERY PERSON MODAL";
logs($action,"../../");  
?>		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CREATE NEW BEBA</h4>
            </div>
            <!-- <form action="menu_action.php" method="POST" data-parsley-validate="true">
            	 --><div class="modal-body">
            		<div class="" id="beba_results"></div>
            		<div class="form-group row">
            		<div class="form-group col-md-6">
						<label class="col-form-label">Name* :</label>
						<div class=" ">
							<input class="form-control" type="text" id="beba_name" name="name"  placeholder="Enter Name..."  data-parsley-required="true" />
						</div>
					</div>
					 <div class="form-group col-md-6">
						<label class="col-form-label">National ID* :</label> 
							<input class="form-control" type="text" id="nid" name="nid"  placeholder="Enter National ID..."  data-parsley-required="true" /> 
					</div>
					<div class="form-group col-md-6">
						<label class="col-form-label">Phone Number* :</label> 
						<input class="form-control" type="text" id="phone" name="phone"  placeholder="Enter Phone..."  data-parsley-required="true" /> 
					</div>
					<div class="form-group  col-md-6">
						<label class="col-form-label">Location* :</label>
						<input class="form-control" type="text" id="loc" name="loc"  placeholder="Enter Location..."  data-parsley-required="true" />
					</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-danger btn-xs " id="beba_close" data-dismiss="modal">Close</a>
					<button type="submit" id="beba_save" class="btn btn-purple btn-xs">Save</button>
				</div>
			<!-- </form> -->
           
        </div>