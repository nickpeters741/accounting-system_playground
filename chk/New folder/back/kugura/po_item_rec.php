<?php
include("../../inc/connection.php"); 
include("funcs.php");
$id = $_REQUEST['id'];
$item_id = $_REQUEST['item'];
$get_po_details = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$id' AND item_id='$item_id'") or die("Could not get the purchase details ");
$row = mysqli_fetch_assoc($get_po_details);
$qty = $row['qty'];
$rec_qty = $row['rec_qty'];
$price= $row['price']; 
?>
<div class="modal-content " style="width: 350px;">
  <div id="result"></div>
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h4 class="modal-title">
        <i class="fa fa-stats"></i> &nbsp;&nbsp;RECEIVE <?php echo get_item($item_id); ?>
      </h4>
    </div>  
    <div class="modal-body">
      <div id="results"></div>
      <div class="form-group col-md-12">
        <label >Quantity</label> 
          <input class="form-control" type="text" id="qty"  name="qty" value="<?php echo $qty-$rec_qty; ?>" />  
      </div>
      <div class="form-group col-md-12">
        <label >Price</label> 
          <input type="text" class="form-control" id="price" name="price" value="<?php echo $price; ?>" /> 
      </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">CLOSE</button> 
      <button id="btn-confirm" class="btn btn-warning pull-right btn-xs">CONFIRM</button>
    </div>
  </div>   
   <!--  </form>  -->
<script type="text/javascript"> 
$(document).ready(function() {
    $(document).on('click','#btn-confirm', function(e){
    e.preventDefault(); 
    var item='<?php echo $item_id; ?>'; 
    var price=$("#price").val();
    var qty=$("#qty").val();;
    $('#results').html(''); // leave this diff blank 
    $.ajax({
      url: 'po_item_rec_act.php',
      typr: 'POST',
      data: 'item='+item+'&price='+price+'&qty='+qty,
      dataType: 'html'
  })
    .done(function(data){  
    $('#results').html(data);
  })
    .fail(function(){
      $('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  });
});
</script>