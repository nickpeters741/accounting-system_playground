<?php
session_start();
include("../../inc/connection.php");
include('funcs.php');
$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$row = mysqli_fetch_assoc($get_gen_details);
?>
<!-- begin panel -->
<div class="panel panel-inverse" data-sortable-id="form-validation-2"> 
  <!-- begin panel-body -->
  <div class="panel-body "> 
    <div class="form-group row">
      <div class="form-group col-md-6">
        <fieldset>
          <legend>Add Unit of Measure(UOM)</legend>
            <div id="nresults"></div> 
              <div class="form-group m-b-1" id="pin-div">
                <label class="col-form-label">UOM NAME <b style="color: red;">*</b></label> 
                <input class="form-control" type="text" id="uom_name" name="uom_name" placeholder="Enter UOM Name.." /> 
              </div>
              <div class="form-group m-b-1" id="pin-div">
                <label class="col-form-label">Item Quantity<b style="color: red;">*</b></label> 
                <input class="form-control" type="text" id="qty" name="qty" placeholder="Enter UOM Quantity..." /> 
              </div>  
              <div class="form-group">
                <button type="button" name="new-tax" id="new-tax" class="btn btn-lime btn-xs pull-right" style="margin-top: 10px;" onclick="new_uom();">Add UOM</button>
              </div>
        </fieldset> 
      </div>
      <div class="form-group col-md-6 ">
        <fieldset id="uom-res">
        </fieldset>
      </div>
    </div>
  </div>
  <!-- end panel-body -->   
</div>
<!-- end panel -->  
<script> 
  function new_uom(){ 
    var name = $("#uom_name").val();
    var qty = $("#qty").val();    
    $.ajax({
      url: 'uom_act.php',
      typr: 'POST',   
      data: { name:name,qty:qty},
      dataType: 'html'
    })
    .done(function(data){
      console.log(data);
      $('#nresults').html('');
      $('#nresults').html(data);
      load_list("uom-res","uom_list.php");
    })
    .fail(function(){
      $('#nresults').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }

  

</script>

 