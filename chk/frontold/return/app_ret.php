<?php 
session_start(); 
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];

$get_sale_Det = mysqli_query($connection , "SELECT * FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
$pr = mysqli_fetch_assoc($get_sale_Det); 
$sale_type = $pr['type']; 
$sale_bal = $pr['sale_bal'];

$action="LOADED|-|-|-|APPROVAL MODAL FOR RETUN".$ret_id;
logs($action,"../../");  
?>
<style type="text/css">
  .form-group{
    margin-bottom:0px;
  }
</style>
 <div class="modal-content" style="background-image: url(../../assets/img/bg/1D.jpg);"> 
  <div id="results"></div>

<div class="modal-header"> 
	<h4 class="modal-title">APPROVE RETURN ON SALE NO.<?php echo $sale_id .
$ret_amount=ret_total($ret_id);?> WITH RETURN NO.<?php echo $ret_id;?></h4>
</div>
<div id="app-results"></div>
  <!-- <form action="ret_item.php" id="ret-form" method="post"> -->
    <div class="modal-body"> 
        <div class="form-group row" style="margin-bottom:0px;">  
              <div class="form-group col-md-12" style="margin-bottom:0px;">
                <p style="color: red; margin-bottom:0px;">
                  NB: Dear Supervisor the decision yo make at tis level binds the whole order to you.
                </p>
              </div>
            </div>
            <div class="row">  
              <input type="hidden" class="form-control" id="sale_id" value="<?php echo $sale_id; ?>" name="sale_id"> 
 
          <div class="form-group col-md-7">
            <label>Enter Your Comments</label> 
            <textarea class="form-control" id="comm" name="comment"></textarea> 
          </div> 
            <div class="form-group col-md-6">
              <label for="sel1">Return Decision:</label>
              <div class="radio">
                <label><input type="radio" name="optradio"  value="1">Store Credit</label>
              </div>
              <div class="radio">
                <label><input type="radio" name="optradio"  value="2">Return Cash</label>
              </div>
              <!-- <div class="radio">
                <label><input type="radio" name="optradio"  value="2">Replace Item</label>
              </div> -->
            </div> 
            <div class="form-group col-md-8 col-sm-12">
                    <label >Bank to Draw</label>
                    <select class="form-control" id="bank" name="bank" onchange=""> 
            <option  value="">--------SELECT BANK-------</option>     <?php
          $bank = "SELECT * FROM kp_banks WHERE  del_status=2";
          $bank_r = mysqli_query($connection,$bank) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($bank_r)) {
              $name = $ct['acc_name'];
              $bank_id = $ct['bank_id'];
              ?>
              <option  value="<?php echo $bank_id; ?>"><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
                  </div>
          <div class="form-group col-md-7">
              <label for="usr">Supervisor/Admin Password:</label>
              <input type="Password" class="form-control" id="cabi" name="cabi"> 
          </div>
 
      </div> 
    <div class="modal-footer">
    	<a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
       <a name="btn-ret" id="btn-app" class="btn btn-xs btn-purple" onclick="app();">APPROVE</a> 
    </div>
  <!-- </form> -->
</div>
  
<script type="text/javascript"> 
 function app(){ 
  
      var sale_id = $("#sale_id").val();  
      var comment = $("#comm").val(); 
      var cabi = $("#cabi").val(); 
      var bank = $("#bank").val(); 
      var decision = $("input[name='optradio']:checked").val(); 
      console.log(decision); 
         $.ajax(
         {
            url: 'app_ret_act.php',
            typr: 'POST',
            data: 'sale_id='+sale_id+'&comment='+comment+'&cabi='+cabi+'&decision='+decision+'&bank_id='+bank,
            dataType: 'html'
         })
        .done(function(data){ 
          console.log(data);
            $('#app-results').html(''); // blank before load.
            $('#app-results').html(data); 
             
        })
         .fail(function()
         {
            $('#app-results').html('<i class="fa  fa-info-sign"></i> Something went wrong.....');
            $('#modal-loader').hide();
         }); 
      } 
</script> 
