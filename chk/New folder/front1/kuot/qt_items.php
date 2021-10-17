<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$qt_id = $row['qt_id']; 
$no=0;
$total=0;
?>
 <table class="table table-bordered" id="TheSo">
    <thead>
        <tr>
           <th>No:</th>
            <th>Item Name</th>
            <th>Quantity</th> 
            <th>Price</th>  
            <th>Amount</th>                      
            <div  id="hidetd"><th>Action</th></div>
        </tr>
    </thead>
    <tbody>
        <?php 
            $requisitions = mysqli_query($connection,"SELECT * FROM kp_qt_items WHERE  qt_id='$qt_id'") or die(mysqli_error($connection));
            while ($row = mysqli_fetch_assoc($requisitions)) {
                $item_id = $row['item_id']; 
                $no=$no+1;
                $amount=$row['qty'] * $row['price'];
                $total=$total+$amount;
        ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo get_item($item_id); ?></td>
            <td><?php echo $row['qty']; ?></td>
            <td><?php echo $row['price'];  ?></td>
            <td><?php echo $amount ?></td>
             <div id="hidetd"><td >
              <a class="btn btn-danger btn-xs" onclick="del_this('<?php echo $item_id; ?>')" >x</a>
            </td></div>
        </tr>
    </tbody>
    <?php
     }
    ?>
    <tfooter>
        <tr style="font-size: 18px;">
            <th colspan="4" class="text-center">TOTAL</th>
            <th id="ttt"><?php echo $total ?></th>
            <th></th>
        </tr>
    </tfooter>
</table>