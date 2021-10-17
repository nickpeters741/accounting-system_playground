<?php 
include("../../inc/connection.php"); 
include('../clude/funcs.php');
$item_id = $_REQUEST['it'];
$sale_id = $_REQUEST['id'];
 
$link=""; 
$get_price = mysqli_query($connection , "SELECT qty,price,disc FROM kp_sale_items WHERE sale_id='$sale_id' AND item_id='$item_id'") or die(mysqli_error($connection));
$pr = mysqli_fetch_assoc($get_price);
$price = $pr['price'];
$disc = $pr['disc'];
$ord_qty = $pr['qty'];   

$get_returned= mysqli_query($connection,"SELECT sum(qty) as qty FROM kp_ret_items WHERE sale_id='$sale_id' AND item_id='$item_id'"); 
$tow = mysqli_fetch_assoc($get_returned);
$rqty=$tow['qty'];
$ord_qty=$ord_qty-$rqty; 

?>
<style type="text/css">
  .form-group{
    margin-bottom:0px;
  }
</style>
<div class="modal-content"> 
  <div id="results"></div>
  <div class="modal-header"> 
    <h4 class="modal-title">RETURN <?php echo get_item($item_id);?></h4>
  </div>
  <div class="modal-body">
    <div class="form-group row" style="margin-bottom:0px;">  
      <div class="form-group col-md-12" style="margin-bottom:0px;">
        <p style="color: red; margin-bottom:0px;">
          NB: Remember to check the product status and a valid reason from the customer.
        </p>
      </div>
    </div>
    <div class="row">
      <div class="form-group col-md-12">
       <div class="radio radio-css radio-inline">
        <input type="radio" name="reason" id="war" value="1"/>
        <label for="war" style="color:blue;">Warranty</label>
      </div>
      <div class="radio radio-css radio-inline">
        <input type="radio" name="reason" id="wro" value="2"/>
        <label for="wro"  style="color:blue;">Wrong Item</label>
      </div> 
      <div class="radio radio-css radio-inline">
        <input type="radio" name="reason" id="oth" value="3"/>
        <label for="oth"  style="color:blue;">Others</label>
      </div>  
    </div> 
  </div>

  <div class="form-group col-md-12" id="warr-div" style="display: none;"> 
    <label class="col-md-12">Whose Fault</label>  
    <div class="radio radio-css radio-inline">
      <input type="radio" name="fault" id="manu" value="1"/>
      <label for="manu" style="color:blue;">Manufacturer</label>
    </div>
    <div class="radio radio-css radio-inline">
      <input type="radio" name="fault" id="cust" value="2"/>
      <label for="cust"  style="color:blue;">Customer</label>
    </div>    
  </div>

  <div class="form-group col-md-12" id="others-div" style="display: none;"> 
    <label class="col-md-12"></label>  
    <div class="radio radio-css radio-inline">
      <input type="radio" name="more" id="excss" value="1"/>
      <label for="excss" style="color:blue;">In Excess</label>
    </div>
    <div class="radio radio-css radio-inline">
      <input type="radio" name="more" id="nodeli" value="2"/>
      <label for="nodeli"  style="color:blue;">Not Delivered</label>
    </div>    
  </div>

<div class="form-group col-md-12" id="common-div" style="display: none;"> 
    <div class="form-group col-md-6">
        <label for="sel1">Product Status:</label>
        <select class="form-control selectpicker" id="wr-status" name="wr-status" onchange="status_select();">
        <option value="0">----SELECT PRODUCT STATUS------</option> 
          <option value="1">Good/Working</option>
          <option value="2">Scratched (Stockable)</option>
          <option value="3">Scratched (Unstockable)</option> 
          <option value="4">Broken</option>
        </select>
      </div> 

      <div class="form-group col-md-12" id="comment-div" style="display: none;">
        <label>Return Staff Comments</label> 
        <textarea class="form-control" id="stacomment" name="stacomment" onkeyup="comment();" ></textarea>
        <p id="commentstatus" style="color: red;"></p> 
      </div>

       <div class="form-group col-md-6" id="qty-div" style="display: none;">
        <label for="usr">Quantity:</label>
        <input  class="form-control" id="qty" name="qty" onkeyup="qty_status();" type="text" onkeypress="return isNumberKey(event)">
        <p id="qtstatus" style="color: red;"></p>
        <input type="hidden" class="form-control" id="item_id" value="<?php echo $item_id; ?>" name="item_id">
        <input type="hidden" class="form-control" id="sale_id" value="<?php echo $sale_id; ?>" name="sale_id"> 
      </div>

  </div>

  <div class="form-group col-md-12" id="div-cust" style="display: none;"> 
      <h2 style="color: red">CUSTOMER TO PAY OR GIVE BACK PRODUCT</h2>
    </div> 
  </div> 
  <div class="modal-footer">
    <a href="javascript:;" class="btn btn-sm btn-danger btn-xs" data-dismiss="modal">Close</a>
    <a name="btn-ret" id="btn-ret" class="btn btn-sm btn-success btn-xs" onclick="war_return();" style="display: none;">RETURN</a>
    <a name="btn-revoke" id="btn-revoke" class="btn btn-sm btn-purple btn-xs" style="display: none;">REVOKE WARRANTY</a>
  </div>
