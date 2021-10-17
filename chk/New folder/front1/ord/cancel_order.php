<?php
session_start();
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$cust_id = $row['cust_id'];
$dash = $row['dashboard'];
$amount=0;

//get item from sale items
$get_id= mysqli_query($connection,"SELECT * FROM kp_sale_items WHERE   sale_id='$sale_id'") or die(mysqli_error($connection));
if (mysqli_num_rows($get_id) >= 1) {
    $sale_amount = mysqli_query($connection,"SELECT SUM(total) AS total  FROM kp_sale_items WHERE sale_id='$sale_id'");
    $row = mysqli_fetch_assoc($sale_amount);
    $amount= $row['total'];

    //loop while item id is on
    while ($gid = mysqli_fetch_assoc($get_id)) {
        $item_id = $gid ['item_id']; 
        $qty=$gid['qty']; 
        $price=$gid['price'];

        $save_cancel_items = "INSERT INTO kp_cancelled_items(sale_id,item_id,qty,price) VALUES('$sale_id','$item_id','$qty','$price')";
        $save_items_r = mysqli_query($connection,$save_cancel_items) or die("Could not track cancelled order".mysqli_error($connection));
     
        $update_stock = mysqli_query($connection,"UPDATE kp_items SET qty=qty+'$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));
        
    }

    $delete = "DELETE FROM kp_sale_items WHERE sale_id='$sale_id'";
    $delete_r = mysqli_query($connection,$delete) or die("Could not remove sale items");

    $deletes = "DELETE FROM kp_sales WHERE sale_id='$sale_id'";
    $deletes_r = mysqli_query($connection,$deletes) or die("Could not remove sale items");


    $delete = "DELETE FROM kp_sale_status WHERE sale_id='$sale_id'";
    $delete_or = mysqli_query($connection,$delete) or die("Could not clear order status");

    $clear_po_status = mysqli_query($connection,"DELETE FROM kp_po_status  WHERE sale_id='$sale_id'") or die("Error".mysqli_error($connection));  


    $delete = "DELETE FROM kp_stock_track WHERE sale_id='$sale_id'";
    $delete_sr = mysqli_query($connection,$delete) or die("Could not remove stock tracking");

    $save_cancel = "INSERT INTO kp_cancelled_sales(sale_id,user_id,cust_id,amount,day) VALUES('$sale_id','$user_id','$cust_id','$amount',CURRENT_DATE)";
    $save_r = mysqli_query($connection,$save_cancel) or die("Could not track cancelled order".mysqli_error($connection));


    if (!$delete_r OR !$delete_or OR !$save_r) {
    	header('Location:../ord/order.php');
    }else{ 
        $action="CANCELLED|-|-|-|SALE NO".$sale_id;
        logs($action,"../../");  
        header('Location:../dash/'.$dash);
    }
}else{
    $save_cancel = "INSERT INTO kp_cancelled_sales(sale_id,user_id,cust_id,amount,day) VALUES('$sale_id','$user_id','$cust_id','$amount',CURRENT_DATE)";
    $save_r = mysqli_query($connection,$save_cancel) or die("Could not track cancelled order".mysqli_error($connection));

    $delete = "DELETE FROM kp_sale_status WHERE sale_id='$sale_id'";
    $delete_or = mysqli_query($connection,$delete) or die("Could not clear order status");
     
    $action="CANCELLED|-|-|-|SALE NO".$sale_id;
    logs($action,"../../");  
    header('Location:../dash/'.$dash);
}



?>