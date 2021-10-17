<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$items = $_POST['items'];
$tax_id = $_POST['tax_id'];
$tax_name= get_column("kp_tax","name","tax_id='$tax_id'"); 
$arr = explode(",", $items);
foreach( $arr  as $c) {
	$item_id=$c;
	$ids="tax".$item_id;
	$item_name= get_column("kp_items","name","item_id='$item_id'");
	$adjust_category = mysqli_query($connection, "UPDATE kp_items SET tax_id = '$tax_id' WHERE item_id='$item_id'") or die(mysqli_error($connection));
	if (!$adjust_category) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send('Could not update category!!!! Contact Admin', "danger"); 
		</script>
		<?php
	}else{
		$action="CHANGED|-|-|TAX FOR |". $item_name;
		logs($action,"../../"); 
		$user_id=$_SESSION['user_id'];
    	$transact="ITEM TAX CHANGED TO ".$tax_name;
    	$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
    	?> 
	    <script type="text/javascript">
			var text ='<?php echo $tax_name; ?>';
			var ids ='<?php echo $ids; ?>';
			var hulla = new hullabaloo();
		    hulla.send('Category Successfully Updated', "success");  
		    document.getElementById(ids).innerHTML = text; 
		</script>
		<?php
	}
} 
?>