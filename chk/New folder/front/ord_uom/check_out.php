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

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$mkt = $row['mkt'];
$day = $row['day'];

$action="LOADED|-|-|-|CHECK OUT MODAL FOR SALE ".$sale_id;
logs($action,"../../");  
?> 

<div class="modal-content" style="height: auto; width: auto;">
  <form method="POST" id="checkout">
    <input type="hidden"  class="form-control" value="<?php echo $reg; ?>" name="reg">
    <input type="hidden"  class="form-control" value="<?php echo $beba_sta; ?>" name="beba_sta">  
    <input type="hidden"  class="form-control" value="<?php echo $means; ?>" name="means">
    <input type="hidden"  class="form-control" value="<?php echo $deli; ?>" name="deli" id="deli">
    <input type="hidden"  class="form-control" value="<?php echo $disc; ?>" name="disc" id="disc">
    <input type="hidden" id="grand_total" class="form-control" value="<?php echo grand_total($sale_id)+$deli-$disc; ?>" name="grand_total">
    <input type="hidden" id="balance_two" class="form-control"  name="balance">
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
    <div class="modal-body" style="margin: 2px 2px;padding: 5px;">
      <div id="check-results"></div>
      <div style="padding: 1px 5px 5px 5px;">
        <?php
        $get_wallet = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE del_status=2") or die("Could not get the payment modes");
        while ($row=mysqli_fetch_assoc($get_wallet)) {
          $name=$row['name'];
          $color=$row['btn_color'];
          ?> 
          <div class="form-check-inline checkbox checkbox-css btn btn-xs" style="background-color:  <?php echo $color; ?>; width: auto; margin-right: 0.05rem;">
            <input type="checkbox" name="pay-mode[]" value="<?php echo $row['pay_id']; ?>" class="check" id="c<?php echo $row['pay_id']; ?>"  />
            <label for="c<?php echo $row['pay_id']; ?>" style="font-weight: bold; color: white;"> <?php  echo $name; ?></label>
          </div> 
          <?php
        }
        ?>
        <div class="form-check-inline checkbox checkbox-css btn btn-xs" style="background-color: purple; width: auto; margin-right: 0.05rem;">
          <input type="checkbox" name="pay-mode[]" value="sc" class="check" id="csc" onclick="cred();" />
          <label for="csc" style="font-weight: bold; color: white;"> STORE CREDIT</label>
        </div>   
      </div>
      <input type="hidden" id="pay" class="form-control"  name="pay"> 
      <?php
      $get_wallet = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE del_status=2") or die("Could not get the payment modes");
      while ($row=mysqli_fetch_assoc($get_wallet)) {
        $name=$row['name'];
        $color=$row['btn_color'];
        $has_ref=$row['has_ref'];
        $has_change=$row['has_change'];
        $pay_id=$row['pay_id'];
        ?>
        <div class="row" id="<?php echo $row['pay_id']; ?>"  style="display: none;">
          <?php 
          if ($has_ref==1) {
            ?>
            <div class="form-group has-success col-md-6">
              <label class=" control-label">CODE/NO/REF</label> 
              <input type="text" id="refid<?php echo $pay_id; ?>" class="form-control"  name="ref<?php echo $pay_id; ?>" value="0">
            </div>
            <?php
          }
          ?>
          <div class="form-group has-success col-md-6">
            <label class=" control-label"><?php echo $name; ?></label> 
            <input type="number" onkeyup="calculate(<?php echo $has_change; ?>);" id="nameid<?php echo $pay_id; ?>" class="form-control"  name="name<?php echo $pay_id; ?>" value="0"> 
          </div>
        </div> 
        <?php
      }
      ?>
      <div class="row" id="sc" style="display: none;"><!--  -->
        <div class="form-group has-success col-md-6">
          <label class=" control-label">STORE CREDIT(<?php echo cust_store_credit($cust_id); ?>)</label> 
          <input type="number" id="nameidsc" class="form-control"  name="namesc" value="0" readonly>
        </div>
      </div>
      <p id="c23"></p>
    </div>
    <div style="padding: 10px;">
      <?php
      if (empty($_REQUEST['deli'])) { 
      }else{
        ?>
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
        <?php
      }
      ?>
    </div>
    <div class="modal-footer" style="padding: 5px;">
      <!-- <a class="btn btn-primary" data-toggle="modal" data-target="#confirm-receipt" onclick="confirm_sale();" id="btn-priview">PREVIEW</a> -->
      <button type="button" data-dismiss="modal" class="btn btn-danger">CLOSE</button>
      <button type="button" name="place_order" id="place_order_button" disabled="true" class="btn btn-warning" onclick="place();">PLACE ORDER </button>
    </div>



</form> 

  

 </div> 

<script>
function place(){ 
  document.getElementById("place_order_button").disabled = true;
  var str = $( "#checkout" ).serialize(); 
  console.log(str);  //console.log(strs); 
  $.ajax({
    url: 'place_order.php',
    type: 'POST',                           
    data: str,
    dataType: 'html'
  })
  .done(function(data){
    $('#check-results').html(data);
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
  calculate(1); 
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



// if (balance >= 0) {

//   document.getElementById("place_order_button").disabled = false;

//   document.getElementById("btn-priview").disabled = false;

// } else{ 

//   document.getElementById("place_order_button").disabled = true;

//   document.getElementById("btn-priview").disabled = true;

// }

} 



</script>

