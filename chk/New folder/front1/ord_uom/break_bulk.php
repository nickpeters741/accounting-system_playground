<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id']; 
$item_id = $_REQUEST['item'];
$action="LOADED|-|-|-|ASSIGN UOM MODAL|";
logs($action,"../../");
?>
<div class="modal-content" style="width:350px;" >
 <!--  <div class="modal-header"> 
      <h4 class="modal-title" style="color:purple;">BREAK BULK </h4>
  </div> -->
  <div class="modal-body">
    <div id="uom-results"></div>
    <form id="bulk-form">
      <fieldset>
        <legend style="font-size:18px; font-weight: bold; color:purple;">CHOOSE BULK TO BREAK FOR <?php echo get_column('kp_items',"name","item_id='$item_id'"); ?></legend>
        <div class="form-group row"> 
          <div class=" col-md-12 row">
            <label  class="col-md-12"></label>

            <input type="hidden" class="form-control form-control-xs"  id="item" name="item" value="<?php echo $item_id; ?>" />
            <?php 

              $get_uom = mysqli_query($connection,"SELECT * FROM kp_uom WHERE qty!=1") or die("Could not get the uom");
              while ($uat = mysqli_fetch_assoc($get_uom)) {
                $uom_id=$uat['uom_id'];
                $column='uom'.$uom_id;

                $qty=$uat['qty'];
                $col        = "uom".$uat['uom_id']."qty";
                $uomstock   = get_column('kp_items',$col,"item_id='$item_id'");

                $item_query = "SELECT $column FROM kp_items WHERE item_id='$item_id'";
                $item_result = mysqli_query($connection,$item_query);
                $tow = mysqli_fetch_array($item_result);
                if ($tow[$column]==1) {
                  ?>
                  <div class="radio radio-css col-md-4" >
                    <input type="radio" id="<?php echo $uat['uom_id']; ?>" value="<?php echo $uat['uom_id']; ?>"  name="uom_id" <?php if ($uomstock<1) { echo "disabled";} ?> />
                    <label for="<?php echo $uat['uom_id']; ?>"><?php echo $uat['name']." ".$uat['qty'].get_column('kp_items',"uom","item_id='$item_id'");; ?></label> 
                  </div> 
                  <?php
                }
              }
            ?>  
          </div>
        </div>
      </fieldset>
    </form>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button> 
    <a class="btn btn-purple btn-xs" id="bulk-btn" onclick="update_bulk();">ASSIGN</a>
  </div>
</div>

<script type="text/javascript"> 
  function update_bulk(){
    var str = $( "#bulk-form" ).serialize(); 
    console.log(str); 
    $("#bulk_btn").attr("disabled",true);
    $.ajax({
      url: 'break_bulk_act.php',
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