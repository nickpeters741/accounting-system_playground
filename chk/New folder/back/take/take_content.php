<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id']; 
$day = $_POST['day']; 
?>
 
     <table class="table table-bordered" style="text-align: left; padding: 2px;">
      <thead>
          <tr>
              <th>Item Name</th>
              <th>System Closing</th>
              <th>Counted Qty</th>
              <th>Variance</th>
              <th>Action</th>
              
          </tr>
      </thead>
      <tbody>
      <?php
      
      $get_items = mysqli_query($connection,"SELECT * FROM kp_stock_take WHERE day='$day'  ORDER BY id DESC") or die("Error fetching items count.:".mysqli_error($connection));
      
      while ($row = mysqli_fetch_assoc($get_items)) {
        $item_id = $row['item_id'];
         $closing=$row['closing'];
         $counted=$row['counted'];
         $var=$closing-$counted;

         if ($var==0) {
          $color="green";
         }else{
            $color="red";
         }

        ?>
        <tr style="color: <?php echo $color;?>;">
              <td><?php echo get_item($item_id); ?></td>
              <td><?php echo $closing; ?></td>
              <td><?php echo $counted; ?></td>
              <td><?php echo $var; ?></td>
              <td>
                <a href="take_count_del.php?day=<?php echo $day; ?>&id=<?php  echo $row['item_id'];?>" class="btn " style="height: 30px; width:60px;background-color: <?php echo $color;?>; font-weight: bold; color: white;">X</a>
              </td>
          </tr>
        <?php
      } 

       ?>                                 
      </tbody>
  </table>
 