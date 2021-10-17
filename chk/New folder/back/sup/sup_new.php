<?php
include("../../inc/connection.php");
include('funcs.php');
$action="LOADED ADD NEW SUPPLIER MODAL| ";
$url="../../";
logs($action,$url); 
?>
<div class="modal-content">
	<div class="modal-header">
		<h4 class="modal-title" style="color: purple;">CREATING NEW SUPPLIER</h4>
	</div>
  <form id="sup_form">
	<div class="modal-body">  
    <div id="results"></div>
    <fieldset >
      <legend style="font-size:18px; color:purple;">SUPLIERS DETAILS</legend>
      <div class="form-group row">
        <div class="form-group col-md-6">
            <label >Supplier Name</label>
            <input type="text" class="form-control form-control-xs" id="sup_name" name="name" placeholder="Item Name" required />
        </div>
        <div class="form-group col-md-6">
            <label >Supplier Phone</label>
            <input type="text" class="form-control form-control-xs" id="sup_phone" placeholder="Item Phone" required />
        </div>
        <div class="form-group col-md-6">
            <label >Supplier  Email</label>
            <input type="text" class="form-control form-control-xs" id="sup_email" placeholder="Item Email" required />
        </div>
        <div class="form-group col-md-6">
            <label >Supplier Location</label>
            <input type="text" class="form-control form-control-xs" id="sup_location" placeholder="Item Location" required />
        </div> 
        <div class="form-group col-md-8">
          <label>Supplier Address</label> 
          <textarea  class="form-control form-control-xs" name="sup_address" id="sup_address" placeholder="Enter Supplier Address ..." style="text-transform: uppercase" ></textarea>
        </div> 
      </div>
  </fieldset> 
  <fieldset >
    <legend style="font-size:18px; color:purple;">TAX DETAILS</legend>
    <div class="form-group row">
      <div class="form-group col-md-6">
          <label >Supplier Pin</label>
          <input type="text" class="form-control form-control-xs" id="sup_pin" placeholder="Item Pin" required />
      </div>
      <div class="form-group col-md-6">
          <label >Supplier Vat</label>
          <input type="text" class="form-control form-control-xs" id="sup_vat" placeholder="Item Vat" required />
      </div> 
    </div>
  </fieldset>
  </div>
</form>  
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
    <button name="new_prod" id="new_sup" class="btn btn-xs btn-success" onclick="new_sup();">Save</button>
  </div>
</div> 
