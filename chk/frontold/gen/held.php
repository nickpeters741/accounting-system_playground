<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$shop=$row['shop'];
?>
<table class="table" id="users" >
  <thead>
    <tr>
      <th>SALE ID</th>
      <th>DAY</th>
      <th>CUSTOMER</th>
      <th>MARKETER</th>
      <th>SALE TYPE </th>  
      <div  id="hidetd"><th>ACTIONS</th></div>
    </tr>
  </thead>
  <tbody>
    <?php
      $get_order = "SELECT * FROM kp_sale_status  ORDER BY sale_id DESC";
      $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the orders");
      while ($o = mysqli_fetch_assoc($get_order_r)) {
        $cust_id = $o['cust_id'];
        $sale_id = $o['sale_id'];
        $mkt = $o['mkt'];
        $day = $o['day'];
        // $shop_id = $o['shop'];
        $type = $o['type'];
        if ($type==1) {
          $type_text="CASH";
        }else {
          $type_text="CREDIT";
        }
    ?>
    <tr style="color: #373a3c;" id="<?php echo $item_id; ?>">
      <td><?php echo $sale_id; ?></td> 
      <td><?php echo $day; ?></td> 
      <td><?php  echo get_cust($cust_id); ?></td>
      <td><?php  echo get_user($mkt); ?></td>
      <td> <?php  echo $type_text; ?> </td> 
      <!-- <td> <?php  echo "SHOP".$shop_id; ?> </td>  -->
      <td>
        <?php //if ($shop_id==$shop) { ?>
          <a href="../ord/init_sale.php?shop=<?php echo $shop; ?>&id=<?php echo $sale_id; ?>&cust=<?php echo $cust_id; ?>&day=<?php echo $day; ?>&mkt=<?php echo $mkt; ?>&type=<?php echo $type; ?>&status=3; ?>" class="btn btn-warning btn-xs">CONTINUE </a>
        <?php //}else{ ?><?php //} ?>
      </td> 
    </tr>
    <?php
    }
    ?> 
  </tbody>
</table>
 