<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$today = date('Y-m-d');
$deli = $_REQUEST['deli'];
$reg = $_REQUEST['reg'];
$beba_sta = $_REQUEST['beba_sta'];
$means = $_REQUEST['means'];
$disc = $_REQUEST['disc'];

$vatable = $_REQUEST['vatable'];  
$vatt = $_REQUEST['vatt'];  
$tax = $_REQUEST['tax'];

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$mkt = $row['mkt'];
$day = $row['day'];

$action="LOADED|-|-|-|CHECK OUT MODAL FOR SALE ".$sale_id;
logs($action,"../../"); 
$bill_total= grand_total($sale_id)+$deli-$disc ;
?> 

<div class="modal-content" style="height: auto; width: auto;">
  <form method="POST" id="checkout">
    <input type="hidden"  class="form-control" value="<?php echo $reg; ?>" name="reg">
    <input type="hidden"  class="form-control" value="<?php echo $beba_sta; ?>" name="beba_sta">  
    <input type="hidden"  class="form-control" value="<?php echo $means; ?>" name="means">
    <input type="hidden"  class="form-control" value="<?php echo $deli; ?>" name="deli" id="deli">
    <input type="hidden"  class="form-control" value="<?php echo $disc; ?>" name="disc" id="disc">
    <input type="hidden"  class="form-control" value="<?php echo $bill_total; ?>" name="grand_total" id="grand_total">
    <input type="hidden"  class="form-control" value="<?php echo $vatable; ?>" name="vatable" id="vatable">
    <input type="text"  class="form-control" value="<?php echo $vatt; ?>" name="vatt" id="vatt">
    <input type="text"  class="form-control" value="<?php echo $tax; ?>" name="tax" id="tax">
    <input type="text" id="balance_two" class="form-control"  name="balance">
    <div class="modal-header"> 
      <div class="row row-table text-center">
        <div class="col-md-3">
          <p class="m0 h4"><?php echo  grand_total($sale_id)."+".$deli; ?></p>
          <p class="m0 text-muted">TOTAL+DELIVERY</p>
        </div>
        <div class="col-md-3">
          <p class="m0 h4"><?php echo $disc; ?></p> 
          <p class="m0 text-muted">DISCOUNT</p>
        </div>
        <div class="col-md-3">
          <input type="" id="total_received" class="form-control"  name="total_received" disabled="true">
          <p class="m0 text-muted">SUB-TOTAL</p>
        </div>
        <div class="col-md-3">
          <input type="" id="balance" class="form-control"  name="balance" disabled="true">
          <p class="m0 text-muted">BALANCE</p>
        </div>
      </div>
    </div>
    <?php
include('../gen/payment_gen.php'); 
      if (empty($_REQUEST['deli'])) { 
      }else{
        ?>
        <div style="padding: 10px;">
          <table class="table table-bordered">
            <tbody>
              <tr>
                <td colspan="2" style="font-size: 14px; color: red;"><b>Delivery By</b></td>
                <td colspan="2" style="font-size: 14px; color: red;"><b>Means</b></td>
                <td style="font-size: 14px; color: red;"><b>Registration</b></td>
                <td style="font-size: 14px; color: red;"><b>Amount</b></td>
              </tr>
              <tr>
                <td colspan="2"><?php echo get_beba($beba_sta) ?></td>
                <td colspan="2"><?php echo get_means($means) ?></td>
                <td><?php echo $reg ?></td>
                <td><?php echo $deli ?></td>
              </tr>
            </tbody>
          </table>
        </div>
        <?php
      }
      ?>
    <div class="modal-footer" style="padding: 5px;">
      <!-- <a class="btn btn-primary" data-toggle="modal" data-target="#confirm-receipt" onclick="confirm_sale();" id="btn-priview">PREVIEW</a> -->
      <button type="button" data-dismiss="modal" class="btn btn-xs btn-danger">CLOSE</button>
      <button type="button" name="place_order" id="place_order_button" disabled="true" class="btn btn-xs btn-purple" onclick="place();">PLACE ORDER </button>
    </div>



</form> 
</div> 

