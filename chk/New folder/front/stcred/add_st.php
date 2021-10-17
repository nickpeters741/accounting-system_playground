<?php 
include("../clude/head.php");
$cust_id=$_GET['id'];
$balance=cust_bal($cust_id);
 ?>
<body>
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->  
      <?php 
        require("../clude/header.php");
      ?>
      <!-- end #header -->
		<!-- begin #menu -->
		<?php include("../clude/menu.php") ?>
		<!-- end #menu -->
    <!-- begin #content -->
		<div id="content" class="content">
			<!-- begin row -->
			<div class="row">
        <!-- begin col-6 -->
        <div class="col-lg-6">
          <!-- begin panel -->
          <div class="panel panel-inverse">
            <!-- begin panel-heading -->
            <div class="panel-heading">
              <div class="panel-heading-btn">
                <a class="btn btn-sm btn-warning">BALANCE: <?php echo $balance; ?> </a>
              </div>
              <h4 class="panel-title">TAKE <?php echo get_cust($cust_id); ?> PAYMENT FOR STORE CREDIT</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
              <form  method="POST" action="pay_st.php">
            <div class="panel-body"> 
              <input type="hidden" id="amount" class="form-control"  name="amount" value="0" >
              <input type="hidden" id="cust_id" class="form-control"  name="cust_id" value="<?php echo $cust_id; ?>" > 
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
                 
                $get_wallet = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE del_status=2") or die("Could not get the payment modes"); 
                while ($row=mysqli_fetch_assoc($get_wallet)) {
                  $name=$row['name'];
                  $color=$row['btn_color'];
                  $has_ref=$row['has_ref'];
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
                    <input type="number" onkeyup="calculate();" id="nameid<?php echo $pay_id; ?>" class="form-control"  name="name<?php echo $pay_id; ?>" value="0"> 
                  </div>
                  </div> 
                  <?php
                  }
                  ?>
                  
                </div>
                <div class="panel-footer">  
                  <button  type="submit"  value="Submit" name="pay"  class="btn btn-success btn-sm pull-right">SUBMIT</button> <br> 
                </div>
          </form>
            </div>
          <!-- end panel-body --> 
        </div>
        <!-- end panel -->
        <!-- end col-6 -->
        <!-- begin col-6 -->
        <div class="col-lg-6">
          <!-- begin panel -->
          <div class="panel panel-inverse" data-sortable-id="form-validation-2">
            <!-- begin panel-heading -->
            <div class="panel-heading">
              <div class="panel-heading-btn">
                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                <a href="#modal-menu" class="btn btn-sm btn-icon btn-circle btn-lime" data-toggle="modal" ><i class="fa fa-plus"></i></a>
              </div>
              <h4 class="panel-title"><?php echo get_cust($cust_id); ?> LAST 10 STORE CREDIT TRANSACTION</h4>
            </div>
            <!-- end panel-heading -->
            <!-- begin panel-body -->
            <div class="panel-body">
              <table id="data-table-combine" class="table table-striped">
                <thead>
                	<tr>
                    <th>DATE</th>
                		<th>TRANSACTION</th>
                		<th>SERVED BY</th> 
                		<th>Amount</th>  
                	</tr>
                </thead>
                <tbody>
                <?php
                $get_menu = mysqli_query($connection,"SELECT * FROM kp_sc_hist WHERE cust_id='$cust_id'") or die("Could not get the customer store credit history". mysqli_error($connection));
                while ($mat = mysqli_fetch_assoc($get_menu)) {
                  $trans=$mat['trans'];
                	$user_id=$mat['user_id']; 
                	$amount=$mat['amount']; 
                  $day=$mat['day']; 
                ?>
                <tr> 
              		<td><?php echo $day; ?></td>
                  <td><?php echo $trans; ?></td>
              		<td><?php echo get_user($user_id); ?></td>
              		<td><?php echo $amount; ?></td>  
              	</tr>
                <?php
                  }
                ?> 
              </tbody>
          </table>
        </div>
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-6 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
</div>
	<!-- end page container -->
	<?php include("../clude/foot.php") ?>
  <script type="text/javascript">
    $(document).ready(function() { 
      App.init(); s
    });
  </script>
	<script type="text/javascript">
 $('input[name="pay-mode[]"]').change(function () {
    var pid=$(this).val();
    if (this.checked) {
      document.getElementById(pid).style.display = 'flex';
      document.getElementById(pid).value = 0; 
    } else {
      document.getElementById(pid).value = 0; 
      document.getElementById(pid).style.display ='none' ;
      calculate()
    }
}); 

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
  calculate();
} 

function calculate(){
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
 
document.getElementById('amount').value = total;  

 
} 
</script>