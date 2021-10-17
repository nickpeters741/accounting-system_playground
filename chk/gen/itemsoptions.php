<?php 
include('../inc/connection.php');   
    $option = '';
    $query = "SELECT * FROM kp_items  ";
    $result = mysqli_query($connection,$query);
    $option .="<option value = ''>"."----SELECT ITEM-----"."</option>";
    while($row = mysqli_fetch_array($result) ){ 
        //$response[] = array("value"=>$row['item_id'],"label"=>$row['stock_code']." ".$row['name']);

        $option .="<option value =".$row['item_id'].">".$row['stock_code']." ".$row['name']."</option>"; 
    }
    //echo json_encode($response);
    echo $option;

 
?> 