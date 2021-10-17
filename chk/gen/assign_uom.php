<?php
session_start();
include('../inc/connection.php');
include('../inc/gen_funcs.php');
$user_id = $_SESSION['user_id']; 
$item_id = $_REQUEST['item'];
$action="LOADED|-|-|-|ASSIGN UOM MODAL|";
logs($action,"../../");
?>
<div class="modal-content" style="width:350px;" >
  <div class="modal-header"> 
      <h4 class="modal-title">ASSIGN UOM TO <?php echo get_column('kp_items',"name","item_id='$item_id'"); ?></h4>
  </div>
  <div class="modal-body">
    <div id="uom-results"></div>
    <form id="uom-form">
      <fieldset>
        <legend style="font-size:18px; color:purple;">Unit Of Measure</legend>
        <div class="form-group row">
          <div class="col-md-12">
            <label >UOM</label>
            <input type="text" class="form-control form-control-xs"  id="uom" name="uom" placeholder="Enter the UOM....." required />
            <input type="hidden" class="form-control form-control-xs"  id="item" name="item" value="<?php echo $item_id; ?>" />
          </div>
          <div class=" col-md-12 row">
            <label  class="col-md-12">How to Sell</label>
            <?php
              $get_uom = mysqli_query($connection,"SELECT * FROM kp_uom") or die("Could not get the uom");
              while ($uat = mysqli_fetch_assoc($get_uom)) {
                $qty=$uat['qty'];
            ?>
            <div class="checkbox checkbox-css col-md-4" >
              <input type="checkbox" id="<?php echo $uat['uom_id']; ?>" <?php if($qty==1){ echo "checked"; } ?> value="<?php echo $uat['uom_id']; ?>"  name="uom_id[]" />
              <label for="<?php echo $uat['uom_id']; ?>"><?php echo $uat['name']; ?></label>
            </div> 
            <?php
              }
            ?>  
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button> 
    <a class="btn btn-purple btn-xs" onclick="update_uom();">ASSIGN</a>
  </div>
</div>

<script type="text/javascript"> 
  function update_uom(){
    var str = $( "#uom-form" ).serialize();  
    $("#assing_btn").attr("disabled",true);
    $.ajax({
      url: '../../gen/assign_uom_act.php',
      type: 'POST',                           
      data: str,
      dataType: 'html'
    })
    .done(function(data){
      //console.log(data);
      $('#uom-results').html(data);
    })
    .fail(function(){
      $('#item-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
</script>