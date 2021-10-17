<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id   		= $_SESSION['user_id'];
$name      		= strtoupper($_POST['name']);
$cat_id    		= $_POST['cat_id']; 
$sub_id    		= $_POST['sub_id'];
$code      		= strtoupper($_POST['code']); 
$bprice    		= $_POST['base_price'];
$base_price		= $_POST['base_price'];
//$dprice			= $_POST['dist_price'];
$wprice 		= $_POST['whole_price'];
$sprice      	= $_POST['sprice'];
$tax_id      	= $_POST['tax_id'];
$uom         	= $_POST['uom'];
//$bulk      		= $_POST['bulk']; 
$pcs      		= $_POST['pcs'];
$break_pcs      = $_POST['items_prod'];
$errorMSG    	= "";

// /* NAME */
if (empty($_POST["name"])) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Name is Required', "danger"); 
</script>
<?php
$errorMSG = "1";
} else {
	$name = strtoupper($_POST["name"]);
}

if (empty($_POST["sprice"])) {
	?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Selling Price is Required', "danger"); 
	</script>
	<?php
	$errorMSG = "1";
} else {
	$sprice = strtoupper($_POST["sprice"]);
}

// /* NAME */
if (empty($_POST["tax_id"]) OR $tax_id==0) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Tax is Required', "danger"); 
</script>
<?php
$errorMSG = "1";
} else {
	$tax_id = strtoupper($_POST["tax_id"]);
}

/* PRICE */
if (empty($_POST["base_price"])) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Base Price Required', "danger");
</script>
<?php
$errorMSG = "1";
} else {
	$base_price = $_POST['base_price'];
}

if(empty($errorMSG)){
	// $array = array();
	// $array2 = array();
	// foreach($uom_id as $i) {
	// 	$column= 
	// 	$array[] = "uom".$i.","."uom".$i."qty";
	// 	$array2[]="1,100";
	// }

	$field_values = array("stock_code","name","cat_id","sub_id","bprice","base_price","wprice","sprice","uom","tax_id","pcs","break_item");
	$result=array_merge( $field_values);
	 
	$data_values = array("'".$code."'","'".$name."'","'".$cat_id."'","'".$sub_id."'","'".$bprice."'","'".$base_price."'","'".$wprice."'","'".$sprice."'","'".$uom."'","'".$tax_id."'","'".$pcs."'","'".$break_pcs."'");
	$result2=array_merge( $data_values);

	if (Insertdata("kp_production_items", $result, $result2)) {
		$item_id = mysqli_insert_id($connection);
		$transact="ITEM CREATED";
		//$track=mysqli_query($connection,"INSERT INTO kp_item_history(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
		?>
		<script type="text/javascript">
			$('#modal').modal('toggle');
			var hulla = new hullabaloo();
		    hulla.send('Item Added Successfully', "success"); 
		</script>
		<?php 	
	}else{  
		$error=mysqli_error($connection);
		?>
		<script type="text/javascript"> 
			var er= "<?php echo $error; ?>" ;
			var hulla = new hullabaloo();
		    hulla.send('Error while adding item '+ er, "danger"); 
		</script>
		<?php 
	}
}

?>
