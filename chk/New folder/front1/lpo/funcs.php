<?php
$filename = "../../inc/gen_funcs.php";
if (file_exists($filename)){
    include('../../inc/gen_funcs.php');
}elseif (file_exists("../inc/gen_funcs.php")){
    include('../inc/gen_funcs.php');
}else{
    
}

function add_item(){
    global $connection,$item_id,$lpo_id,$day,$user_id,$price,$qty;
    //check if item has portion   
    $bprice = get_column('kp_items',"bprice","item_id='$item_id'");
    if ($price==0) { 
        $sprice = get_column('kp_items',"sprice","item_id='$item_id'"); 
    }else{ 
        $sprice =$price;
    }   
    $total=$qty*$sprice;
    $get_order= "SELECT * FROM kp_lpo_items WHERE item_id='$item_id' AND lpo_id='$lpo_id'";
    $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the product price");
    if (mysqli_num_rows($get_order_r)==0) {
        $add_order = "INSERT INTO kp_lpo_items(lpo_id,cust_id,item_id,qty,price,total,day)  VALUES('$lpo_id','$cust_id','$item_id','$qty','$sprice','$total','$day')";
        $add_order_r = mysqli_query($connection,$add_order) or die("Could not add order". mysqli_error($connection));
         
    }else{
        $update_order = "UPDATE kp_lpo_items SET qty=qty+'$qty', total=qty*price WHERE item_id='$item_id' AND lpo_id='$lpo_id'";
        $update_order_r = mysqli_query($connection,$update_order) or die("Could not create". mysqli_error($connection)); 
   
    } 

    $action="ADDED|".$qty."|". get_item($item_id)."|TO LPO NO|".$lpo_id."|";
    logs($action,"../../"); 
}