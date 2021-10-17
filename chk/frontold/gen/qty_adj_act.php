<?php
session_start();
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php'); 
$user_id = $_SESSION['user_id'];

$item_id 	= $_REQUEST['item_id'];
$qty 		= $_REQUEST['new-qty'];
$reason 	= $_REQUEST['reason'];
$init 		= $_REQUEST['init-qty'];
$cabi 		= $_REQUEST['cabi'];
//$ids		="qty".$item_id;
if (empty($qty) OR $qty==0) {
?>
<div class="panel-body">
	<div class="alert alert-warning">
		<strong>You Must input Quantity.</strong>
	</div>
</div>
<?php
}elseif (empty($reason)) {
?>
<div class="panel-body">
	<div class="alert alert-warning">
		<strong>You Must input Reason.</strong>
	</div>
</div>
<?php
}else{
$verify = mysqli_query($connection,"SELECT * FROM kp_users WHERE cabi='$cabi'") or die("Could not verify");
if (mysqli_num_rows($verify) < 1) {
	$action="ENTERED WRONG PASSWORD|-|-| IN MARKETER CHANGE FOR SALE |". $sale_id;
	logs($action,"../../"); 
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Danger!!! Wrong Password, Trials are Documented', "danger");  
</script>
<?php
}else{
	$create_history = mysqli_query($connection, "INSERT INTO kp_item_qty_hist(item_id,user_id,init_qty,new_qty,reason) VALUES('$item_id','$user_id','$init','$qty','$reason')") or die(mysqli_error($connection));
	if (!$create_history) {
		echo "Failed to create History";
	}else{
		$adjust_quantity = mysqli_query($connection, "UPDATE kp_items SET qty = '$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));
		$transact="QUANTITY ADJUSTMENT"; 
		$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item".mysqli_error($connection));
	?> 
	<script type="text/javascript">
		var text ='<?php echo $qty; ?>';
		var hulla = new hullabaloo();
	    hulla.send('Quantity Successfully Updated', "success");
	    document.getElementById('btn-qty').innerHTML = text;
	    $('#modal').modal('toggle');  
	</script>
	<?php
	}
}
}
?>
		

 