</div>
<script type="text/javascript">
   function qty_status() { 
    var oqty = '<?php echo $ord_qty; ?>';  
    var qty=document.getElementById("qty").value; 
    if (qty==0 ||  qty == "" ||  qty == null || qty<0){ 
      document.getElementById("btn-ret").disabled = true;  
      document.getElementById("qtstatus").innerText = "Error!! Insert the right qty";
      document.getElementById("qtstatus").style.color = "red";
      document.getElementById('btn-ret').style.display = 'none';   
    } else if (parseInt(qty)>parseInt(oqty)){ 
      document.getElementById("btn-ret").disabled = true;  
      document.getElementById("qtstatus").innerText = "Error!! Insert the right qty";
      document.getElementById("qtstatus").style.color = "red";
      document.getElementById('btn-ret').style.display = 'none';   
    } else {
      document.getElementById("btn-ret").disabled = false;
      document.getElementById("qtstatus").innerText = ""; 
      document.getElementById("qtstatus").innerText = "Quantity!! OK";
      document.getElementById("qtstatus").style.color = "green";
      document.getElementById('btn-ret').style.display = 'block';    
    }
  }

   $('input[name="reason"]').change(function () {
    var xid=$(this).val(); 
    if (xid==1) {
      document.getElementById('others-div').style.display = 'none';
      document.getElementById('common-div').style.display = 'none';
      document.getElementById('warr-div').style.display = 'block';
    }else if (xid==2) {
      document.getElementById('others-div').style.display = 'none';
      document.getElementById('common-div').style.display = 'block';
      document.getElementById('warr-div').style.display = 'none';
    }else if (xid==3) {
      document.getElementById('warr-div').style.display = 'none';
      document.getElementById('common-div').style.display = 'none';
      document.getElementById('others-div').style.display = 'block';

    }else{

    }  
  }); 

   $('input[name="fault"]').change(function () {
    var fid=$(this).val(); 
    if (fid==1) { 
      document.getElementById('div-cust').style.display = 'none';
      document.getElementById('common-div').style.display = 'block';  
      document.getElementById('btn-revoke').style.display = 'none';

    }else if (fid==2) { 
      document.getElementById('div-cust').style.display = 'block';
      document.getElementById('common-div').style.display = 'none';
      document.getElementById('btn-revoke').style.display = 'block'; 
    }  
  });
 $('input[name="more"]').change(function () {
    var fid=$(this).val(); 
    if (fid==1) { 
      document.getElementById('div-cust').style.display = 'none';
      document.getElementById('common-div').style.display = 'block';  
      document.getElementById('btn-revoke').style.display = 'none';

    }else if (fid==2) { 
      
      document.getElementById('div-cust').style.display = 'none';
      document.getElementById('common-div').style.display = 'block';  
      document.getElementById('btn-revoke').style.display = 'none'; 
    }  
  });
  function war_return(){ 
    //var imei = <?php echo $imei; ?>;
    var qty = $("#qty").val();
    var item_id = $("#item_id").val();
    var sale_id = $("#sale_id").val();
    var fault = $('input[name="fault"]').val();
    var reason =$('input[name="reason"]').val();
    var status = $("#wr-status").val();
    var stacomment = $("#stacomment").val();   
     $.ajax({
      url: 'ret_item.php',
      typr: 'POST',
      data: 'item_id='+item_id+'&sale_id='+sale_id+'&qty='+qty+'&stacomment='+stacomment+'&reason='+reason+'&status='+status,//+'&imei='+imei,
      dataType: 'html'
    })
    .done(function(data){
      console.log(data);
      $('#ret-results').html(''); // blank before load.
      $('#ret-results').html(data);   
      $('#ret-modal').modal('toggle');
      $('#div-imei').html(data);
      ret_items();
    })
    .fail(function(){
      $('#ret-results').html('<i class="fa  fa-info-sign"></i> Something went wrong.....');
      $('#modal-loader').hide();
    }); 
  }
function status_select(){
  var status = document.getElementById("wr-status").value;
    console.log(status);
  if(status == 0){ 
    document.getElementById('comment-div').style.display = 'block';
  } else if(status == 1) { 
    document.getElementById('comment-div').style.display = 'block';
  } else if (status == 2) {

  } else if (status == 3) {
    
  } else if (status == 4) {
    
  }
}

function comment(){  
  if (document.getElementById("stacomment").value.length >=5){ 
    document.getElementById('qty-div').style.display = 'block';

      document.getElementById("commentstatus").innerText = "";
  } else {
    document.getElementById('qty-div').style.display = 'none';

      document.getElementById("commentstatus").style.color = "red";
      document.getElementById("commentstatus").innerText = "Comment Should Be More than 5 letters!!";
  }
}
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
 
</script> 
