<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$sum=0;
$cust = $_REQUEST['cust'];
$start = $_REQUEST['start'];
$end = $_REQUEST['end'];

$check_sales = mysqli_query($connection , "SELECT * FROM kp_sales WHERE cust_id='$cust' AND day BETWEEN '$start' AND '$end'") or die(mysqli_error($connection));
$row = mysqli_fetch_assoc($check_sales); 
$type = $row['type'];
$sale_id = $row['sale_id'];
$user_id = $row['user_id'];


 ?> 
 <table class="table table-bordered" style="width: 100%">
    <thead>
        <tr>
            <th colspan="6">CUSTOMER ORDERS</th> 
        </tr>
        <tr>
            <th>DATE</th>
            <th>SALE ID</th>
            <th>SALE BY</th>
            <th>SALE TYPE</th>
            <th>AMOUNT</th>
            <th>ACTION</th>
        </tr>
    </thead> 
            <tbody>
                <?php 
            if (empty($row)) {
               ?>
               <tr>
                   <td colspan="6"> CUstomer has no orders placed in this period</td>
               </tr>
           <?php
            }else{ 
        while ($oow = mysqli_fetch_assoc($check_sales)) {  
                    $sale_id = $oow['sale_id'];
                    $cust_id=$oow['cust_id']; 
                    $user_id=$oow['user_id']; 
                    $amount=$oow['total_amount'];
                    $day=$oow['day'];

                    if ($type==1) {
   $type="CASH";
}elseif($type==2){
    $type="CREDIT";
} 
                  ?>
                  <tr> 
                    <td><?php echo $day; ?></td>
                    <td><?php echo $sale_id; ?></td>  
                    <td><?php echo get_user($user_id); ?></td>
                    <td><?php echo $type; ?></td>  
                    <td><?php echo $amount; ?></td> 
                    <td>
                            <a   data-toggle="modal" data-target="#ret-modal" onclick="confirm_cust(<?php echo $cust_id; ?>,<?php echo $sale_id; ?>);"   name="filter" class="btn btn-purple btn-xs">CONFIRM &nbsp;<i class="far fa-check-circle fa-1x"></i></a> 
                    </td> 
                        <?php
                    }
              }
            ?> 
            </tbody>
        </table>  
            
     <script>
        function confirm_cust(cust_id,sale_id) { 
            $.post("confirm_sale.php", {id: sale_id,cust_id:cust_id},
            function (data) {
            $('#ret-load').html(data);   
            });
        }
 
    </script>    