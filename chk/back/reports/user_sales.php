<?php
include('../../inc/connection.php');
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_REQUEST['start_date']);
$end_date = mysqli_real_escape_string($connection,$_REQUEST['end_date']);
$user_id = $_REQUEST['user_id'];
 
?> 
<table class="table table-striped table-bordered">
  <thead>
    <tr class="text-center ">
      <td colspan="6" style="border-top: 2px solid #000;">
        <h3><b><U><?php echo get_user($user_id); ?> SALES FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></U></b></h3>
      </td>
    </tr>
    <tr>
    	<th>RECEIPT NO:</th> 
      <th>CUSTOMER</th>
      <th>RINGED BY</th>
      <th>DATE</th> 
      <th>TIME</th> 
      <th>TOTAL</th>  
    </tr>
  </thead>
  <tbody>
    <?php
    foreach ($user_id as $cow =>$f ) {
      $user =  $f;
      $sales = mysqli_query($connection,"SELECT * FROM kp_sales WHERE mktr='$user' AND day BETWEEN '$start_date' AND '$end_date'  ORDER BY sale_id ASC");
    if (mysqli_num_rows($sales) < 1) {
    ?>
    <tr>
      <td colspan="6">
        <div class="alert alert-warning">
          <p>There are no recorded sales for <?php echo get_user($user); ?></p>
        </div>  
      </td>
    </tr>
    <?php
  }else{ ?>
    <tr>
      <td colspan="6"> <h3><b><U><?php echo get_user($user); ?> SALES FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></U></b></h3></td>
    </tr>
    <?php
    $sum=0; 
    while ($sa = mysqli_fetch_assoc($sales)) {
      $sale_id = $sa['sale_id'];
      $cust_id = $sa['cust_id'];
      $ring_by = $sa['user_id'];
      $day = $sa['day'];
      $datime = date_create($sa['datime']);
      $sale=$sa['sale_amount'];
      $sum=$sum+$sale; 
    ?>
    <tr ondblclick="view(<?php echo $sale_id; ?>)">
      <td><?php echo $sale_id; ?></td>                   
      <td><?php echo get_cust($cust_id); ?></td>
      <td><?php echo get_user($ring_by); ?></td>
      <td><?php echo $day; ?></td> 
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
  }
    ?>
  </tbody>
</table>
</div>
