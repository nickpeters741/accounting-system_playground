<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$mkt = $row['mkt'];
$day = $row['day'];

if (empty($_REQUEST['deli'])) {
  $deli = 0;
  $reg = 0;
  $beba = 0;
  $means = 0;  
  $disc = 0; 
}else{
  $deli = $_REQUEST['deli'];
  $reg = $_REQUEST['reg'];
  $beba = $_REQUEST['beba_sta'];
  $means = $_REQUEST['means'];  
  $disc = $_REQUEST['disc']; 
}
// $_SESSION['deli'] = $_REQUEST['deli'];
// $_SESSION['reg'] = $_REQUEST['reg'];
// $_SESSION['beba_sta'] = $_REQUEST['beba_sta'];
// $_SESSION['means'] = $_REQUEST['means'];  
// $_SESSION['disc'] = $_REQUEST['disc']; 

$action="LOADED|-|-|-|CREDIT CHECK OUT MODAL FOR SALE|".$sale_id;
logs($action,"../../"); 
$no=0;
 
?>
<div class="modal-content" style="width: 800px;">
  <div class="modal-header">
    <h3 style=" color: purple;">CONFIRM ORDER <?php echo $sale_id; ?> DETAILS AND ITEMS</h3>
  </div>
  <div class="modal-body">
    <div id="credit_results"></div>
    <div class="row">  
     <div class="col-md-6"><b style="font-size: 14px; color: blue;">CASHIER:  <?php echo get_user($user_id); ?></b></div>
     
     <div class="col-md-6"><b style="font-size: 14px; color: blue;">CUSTOMER:  <?php echo get_cust($cust_id); ?></b></div>
     <div class="col-md-6"><b style="font-size: 14px; color: blue;">SALES PERSON:  <?php echo get_user($mkt); ?></b></div>
 
     <div class="col-md-6"><b style="font-size: 14px; color: blue;">SALE DATE:  <?php echo $day; ?></b></div> 
    </div>
    <table class="table table-bordered" id="TheSo">
    <thead>
      <tr>
        <th>#</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Discount</th>
        <th>Total Amount</th>
      </tr>
    </thead>
    <tbody>
      <?php 
      $get_orders = "SELECT * FROM kp_sale_items WHERE sale_id='$sale_id' GROUP BY item_id";
      $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");
      while ($s = mysqli_fetch_assoc($get_orders_r)) {
        $item_id = $s['item_id'];
        $quantity = $s['qty'];
        $price = $s['price'];
        $total = $s['total'];
        $get_total_items = mysqli_query($connection,"SELECT SUM(qty) AS total_items FROM kp_sale_items WHERE sale_id='$sale_id' AND item_id='$item_id'");
        $t_it= mysqli_fetch_assoc($get_total_items);
        $get_total_discount = mysqli_query($connection,"SELECT SUM(disc) AS total_discount FROM kp_sale_items WHERE sale_id='$sale_id' AND item_id='$item_id'");
        $t_disc= mysqli_fetch_assoc($get_total_discount);
        $no=$no+1;
        ?>
        <tr>
          <td><?php echo $no; ?></td>
          <td style="font-size: 11px;"> <?php  echo get_item($item_id); ?> </td>
          <td><?php echo $t_it['total_items']; ?></td>
          <td><?php echo $price; ?></td>
          <td><?php echo $t_disc['total_discount']; ?></td>
          <td><?php echo $total; ?></td>
        </tr>
            <?php
            }
            ?>
            <tr>
              <th colspan="5" class="text-right">Sub Total:</th>
              <td><?php echo credit_total($sale_id); ?></td>
            </tr> 

            <tr>
              <th colspan="5" class="text-right">Delivery:</th>
              <td><?php echo $_REQUEST['deli']; ?></td>
            </tr>
            <tr>
              <th colspan="5" class="text-right">Total:</th>
              <td>
                <?php 
               // $disc=$_REQUEST['disc'];
                echo credit_total($sale_id)+$_REQUEST['deli'];
                ?>
              </td>
            </tr>
            <?php
            if (empty($_REQUEST['deli'])) { 
            }else{
              ?>
            <tr>
              <td colspan="2" style="font-size: 14px; color: red;"><b>Delivery By</b></td>
              <td colspan="2" style="font-size: 14px; color: red;"><b>Means</b></td>
              <td style="font-size: 14px; color: red;"><b>Registration</b></td>
              <td style="font-size: 14px; color: red;"><b>Amount</b></td>
            </tr>
            <tr>
              <td colspan="2"><?php echo get_beba($beba) ?></td>
              <td colspan="2"><?php echo get_means($means) ?></td>
              <td><?php echo $reg ?></td>
              <td><?php echo $deli ?></td>
            </tr>
            <?php
            }
            ?>
          </tbody>
        </table>
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
  <button name="complete" class="btn btn-purple btn-xs pull-right" id="complete" onclick="complete();">Complete order</button>
 
</div>
</div>
<script type="text/javascript"> 
function complete() {  
  var deli='<?php echo $deli ?>';
  var reg='<?php echo $reg ?>';
  var means='<?php echo $means ?>';
  var disc='<?php echo $disc ?>';
  var beba= '<?php echo $beba ?>';
  $.post("credit_action.php", { deli:deli,reg:reg,means:means,disc:disc,beba:beba },
    function(data){ 
        $('#credit_results').html(''); // blank before load.
        $('#credit_results').html(data); 
 
    }) 
}
 
</script>