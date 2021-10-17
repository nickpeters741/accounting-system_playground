<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$po_id = $_GET['id'];

$action="RECEIVED ALL THAT WAS ORDERED FOR PUCHASE NUMBER| ".$po_id;
$url="../../";
logs($action,$url);
 

$approve = mysqli_query($connection,"UPDATE kp_po_items SET kp_po_items.rec_price = kp_po_items.price,kp_po_items.rec_qty = kp_po_items.qty,kp_po_items.rec_total = kp_po_items.total,rec_user='$user_id',rec_status=1,s2s=1 WHERE po_id='$po_id' AND rec_status=2") or die(mysqli_error($connection));

$rec = mysqli_query($connection,"UPDATE kp_po SET rec_status=1,s2s=1  WHERE po_id='$po_id'") or die(mysqli_error($connection));

$get_grn=mysqli_query($connection,"SELECT * FROM kp_grn_id");
$gg=mysqli_fetch_assoc($get_grn);
$grn_id=$gg['grn_id'];
if ($grn_id>0) {
    $update_grn= mysqli_query($connection,"UPDATE kp_grn_id SET grn_id=grn_id+1  ") or die(mysqli_error($connection));
    $grn_id=$grn_id+1;
}else{
    $insert_items= mysqli_query($connection,"INSERT INTO kp_grn_id(grn_id) VALUES(1)") or die(mysqli_error($connection)); 
    $grn_id=1;
}

function update_all(){
    global $connection,$grn_id,$po_id;
    $check_po=mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id'");
    while ($dd=mysqli_fetch_assoc($check_po)) {
        $item_id=$dd['item_id'];
        $qty=$dd['qty'];
        $price=$dd['price'];
        $total=$dd['total'];
        $update_qty= mysqli_query($connection,"UPDATE kp_items SET qty=qty+'$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));
        $insert_items= mysqli_query($connection,"INSERT INTO kp_grn_items(grn_id,item_id,qty,price,total,user_id,day,s2s) VALUES('$grn_id','$item_id','$qty','$price','$total','$user_id',CURRENT_DATE,1)") or die(mysqli_error($connection));
    }
}




$check_po=mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po_id'");
$dd=mysqli_fetch_assoc($check_po);
$sup_id=$dd['sup_id'];
$amount=$dd['amount'];

$check_grn=mysqli_query($connection,"SELECT * FROM kp_grn WHERE po_id='$po_id'");
$num=mysqli_num_rows($check_grn);
if ($num<1) {
    $create_GRN= mysqli_query($connection,"INSERT INTO kp_grn(grn_id,po_id,sup_id,user_id,amount,bal,day) VALUES('$grn_id','$po_id','$sup_id','$user_id','$amount','$amount',CURRENT_DATE)") or die(mysqli_error($connection));
}else{
    $create_GRN= mysqli_query($connection,"UPDATE kp_grn SET amount='$amount', bal='$amount' WHERE grn_id='$grn_id'") or die(mysqli_error($connection));
}

$update_sup_bal= mysqli_query($connection,"UPDATE kp_suppliers SET sup_bal=sup_bal+'$amount'  WHERE sup_id='$sup_id'") or die(mysqli_error($connection));

if ($update_sup_bal) {
    update_all();
    header("Location:init_page.php");
}else{
    echo "ERROR";
}


?>