<script>
function mpesasearch(id){
  var search=$('#mpesaphone').val();
  $.ajax({
    url: '../gen/mpesa_check.php',
    type: 'POST',                           
    data:  {id:id,search:search} ,
    dataType: 'html'
  })
  .done(function(data){ 
    //console.log(search);
    $('#mpesarows').html(data); 
  })
  .fail(function(){ 
      var hulla = new hullabaloo(); 
      hulla.send('</a><strong>Warning!</strong> Error occured!!! Contact Developer with Mpesa error.', "danger"); 
  });
}
function place(){ 
  document.getElementById("place_order_button").disabled = true;
  var str = $( "#checkout" ).serialize();
  console.log(str);
  $.ajax({
    url: 'place_order.php',
    type: 'POST',                           
    data: str,
    dataType: 'html'
  })
  .done(function(data){
    $('#check-results').html(data);
    console.log(data);
    //$('#modal').modal('toggle'); 
  })
  .fail(function(){
    $('#check-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
$('input[name="pay-mode[]"]').change(function () {
  var pid= $(this).val();
  var npid="nameid"+$(this).val();
  console.log(pid);
  if (this.checked) {
    document.getElementById("place_order_button").disabled = true;
    //document.getElementById("btn-priview").disabled = true;
    document.getElementById(pid).style.display = 'flex';
    //document.getElementById(npid).value = 0; 
  } else {
    document.getElementById(pid).style.display ='none' ;
    document.getElementById(npid).value = 0;
    calculate()
  }
}); 
function confirm_sale(){ 
  $.ajax({
    url: 'confirm_sale.php',
    type: 'POST',
    data: '',
    dataType: 'html'
  })
  .done(function(data){
    $('#c1').html(''); // blank before load.
    $('#c1').html(data); // blank before load.
  })
  .fail(function(){
    $('#c1').html(''); // blank before load.
    $('#c1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function cred(){
  document.getElementById('nameidsc').value=<?php echo cust_store_credit($cust_id); ?>;
  var store_credit =parseInt(document.getElementById('nameidsc').value);
  var new_total =parseInt(document.getElementById('grand_total').value);
  if (store_credit>new_total) {
    document.getElementById('nameidsc').value=new_total; 
    document.getElementById("place_order_button").disabled = false;
  } else if (store_credit==new_total) {
    document.getElementById('nameidsc').value=new_total;
    document.getElementById("place_order_button").disabled = false;
  } else if (store_credit<new_total) { 
    document.getElementById("place_order_button").disabled = true; 
    document.getElementById('nameidsc').value=store_credit;
  }
  calculate(2); 
} 
function calculate(change){
  var balance; 
  var total=0; 
  var array = [];
  $("input[class=check]:checked").each(function() { 
    array.push($(this).val()); 
  }); 
  var arrayLength = array.length;
  for (var i = 0; i < arrayLength; i++) {
    var id='nameid'+array[i];
    var amount=document.getElementById(id).value; 
    total=parseInt(total)+parseInt(amount);
  }
  var new_total =parseInt(document.getElementById('grand_total').value);  
  document.getElementById('total_received').value = new_total;
  balance = total - new_total;
  document.getElementById('balance').value = balance;
  document.getElementById('balance_two').value = balance; 
  if (arrayLength==1) {
    if (change==1) {
      if (balance >= 0) {
        document.getElementById("place_order_button").disabled = false;
        //document.getElementById("btn-priview").disabled = false;
      } else{ 
        document.getElementById("place_order_button").disabled = true;
        //document.getElementById("btn-priview").disabled = true;
      }
    }else{
      if (balance == 0) {
        document.getElementById("place_order_button").disabled = false;
        //document.getElementById("btn-priview").disabled = false;
      } else{ 
        document.getElementById("place_order_button").disabled = true;
        //document.getElementById("btn-priview").disabled = true;
      }
    }
  }else{
    if (balance == 0) {
      document.getElementById("place_order_button").disabled = false;
      //document.getElementById("btn-priview").disabled = false;
    } else{ 
      document.getElementById("place_order_button").disabled = true;
      //document.getElementById("btn-priview").disabled = true;
    }
  }
} 
</script>

