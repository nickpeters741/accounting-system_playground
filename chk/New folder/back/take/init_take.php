<?php
session_start();
include('../../inc/connection.php'); 

if (!isset($_SESSION['user_id'])) {
  header("Location:../log_out.php");
}
$user_id = $_SESSION['user_id'] ;
$st = $_GET['st'] ;
if ($st==1) {
    $update_items = mysqli_query($connection,"UPDATE kp_items SET take=2") or die("Could not update items".mysqli_error($connection));
    if ($update_items) {
        $day=date('Y-m-d');
        $update_stock_track = mysqli_query($connection,"INSERT INTO kp_stock_take_status(day,take_status,user_id) VALUES('$day',2,'$user_id')");
        $id = $connection->insert_id;
        header("Location:take.php?id=".$id."&day=".$day);
    }else{
        header("Location:init_take.php");
    }
}elseif ($st==2) {
    $day=$_GET['day'];
    $id=$_GET['id'];
    header("Location:take.php?id=".$id."&day=".$day);
}else{
    header("Location:init_take.php"); 
}

 

?> 