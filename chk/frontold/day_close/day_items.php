<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$total=0;
$day=$_REQUEST['day']; 
$str1=" ";
$title=""; 
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
      <thead>
          <tr>
            <th colspan="9" style="font-size: 19px;"><b><?php echo $day;?>  SOLD ITEMS</b></th>
          </tr>
<tr>
    <th style="width: 20px;">No.</th>
     <th style="width: 250px;">Item Name:</th>
     <th style="width: 20px;">Cash Qty</th>
     <th style="width: 20px;">Credit Qty</th> 
     <th style="width: 20px;">Total Qty</th>
     <th style="width: 50px;">Cash Amount:</th>
     <th style="width: 50px;">Credit Amount:</th>
     <th style="width: 50px;">Total Amount</th>
     <th style="width: 50px;">Remaining Stock</th>    
  </tr>
</thead>
<tbody>
<?php

$get_id = mysqli_query($connection,"SELECT item_id FROM kp_sale_items WHERE day='$day'  GROUP BY item_id") or die("Error fetching items.".mysqli_error($connection));
if (mysqli_num_rows($get_id) < 1) {
  ?>
  <div class="alert alert-warning">
    <p>There are no ite sales</p>
  </div>
  <?php
}else{
  $totalcr=0;
  $totalcs=0;
  $total=0;
  $no=0;
  while ($sa = mysqli_fetch_assoc($get_id)) {
    $item_id = $sa['item_id']; 
    $item_sum = mysqli_query($connection,"SELECT SUM(total) AS sum_cash,SUM(qty) AS cs_qty FROM kp_sale_items WHERE item_id = '$item_id' AND day='$day' AND type=1") or die("Error fetching the number of sales.:".mysqli_error($connection));
    $un = mysqli_fetch_assoc($item_sum);
    $sumc = $un['sum_cash'];
    $sumcqty = $un['cs_qty'];  

    $item_cred = mysqli_query($connection," SELECT SUM(total) AS sum_cred,SUM(qty) AS cr_qty FROM kp_sale_items
    WHERE item_id = '$item_id' AND type=2 AND day='$day'") or die("Error fetching the number of sales.:".mysqli_error($connection));
    $cr = mysqli_fetch_assoc($item_cred);
    $sumcr = $cr['sum_cred'];
    $sumcrqty = $cr['cr_qty']; 

    $totalcs=$totalcs+$sumc;
    $totalcr=$totalcr+$sumcr;
    $total=$total+$sumc+$sumcr;
    $no=$no+1;
 
 
    ?>
    <tr ondblclick="item_hist(<?php echo $item_id; ?>,'<?php echo $day; ?>')">
      <td><?php echo $no; ?></td>
      <td><?php echo get_item($item_id); ?></td>
      <td><?php echo $sumcqty; ?></td>
      <td><?php echo $sumcrqty; ?></td>
      <td><?php echo $sumcqty+$sumcrqty; ?></td>
      <td><?php echo $sumc; ?></td>
      <td><?php echo $sumcr; ?></td>
      <td><?php echo $sumc+$sumcr; ?></td> 
      <td style="color: red;"><?php echo get_column("kp_items","qty","item_id='$item_id'"); ?></td>
    </tr>
    <?php  
  }
  ?>


<tr>
  <td class="text-center" colspan="5"> <h4><b>TOTAL</b></h4></td> 
  <td> <h4><b><?php echo $totalcs; ?></b></h4></td>
  <td> <h4><b><?php echo $totalcr; ?></b></h4></td>
  <td> <h4><b><?php echo $total; ?></b></h4></td>
  <td></td>
</tr>
<?php
}
?>      
      
        </tbody>
      

          </table>
      
    </div>
  </div>
</div> 
                        
      
                        
 








