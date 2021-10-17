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
            <input type="hidden" class="form-control form-control-xs"  id="item" name="item" value="<?php echo $item_id; ?>" />

            <div class="col-md-12">
            <label>Select Tax</label> 
            <select type="text" class="form-control form-control-xs"  id="break_item" name="break_item" style="width: 100%; height: 25px;">
              <option  value="0">---SELECT ITEM TO BREAK----</option>
              <?php
                $get_tax = mysqli_query($connection,"SELECT * FROM kp_items WHERE break_item='$item_id'") or die("Could not get the break items");
                while ($tat = mysqli_fetch_assoc($get_tax)) {
              ?>
              <option  value="<?php echo $tat['item_id']; ?>"> <?php echo $tat['name']." ".$tat['pcs']." Pcs"; ?> </option>
              <?php
                }
              ?> 
            </select>    
          </div>   
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