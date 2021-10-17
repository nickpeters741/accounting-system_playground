<?php
include('../../inc/connection.php');
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);
$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);
$item_id = mysqli_real_escape_string($connection,$_GET['item']);
$qty_sum=0;
$sum=0; 
?> 
<table class="table table-striped table-bordered">
  <thead>
    <tr class="text-center ">
      <td colspan="9" style="border-top: 2px solid #000;">
        <h3><b><U><?php echo get_item($item_id); ?> SALES HISTORY FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></U></b></h3>
      </td>
    </tr>
    <tr>
      <th>DATE</th> 
    	<th>SALE NO:</th>
      <th>CUSTOMER</th> 
      <th>SERVED BY</th>
      <th>QTY</th> 
      <th>AMOUNT</th> 
      <th>DISC</th>
      <th>TOTAL</th>   
      <th>SALE TYPE</th> 
    </tr>
  </thead>
  <tbody>
    <?php
    $sales = mysqli_query($connection,"SELECT *,kp_sales.cust_id,kp_sales.user_id FROM kp_sale_items INNER JOIN kp_sales on kp_sales.sale_id=kp_sale_items.sale_id WHERE kp_sale_items.item_id='$item_id' AND kp_sale_items.day BETWEEN '$start_date' AND '$end_date'  ORDER BY kp_sale_items.sale_id ASC");
    if (mysqli_num_rows($sales) < 1) {
    ?>
    <tr>
      <td colspan="9">
        <div class="alert alert-warning">
          <p>There are no recorded sales</p>
        </div>  
      </td>
    </tr>
    <?php
  }else{
    while ($sa = mysqli_fetch_assoc($sales)) {
      $sale_id = $sa['sale_id'];
      $cust_id = $sa['cust_id'];
      $user_id = $sa['user_id']; 
      $price= $sa['price'];
      $qty= $sa['qty'];
      $day= $sa['day'];
      $disc= $sa['disc'];
      $type= $sa['type'];
      $total=$sa['total'];
      $sum=$sum+$total; $qty_sum=$qty_sum+$qty; 
    ?> 
    <tr ondblclick="view(<?php echo $sale_id; ?>)">
      <td><?php echo $day; ?></td>  
      <td><?php echo $sale_id; ?></td>               
      <td><?php echo get_cust($cust_id); ?></td>                  
      <td><?php echo get_user($user_id); ?></td>
      <td><?php echo $qty; ?></td>
      <td><?php echo $price; ?></td>
      <td><?php echo $disc; ?></td>
      <td><?php echo $total; ?></td>
      <td><?php if ($type==2) { echo "CREDIT"; }else{ echo "CASH"; }  ?></td> 
 
    </tr>
    <?php 
    }
    ?> 
    <tr>
      <th colspan="4" class="text-center"><h3>TOTAL</h3></th>
      <th class="text-center"><h3><?php echo $qty_sum; ?></h3></th> 
      <th colspan="2" class="text-center"><h3> </h3></th> 
      <th><h3><?php echo $sum; ?></h3></th> 
      <th></th>
    </tr> 
    <?php
    }
    ?>
  </tbody>
</table>
</div> 