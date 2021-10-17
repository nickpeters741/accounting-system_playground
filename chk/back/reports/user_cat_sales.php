<?php
include('../../inc/connection.php');
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_REQUEST['start_date']);
$end_date = mysqli_real_escape_string($connection,$_REQUEST['end_date']);
$user_id = $_REQUEST['user_id'];
 
?> 
<table class="table table-striped table-bordered">
  <thead> 
  </thead>
  <tbody>
    <?php
    foreach ($user_id as $cow =>$f ) {
      $user =  $f;
      $sql="SELECT cat_id,SUM(total) as total FROM kp_sale_items INNER JOIN kp_sales on kp_sales.sale_id=kp_sale_items.sale_id INNER JOIN kp_items on kp_items.item_id=kp_sale_items.item_id WHERE mktr='$user' AND kp_sales.day BETWEEN '$start_date' AND '$end_date' GROUP BY cat_id ORDER BY kp_sales.sale_id ASC";
     // echo $sql;
      $sales = mysqli_query($connection,$sql);
    if (mysqli_num_rows($sales) < 1) {
    ?>
    <tr>
      <td colspan="3">
        <div class="alert alert-warning">
          <p>There are no recorded sales for <?php echo get_user($user); ?></p>
        </div>  
      </td>
    </tr>
    <?php
  }else{ ?>
    <tr>
      <td colspan="3" class="text-center"> <h3><b><U><?php echo get_user($user); ?> CATEGORY SALES FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></U></b></h3></td>
    </tr>
    <tr>
    	<th>NO:</th> 
    	<th>CATEGORY:</th> 
	    <th>AMOUNT</th>  
    </tr>
    <?php
    $sum=0; 
    $no=0; 
    while ($sa = mysqli_fetch_assoc($sales)) {
      $cat_id = $sa['cat_id'];
      // $cust_id = $sa['cust_id'];
      // $ring_by = $sa['user_id'];
      // $day = $sa['day'];
      // $datime = date_create($sa['datime']);
      $sale=$sa['total'];
      $sum=$sum+$sale; 
      $no=$no+1; 
    ?>
    <tr ondblclick="view(<?php echo $sale_id; ?>)">
      <td><?php echo $no; ?></td>  
      <td><?php echo get_cat($cat_id); ?></td>                   
      <!-- <td><?php echo get_cust($cust_id); ?></td>
      <td><?php echo get_user($ring_by); ?></td>
      <td><?php echo $day; ?></td> 
      <td><?php echo date_format($datime, "H:i:s"); ?></td> -->
      <td><?php echo $sale; ?></td> 
    </tr>
    <?php 
    }
    ?> 
    <tr>
      <th colspan="2" class="text-center"><h3>TOTAL</h3></th> 
      <th><h3><?php echo $sum; ?></h3></th> 
    </tr> 
    <?php
    }
  }
    ?>
  </tbody>
</table>
</div>
