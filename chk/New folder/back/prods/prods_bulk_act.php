<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$item_id = $_POST['item_id'];
$uom = $_POST['uom'];
$pcs = $_POST['pcs'];
$items_prod = $_POST['items_prod'];
$bulk = $_POST['bulk'];


$name= get_column("kp_items","name","item_id='$item_id'");  
$ids="b_item".$item_id;
$item_name= get_column("kp_items","name","item_id='$item_id'");
$break_name= get_column("kp_items","name","item_id='$items_prod'");
$adjust_category = mysqli_query($connection, "UPDATE kp_items SET break_item = '$items_prod',bulk='$bulk',pcs='$pcs',uom='$uom' WHERE item_id='$item_id'") or die(mysqli_error($connection));
if (!$adjust_category) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Could not update category!!!! Contact Admin', "danger"); 
	</script>
	<?php
}else{
	$action="CHANGED|-|-|UOM SETTINGS FOR |". $item_name;
	logs($action,"../../"); 
	$user_id=$_SESSION['user_id'];
	$transact="ITEM UOM SETTINGS CHANGED";
	$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
	?> 
    <script type="text/javascript">
		var text ='<?php echo $break_name; ?>';
		var ids ='<?php echo $ids; ?>';
		var hulla = new hullabaloo();
	    hulla.send('Category Successfully Updated', "success");  
	    document.getElementById(ids).innerHTML = text; 
	</script>
	<?php
} 
?>