<?php
include("../../inc/connection.php");
include('../../inc/gen_funcs.php'); 
if(isset($_REQUEST['item_id'])){
  $id = $_REQUEST['item_id'];
  $item_details = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$id'")or die(mysqli_error($connection));
  $itd = mysqli_fetch_assoc($item_details);
  $qty = $itd['qty'];
  $name=strtoupper($itd['name']);
}
?>
<div class="modal-content"  style="width:350px;">
  <div id="qty-results"></div>
  <div class="modal-header">
    <h4 class="modal-title"> <strong> ADJUST STOCK FOR  </strong> <?php echo $name; ?></h4> 
  </div>
  <div class="modal-body">
    <form id="bulk-form">
      <div class="form-group row">
        <div class="form-group col-md-12">
          <label >TOTAL QTY</label>
          <input type="text" class="form-control" name="new-qty" id="new-qty" value="<?php echo $qty; ?>"  />
          <input type="hidden" class="form-control" name="init-qty" id="init-qty" value="<?php echo $qty; ?>"  />
          <input type="hidden" class="form-control" name="item_id" id="item_id" value="<?php echo $id; ?>"  />
        </div>
        <div class="form-group col-md-12">
          <label >Reason</label>
          <textarea name="reason" class="form-control" placeholder="Reason" id="reason"> </textarea>
        </div>
        <div class="form-group col-md-12">
          <label >Supervisor Password</label>
          <input type="password" name="cabi" class="form-control form-control-xs" placeholder="ENTER SUPERVISOR PASSWORD" id="cabi" onkeyup="pass();"> 
        </div> 
      </div>
    </form>   
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
    <button type="button" name="adj_qty" id="adj_qty" class="btn btn-xs btn-success" disabled="true">Save</button>
  </div>
</div>

<script type="text/javascript">
  function pass(){
    document.getElementById("adj_qty").disabled =false;
  }
document.getElementById('adj_qty').addEventListener('click', adjust);  
  function adjust(){
    var str = $( "#bulk-form" ).serialize(); 
    $("#adj_qty").attr("disabled",true);
    $.ajax({
      url: '../gen/qty_adj_act.php',
      type: 'POST',                           
      data: str,
      dataType: 'html'
    })
    .done(function(data){ 
      console.log(data);
      $('#qty-results').html(data);
    })
    .fail(function(){
      $('#qty-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }  
  
</script> 