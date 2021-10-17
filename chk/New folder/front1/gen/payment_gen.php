<?php
session_start();
include('../../inc/connection.php'); 
?>
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
            <label for="c<?php echo $row['pay_id']; ?>" style="font-weight: bold; color: white;">&nbsp; <?php  echo $name; ?></label>
          </div> 
          <?php
        }
        ?>
        <div class="form-check-inline checkbox checkbox-css btn btn-xs" style="background-color: purple; width: auto; margin-right: 0.05rem;">
          <input type="checkbox" name="pay-mode[]" value="sc" class="check" id="csc" onclick="cred();" />
          <label for="csc" style="font-weight: bold; color: white;">&nbsp; STORE CREDIT</label>
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
        $gate=$row['gate'];
        $table=$row['tabl'];
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
          <?php

        if ($gate==1) {
          ?>
          <input type="hidden" id="gate-input<?php echo $pay_id; ?>" class="form-control"  name="gate" value="<?php echo $gate; ?>"> 
          <div class="form-group has-success col-md-12">
            <table id="data-table-combine" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th colspan="5">  
                      <input type="text"  class="form-control pull-right" id="mpesaphone"  placeholder="ENTER PHONE NUMBER TO SEARCH" style="width: 60%;" onkeyup="mpesasearch(<?php echo $pay_id; ?>)"> 
                     
                  </th>
                </tr>
                <tr>
                  <th>Select</th> 
                  <th>Code.</th>
                  <th>Name.</th>
                  <th>Amount</th>
                  <th>Time</th>  
                </tr>
              </thead>
              <tbody id="mpesarows">
                <?php 
                $get_menu = mysqli_query($connection,"SELECT * FROM $table WHERE status=2") or die("Could not get the customer invoices with balances". mysqli_error($connection));
                while ($mat = mysqli_fetch_assoc($get_menu)) {
                  $name=$mat['name'];
                  $code=$mat['code'];
                  $amount=$mat['amount'];
                  $time=$mat['time'];
                  ?>
                  <tr>
                    <td> 
                      <input type="checkbox" name="pay-sale[]" onclick="sel<?php echo $pay_id; ?>()" value="<?php echo $amount ?>" data-value1="<?php echo $code ?>" class="bulk" />
                    </td>
                    <td><?php echo $code; ?></td>
                    <td><?php echo $name; ?></td>
                    <td><?php echo $amount; ?></td>
                    <td><?php echo $time; ?></td> 
                  </tr>
                <?php
                }
                ?> 
              </tbody>
            </table>
          </div>
          <script type="text/javascript"> 
            function sel<?php echo $pay_id ?>(){ 
              var output = "";
              var sum=0;
              var array = [];
              var carray = [];
              $("input[class=bulk]:checked").each(function() {
                output += $(this).data("value1") + " ";  
                array.push($(this).val()); 
                carray.push($(this).data("value1")); 
              }); 
              var arrayLength = array.length;
              for (var i = 0; i < arrayLength; i++) { 
                var amount=array[i]; 
                sum=parseInt(sum)+parseInt(amount);
              } 
              $("#refid<?php echo $pay_id; ?>").val(carray);
              $("#gate-input<?php echo $pay_id; ?>").val(carray);
              $("#nameid<?php echo $pay_id; ?>").val(sum);
              calculate(<?php echo $has_change; ?>);
            }
          </script>
        <?php
        } 
        ?> 
        </div>
        <?php
      }
      ?>
      <div class="row" id="sc" style="display: none;">
        <div class="form-group has-success col-md-6">
          <label class=" control-label">STORE CREDIT(<?php echo cust_store_credit($cust_id); ?>)</label> 
          <input type="number" id="nameidsc" class="form-control"  name="namesc" value="0" readonly>
        </div>
      </div>
      <p id="c23"></p>
    </div>