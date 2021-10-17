<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$today=date('Y-m-d');
$no=0;
$total=0;
?>
 <table class="table table-bordered" id="TheSo">
    <thead>
        <tr>
           <th>No:</th>
            <th>Customer</th>
            <th>Transaction</th>    
            <th>Raised By</th> 
            <th>Amount</th>    
            <th>Datime</th>     
        </tr>
    </thead>
    <tbody>
        <?php 
            $requisitions = mysqli_query($connection,"SELECT * FROM kp_sc_hist WHERE 
                day='$today'") or die(mysqli_error($connection));
            while ($row = mysqli_fetch_assoc($requisitions)) { 
                $no=$no+1; 
        ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo get_cust($row['cust_id']); ?></td>
            <td><?php echo $row['trans']; ?></td> 
            <td><?php echo get_user($row['user_id']); ?></td>
            <td><?php echo $row['amount']; ?></td> 
            <td><?php echo $row['datime']; ?></td>
        </tr>
    </tbody>
    <?php
     }
    ?> 
</table>