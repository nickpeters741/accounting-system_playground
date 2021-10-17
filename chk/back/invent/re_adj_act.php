<?php
session_start();
include('../../inc/connection.php'); 
$user_id = $_SESSION['user_id'];
$item_id = $_REQUEST['item_id'];
$qty = $_REQUEST['qty'];
$reason = $_REQUEST['reason'];
$init = $_REQUEST['init'];

if (empty($reason)) {
?> 
<script> 
	var hulla = new hullabaloo();
	hulla.send("You Must input reason for adjustment!!!!", "danger"); 
</script>
<?php
}elseif (empty($qty)) {
	?>
<script> 
	var hulla = new hullabaloo();
	hulla.send("Quantity Cannot be empty!!!!", "danger"); 
</script>
<?php
}else{

	$create_history = mysqli_query($connection, "INSERT INTO kp_qty_hist(item_id,user_id,init_reorder,new_reorder,reason) VALUES('$item_id','$user_id','$init','$qty','$reason')") or die(mysqli_error($connection));
if (!$create_history) {
	?>
<script> 
	var hulla = new hullabaloo();
	hulla.send("Failed to update history, Contact developer!!!!", "danger"); 
</script>
<?php
}else{ 
	$adjust_quantity = mysqli_query($connection, "UPDATE kp_items SET reorder= '$qty'  WHERE item_id='$item_id'") or die(mysqli_error($connection));
	$transact="REORDER ADJUSTMENT"; 
	$track=mysqli_query($connection,"INSERT INTO kp_item_history(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
?>
<script> 
	var id ="reorder"+'<?php echo $item_id ?>';
	document.getElementById(id).innerHTML ='<?php echo $qty; ?>'; 
	var hulla = new hullabaloo();
	hulla.send("Reorder Level Updated successfully!!!!", "success"); 

	$('#stock-modal').modal('toggle');
</script> 

<?php
 }
}
?>
		

 