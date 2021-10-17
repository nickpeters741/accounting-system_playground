<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$user_id=$_SESSION['user_id'];
$name = strtoupper(mysqli_real_escape_string($connection,$_REQUEST['name']));
$qty =$_REQUEST['qty']; 
if (empty($name) OR empty($qty)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Make Sure You fill All fields !!!!", "danger"); 
	</script>
	<?php
}elseif (check_duplicate('kp_uom','qty',$qty)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Another Mode with same Quantity exists !!!! Make sure tohave the name to be universal", "danger"); 
	</script>
	<?php
}else{if (check_duplicate('kp_uom','name',$name)) {
	?> 
	<script type="text/javascript"> 
		var hulla = new hullabaloo();
	    hulla.send("Another Mode with same name exists !!!!", "danger"); 
	</script>
	<?php
}else{ 
	$update_settings= "INSERT INTO kp_uom(name,qty,user_id) VALUES('$name','$qty','$user_id')";
	$update_settings_r = mysqli_query($connection,$update_settings) or die("Error:!!".mysqli_error($connection));
	if (!$update_settings_r) {
		?> 
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
		    hulla.send("UOM not Created!!!!", "danger"); 
		</script>
		<?php
	}else{
	 	$id =mysqli_insert_id($connection);
	 	$column_qty="ALTER TABLE kp_items ADD `uom".$id."` INT NOT NULL DEFAULT '2';";
		$update_items_r = mysqli_query($connection,$column_qty) or die(mysqli_error($connection));
		
		$column_qty="ALTER TABLE kp_items ADD `uom".$id."qty`  DECIMAL(10,2) NOT NULL;";
		$update_items_r = mysqli_query($connection,$column_qty) or die(mysqli_error($connection)); 
		
		$column_qty="ALTER TABLE kp_items ADD `uom".$id."reorder`  DECIMAL(10,2)  NOT NULL;";
		$update_items_r = mysqli_query($connection,$column_qty) or die(mysqli_error($connection)); 
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send("UOM Created Successfully!!!!", "success"); 
		</script>
		<?php
	}
}	
?>