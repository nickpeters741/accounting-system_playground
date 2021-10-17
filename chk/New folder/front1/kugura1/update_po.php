<?php
session_start();
include('../../inc/connection.php');
include('funcs.php');  

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];
 
$item_id = mysqli_real_escape_string($connection,$_POST['item_id']);
$qty  = mysqli_real_escape_string($connection,$_POST['qty']);
 if (empty($qty)) {
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
	hulla.send("Quantity cannot be empty", "danger");
</script>
<?php
}else{ 
	$total = $qty * $price;
	$update_order = "UPDATE kp_po_items SET qty='$qty',total=(price-disc)*'$qty' WHERE item_id='$item_id' AND po_id='$po_id'";
    $update_order_r = mysqli_query($connection,$update_order) or die("Could not create".mysqli_error($connection)); 

    $action="UPDATED ".get_item($item_id)." QUANTITY WITH".$qty." | ".$po_id;
	$url="../../";
	logs($action,$url);
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
	hulla.send("Quantity updated Successfully", "success");

</script>

<?php

				
}
 
 
?>