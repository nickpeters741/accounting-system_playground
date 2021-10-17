<?php
include("../../inc/connection.php");
if(isset($_REQUEST['item_id'])){
  $id = $_REQUEST['item_id'];
  $item_details = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$id'")or die(mysqli_error($connection));
  $itd = mysqli_fetch_assoc($item_details);
  $base_price = $itd['base_price'];
  $bprice = $itd['bprice'];
  $wprice = $itd['wprice'];   
  $max_price = $itd['max_price'];
  $name=strtoupper($itd['name']);
 
?>
<div class="modal-content">
  <div id="price-results"></div>
  <div class="modal-header">
    <h4 class="modal-title"> <strong> ADJUST PRICE FOR  </strong> <?php echo $name; ?></h4> 
  </div>
  <div class="modal-body">
    <div class="form-group row">
      <div class="form-group col-md-6">
          <label >Cost Price</label>
          <input type="text" class="form-control" name="cost-price" id="cost-price" value="<?php echo $bprice; ?>"  />
      </div>
      <div class="form-group col-md-6">
          <label >Base Price</label>
          <input type="text" class="form-control" name="base-price" id="base-price" value="<?php echo $base_price; ?>"  />
      </div>
      <div class="form-group col-md-6">
          <label >Wholesale Price</label>
          <input type="text" class="form-control" name="wprice" id="wprice" value="<?php echo $wprice; ?>"  />
      </div> 
      <div class="form-group col-md-6">
          <label >Selling Price</label>
          <input type="text" class="form-control" name="sprice" id="sprice" value="<?php echo $max_price; ?>"  />
      </div> 
      <div class="form-group col-md-12">
        <label >Reason</label>
        <textarea name="reason" class="form-control" placeholder="Reason" id="reason"> </textarea>
      </div> 
      <div class="form-group col-md-12">
        <label >Supervisor Password</label>
        <input type="password" name="cabi" class="form-control" placeholder="ENTER SUPERVISOR PASSWORD" id="cabi"> </textarea>
      </div>  
    </div>
  </div>
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    <button type="button" name="adj_price" id="adj_price" class="btn btn-sm btn-success">Save</button>
  </div>
</div>

<script type="text/javascript">
// document.getElementById('cabi').addEventListener('onkeyup', pass);
// function pass(){
//   document.getElementById("adj_price").disabled =false;
// }

document.getElementById('adj_price').addEventListener('click', adjust);
  function adjust(){
    var init = '<?php echo $max_price; ?>';
    var base = $("#base-price").val();
    var wprice = $("#wprice").val();  
    var sprice = $("#sprice").val(); 
    var bprice = $("#bprice").val(); 
    var item_id = '<?php echo $id; ?>';
    var cabi = $("#cabi").val();
    var reason = $("#reason").val();  
    $.ajax({
      url: '../gen/price_adj_act.php',
      typr: 'POST',                           
      data: 'init='+init+'&sprice='+sprice+'&wprice='+wprice+'&bprice='+bprice+'&base='+base+'&item_id='+item_id+'&reason='+reason+'&cabi='+cabi,
      dataType: 'html'
    })
    .done(function(data){
        $('#price-results').html(''); // blank before load.
        $('#price-results').html(data);
    })
    .fail(function(){
      $('#price-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }
</script> 
<?php
}
?>