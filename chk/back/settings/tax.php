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
              <legend>Tax Details</legend><div id="results"></div> 
                <div class="form-group m-b-1" id="pin-div">
                  <label class="col-form-label">TAX PIN <b style="color: red;">*</b> :</label> 
                  <input class="form-control" type="text" id="kra-pin" name="kra-pin" value="<?php echo $row['kra_pin']; ?>"  placeholder="Enter TAX PIN..." /> 
                </div>
                <div class="form-group m-b-1" id="pin-div">
                  <label class="col-form-label">VAT <b style="color: red;">*</b> :</label> 
                  <input class="form-control" type="text" id="vat" name="vat" value="<?php echo $row['vat']; ?>"  placeholder="Enter VAT..." /> 
                </div>
                <div class="form-group m-b-1">
              <label class="col-form-label"  style="color:blue;">Tax Calculations Mode</label><br> 
                <div class="radio radio-css radio-inline">
                  <input type="radio" name="tax-type" id="inc" value="1" <?php if ($row['tax_type']==1) { echo "checked"; } ?>/>
                  <label for="inc">Inclusive</label>
                </div>
                <div class="radio radio-css radio-inline">
                  <input type="radio" name="tax-type" id="excl" value="2" <?php if ($row['tax_type']==2) { echo "checked"; } ?>/>
                  <label for="excl">Exclusive</label>
                </div> 
                <div class="form-group">
                  <button type="button" name="tax-det" id="tax-det" class=" btn btn-lime btn-xs pull-right" style="margin-top: 10px;" onclick="tax_det();">Save Details</button>
                </div>
            </div>
          </fieldset> 
          <fieldset>
              <legend>Add Tax Types</legend>
              <div id="nresults"></div> 
                <div class="form-group m-b-1" id="pin-div">
                  <label class="col-form-label">TAX NAME <b style="color: red;">*</b></label> 
                  <input class="form-control" type="text" id="name" name="name" placeholder="Enter Tax Name.." /> 
                </div>
                <div class="form-group m-b-1" id="pin-div">
                  <label class="col-form-label">PERCENTAGE(%) <b style="color: red;">*</b></label> 
                  <input class="form-control" type="text" id="percent" name="percent" placeholder="Enter Tax percentage..." /> 
                </div> 
                <div class="form-group m-b-1">
                  <label class="col-form-label">TAX CODE<b style="color: red;">*</b></label> 
                  <input class="form-control" type="text" id="tcode" name="tcode" placeholder="Enter Tax Code..." /> 
                </div> 
                <div class="form-group">
                  <button type="button" name="new-tax" id="new-tax" class="btn btn-lime btn-xs pull-right" style="margin-top: 10px;" onclick="new_tax();">Add New Tax</button>
                </div>
          </fieldset> 
      </div>
      <div class="form-group col-md-6 ">
        <fieldset id="tax-res">
        </fieldset>
      </div>
    </div>
  </div>
  <!-- end panel-body -->   
</div>
<!-- end panel -->  
<script>
  function tax_det(){
    var pin = $("#kra-pin").val();
    var vat = $("#vat").val(); 
    var type = $('input[name="tax-type"]:checked').val();  
    $.ajax({
      url: 'tax_act.php',
      typr: 'POST',   
      data: { pin:pin, vat:vat, type:type, st:1 },
      dataType: 'html'
    })
    .done(function(data){
      $('#results').html('');
      $('#results').html(data); 
    })
    .fail(function(){
      $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }

  function new_tax(){ 
    var name = $("#name").val();
    var percent = $("#percent").val(); 
    var tcode = $("#tcode").val();  
    $.ajax({
      url: 'tax_act.php',
      typr: 'POST',   
      data: { name:name,percent:percent, code:code,st:2 },
      dataType: 'html'
    })
    .done(function(data){
      console.log(data);
      $('#nresults').html('');
      $('#nresults').html(data);
      load_list("tax-res","tax_list.php");
    })
    .fail(function(){
      $('#nresults').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }

  

</script>

 