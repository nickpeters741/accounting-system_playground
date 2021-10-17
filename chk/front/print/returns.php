 <br>
 <table id="data-table-combine" class="table table-striped table-bordered">
  <thead>
    <tr> 
      <th colspan="4"><?php echo $today; ?> RETURNS</th>     
   </tr>
    <tr> 
      <th>RET ID</th> 
      <th>SALE ID</th>  
      <th>CUSTOMER</th>
      <th>USER</th>   
   </tr>
</thead>
<tbody>
  <?php
  $get_items = mysqli_query($connection,"SELECT *,kp_sales.cust_id FROM kp_ret INNER JOIN kp_sales on kp_sales.sale_id=kp_ret.sale_id WHERE ret_date='$today'") or die(mysqli_error($connection));
  while ($oow = mysqli_fetch_assoc($get_items)) { 
      $ret_id = $oow['ret_id'];
      $sale_id= $oow['sale_id'];
      $cust_id= $oow['cust_id']; 
      $user_id= $oow['ret_user']; 
    ?>
    <tr>
      <td><?php echo $ret_id; ?></td>
      <td><?php echo $sale_id; ?></td>
      <td><?php echo get_cust($cust_id); ?></td> 
      <td><?php echo get_user($user_id); ?></td>     
    </tr>
  <?php
  }
  ?>
</tbody>  
</table>