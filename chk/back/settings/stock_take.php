<?php
session_start();
include("../../inc/connection.php");
include('funcs.php');
$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$row = mysqli_fetch_assoc($get_gen_details);
?>
<!-- begin panel -->
<div class="panel panel-inverse" data-sortable-id="form-validation-2" style="width:500px;"> 
  <!-- begin panel-body -->
  <div class="panel-body "> 
    <div class="form-group row">
      <div id="results"></div>    
      <div class="col-md-12">
        <div class="radio radio-css m-15">
          <input type="radio" name="interval" id="days" value="" onclick="take(1,1);" />
          <label for="days">Day(s)<?php echo "check ".check_take(); ?></label>
        </div>
        <div class="form-group m-15" id="link-div" style="display:none;">
          <label class="col-form-label">Days* :</label> 
          <input class="form-control" type="text" id="day-input" name="day-input" value="" placeholder="input date" /> 
        </div>  
        <div class="radio radio-css m-15">
          <input type="radio" name="interval" id="weekly" value=""  onclick="take(2,7);"/>
          <label for="weekly">Weekly</label>
        </div>
        <div class="radio radio-css m-15">
          <input type="radio" name="interval" id="month" value=""  onclick="take(2,30);"/>
          <label for="month">Monthly</label>
        </div>  
    </div>   

                <div class="form-group">
                </div>
    </div>
  </div>
  <!-- end panel-body -->   
  <div class="panel-footer">
    <button type="button" name="tax-det" id="tax-det" class=" btn btn-lime btn-xs " style="margin-top: 10px;" onclick="save_take();">Save Details</button>
  </div>
</div>
<!-- end panel -->  
<script>
  function take(st,days){  
     if (st==1) {
      document.getElementById("link-div").style.display="block";
      $("#day-input").val(days); 
     }else{
      document.getElementById("link-div").style.display="none";
      $("#day-input").val(days); 
     }
  } 
 function save_take(){
  var days = $("#day-input").val(); 
  $.ajax({
    url: 'stock_take_act.php',
    typr: 'POST',                           
    data: 'days='+days,
    dataType: 'html'
  })
  .done(function(data){
    $('#results').html(''); // blank before load.
    $('#results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
  

</script>

 