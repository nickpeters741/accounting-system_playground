<?php
include('../../inc/connection.php'); 
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);
$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);
$sum=0;
?> 
<table id="data-table-combine" class="table table-striped table-bordered">
  <thead>
    <tr class="text-center ">
      <td colspan="6" style="border-top: 2px solid #000;">
        <h2><b><U>SALES FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></U></b></h2>
      </td>
    </tr>
    <tr>
      <th>#:</th>
    	<th>SALE NO:</th>
      <th>CUSTOMER</th>
      <th>SERVED BY</th>
      <th>TYPE</th>
      <th>TIME</th> 
      <th>TOTAL</th>  
    </tr>
  </thead>
  <tbody>
    <?php
    $sales = mysqli_query($connection,"SELECT * FROM kp_sales WHERE day BETWEEN '$start_date' AND '$end_date'  ORDER BY sale_id ASC");
    if (mysqli_num_rows($sales) < 1) {
    ?>
    <tr>
      <td colspan="5">
        <div class="alert alert-warning">
          <p>There are no recorded sales</p>
        </div>  
      </td>
    </tr>
    <?php
  }else{
    $no=0;
    while ($sa = mysqli_fetch_assoc($sales)) {
      $sale_id = $sa['sale_id'];
      $cust_id = $sa['cust_id'];
      $user_id = $sa['user_id'];
      $datime = date_create($sa['datime']);
      $sale=$sa['sale_amount'];
      $type = $sa['type'];
      $sum=$sum+$sale;
      $no=$no+1; 
    ?>
    <tr ondblclick="view(<?php echo $sale_id; ?>)">
      <td><?php echo $no; ?></td>
      <td><?php echo $sale_id; ?></td>
      <td><?php echo get_cust($cust_id); ?></td>                  
      <td><?php echo get_user($user_id); ?></td>
      <td><?php if ($type==1) {
        echo "RECEIPT";
      }else{
        echo "INVOICE";
      } ?></td>
      <td><?php echo date_format($datime, "H:i:s"); ?></td>
      <td><?php echo $sale; ?></td> 
    </tr>
    <?php 
    }
    ?> 
    <tr>
      <th colspan="5" class="text-center"><h3>TOTAL</h3></th> 
      <th><h3><?php echo $sum; ?></h3></th> 
    </tr> 
    <?php
    }
    ?>
  </tbody>
</table>
</div>
