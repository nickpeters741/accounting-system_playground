<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$today = date('Y-m-d');
$cust_id = $_REQUEST['cust_id'];
$amount = $_REQUEST['amount']; 
$action="LOADED|-|-|-|PAYMENT MODAL FOR CREDIT SALE PAYMENT";
logs($action,"../../");  
?>
<div class="modal-content"style="height: auto; width: auto;">
  <!-- <form method="POST" id="checkout" action="pay.php"> -->
  <div id="pay-res"></div>
  <form id="quick-form" name="quick">
    <input type="hidden"  class="form-control" value="<?php echo $cust_id; ?>" name="cust_id" id="cust_id">
    <?php
    if (isset($_REQUEST['invoices'])) {
      $invoices = $_REQUEST['invoices'];  
      ?>
      <input type="hidden"  class="form-control" value="<?php echo $invoices; ?>" name="invoices" id="invoices">
      <?php
    }else{
      ?>
      <input type="hidden" id="pay" class="form-control"  name="pay" value="pay">
      <?php
    }
    ?>
    <input type="hidden" id="grand_total" class="form-control" value="<?php echo $amount; ?>" name="grand_total">
    <input type="hidden" id="balance_two" class="form-control"  name="balance">
    <input type="hidden" id="tendered" class="form-control"  name="tendered"> 
    <div class="modal-header"> 
      <div class="row row-table text-center">
        <div class="col-md-12">
          <h4>TAKE PAYMENT FOR <?php echo get_cust($cust_id).$cust_id; ?></h4>
        </div>
        <div class="col-md-3">
          <p class="m0 h4"><?php echo $amount; ?></p>
          <p class="m0 text-muted">INV BALANCE</p>
        </div> 
        <div class="col-md-3">
          <input type="text" id="total_received" class="form-control" name="total_received" disabled="true">
          <p class="m0 text-muted">Tendered</p>
        </div>
        <div class="col-md-3">
          <input type="" id="balance" class="form-control"  name="balance" disabled="true">
          <p class="m0 text-muted">BALANCE</p>
        </div>
      </div>
    </div>
   <?php 
include('../gen/payment_gen.php'); 
?>
       
      <div class="modal-footer" style="padding: 5px;"> 
        <button type="button" data-dismiss="modal" class="btn btn-danger btn-xs">CLOSE</button>
        <!-- <button type="submit" id="main-btn" disabled="true" class="btn btn-purple btn-xs">TAKE PAYMENT</button> -->
        <a id="main-btn" class="btn btn-purple btn-xs" style="display: none;" disabled="true">TAKE PAYMENT</a>
      </div>
    </form>  
  </div>
  <script>
    $("#main-btn").one('click', function (event) {  
     event.preventDefault();
     $(this).prop('disabled', true);
     var array = [];
      $("input[class=check]:checked").each(function() { 
        array.push($(this).val()); 
      });  
      document.getElementById("main-btn").style.display = 'none';  
      var str = $('form[name="quick"]').serializeArray();  
      $.ajax({
        url: 'pay.php',
        type: 'POST',                           
        data: str,
        dataType: 'html'
      })
      .done(function(data){
        $('#pay-res').html(data);
        location.reload(); 
      })
      .fail(function(){
        $('#pay-res').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
      });
    });
    // function sub_form(){ 
    //   var array = [];
    //   $("input[class=check]:checked").each(function() { 
    //     array.push($(this).val()); 
    //   }); 
    //   $('#main-btn').prop('disabled', true);
    //   document.getElementById("main-btn").disabled =true;
    //   document.getElementById("main-btn").style.display = 'none';  
    //   var str = $('form[name="quick"]').serializeArray();  
    //   $.ajax({
    //     url: 'pay.php',
    //     type: 'POST',                           
    //     data: str,
    //     dataType: 'html'
    //   })
    //   .done(function(data){
    //     $('#pay-res').html(data);
    //     $('#modal').modal('toggle'); 
        
    //   })
    //   .fail(function(){
    //     $('#pay-res').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    //   });
    // } 
    $('input[name="pay-mode[]"]').change(function () {
      var pid=$(this).val();
      if (this.checked) {
        document.getElementById("main-btn").disabled = true; 
        document.getElementById(pid).style.display = 'flex';
        document.getElementById(pid).value = 0;
      } else {
        document.getElementById(pid).value = 0; 
        document.getElementById(pid).style.display ='none' ;
        calculate();
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
        $('#c1').html('');
        $('#c1').html(data);
      })
      .fail(function(){
        $('#c1').html('');
        $('#c1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      });
    }
    function cred(){
      var store_credit =parseInt(document.getElementById('nameidsc').value);
      var new_total =parseInt(document.getElementById('grand_total').value);
      if (store_credit>new_total) {
        document.getElementById('nameidsc').value=new_total; 
      } else if (store_credit==new_total) {
        document.getElementById('nameidsc').value=new_total;
      } else if (store_credit<new_total) {
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
      for (var i = 0; i < arrayLength; i++){
        var id='nameid'+array[i];
        var amount=document.getElementById(id).value; 
        total=parseFloat(total)+parseFloat(amount);
      }
      var new_total =parseFloat(document.getElementById('grand_total').value);  
      document.getElementById('total_received').value = total; 
      document.getElementById('tendered').value = total; 
      balance = total - new_total; 
      document.getElementById('balance').value = balance;
      document.getElementById('balance_two').value = balance; 
      if (arrayLength==1) { 
        if (balance <= 0) { 
          $('#main-btn').attr("disabled", false);  
          document.getElementById("main-btn").style.display = 'block';  
        } else{ 
          document.getElementById("main-btn").disabled =true;
          document.getElementById("main-btn").style.display = 'none'; 
        } 
      }else{
        if (balance <=0) {
          document.getElementById("main-btn").style.display = 'block'; 
          document.getElementById("main-btn").disabled = false; 
        } else{ 

          document.getElementById("main-btn").style.display = 'none'; 
          document.getElementById("main-btn").disabled = true; 
        }
      } 
    }
  </script>

