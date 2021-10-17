<?php
session_start();
include('../../inc/connection.php'); 
$user_id = $_SESSION['user_id'];
$item_id = $_REQUEST['item_id'];
$qty = $_REQUEST['qty'];
$reason = $_REQUEST['reason'];
$init = $_REQUEST['init'];

$ids="qty".$item_id;
if (empty($qty) OR empty($reason)) {
?>
<div class="panel-body">
	<div class="alert alert-warning">
		<strong>You Must input reason and Quantity.</strong>
	</div>
</div>
<?php
}else{

$create_history = mysqli_query($connection, "INSERT INTO kp_qty_hist(item_id,user_id,init_qty,new_qty,reason) VALUES('$item_id','$user_id','$init','$qty','$reason')") or die(mysqli_error($connection));
if (!$create_history) {
	echo "Failed to create History";
}else{
	$adjust_quantity = mysqli_query($connection, "UPDATE kp_items SET qty = '$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));

	$transact="QUANTITY ADJUSTMENT"; 
	$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
?> 
<script type="text/javascript">
	var text ='<?php echo $qty; ?>';
	var ids ='<?php echo $ids; ?>';

	var hulla = new hullabaloo();
    hulla.send('Quantity Successfully Updated', "success");  

    document.getElementById(ids).innerHTML = text;
    $('#stock-modal').modal('toggle');  
	 
</script>

<?php
}
}
?>
		

 