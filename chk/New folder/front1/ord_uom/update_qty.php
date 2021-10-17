<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type']; 
$sale_id = $row['sale_id'];  

$id = mysqli_real_escape_string($connection,$_POST['id']);
$qty  = mysqli_real_escape_string($connection,$_POST['qty']);
 

$get_prev_qty= "SELECT price,qty,item_id,uom FROM kp_sale_items WHERE id='$id'";
$get_prev_r = mysqli_query($connection,$get_prev_qty) or die("Could not get the product price");
$q = mysqli_fetch_assoc($get_prev_r);
$prev_qty=$q['qty'];
$item_id=$q['item_id'];
$price = $q['price'];
$uom = $q['uom'];
$uomqty="uom".$uom."qty";

$added=$qty-$prev_qty;
 
$get_price = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'");
$p = mysqli_fetch_assoc($get_price); 
$bprice = $p['bprice'];
$stock = $p[$uomqty]; 
$profit=$price-$bprice;
$name = $p['name'];

$tax_id = $p['tax_id'];

$tax=get_column("kp_tax","percent","tax_id=$tax_id");
$tax_type=get_column("kp_settings_gen","tax_type","id=1");

if ($tax_type==1) {
	$q=100+$tax;
}else{
	$q=100;
}

if ($prev_qty>$qty) {
	$added=$qty-$prev_qty;
	$stock_bal=$stock+($prev_qty-$qty);
}else{
	$added=$qty-$prev_qty;
	$stock_bal=$stock-$added;
}

if (empty($qty)) {
	?>
	<p style="color:red;"><b> &nbsp;Enter item name or scan barcode </b></p>
	<?php
}elseif ($added > $stock) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Item Not in Stock"+'<?php echo $added. $name; ?>', "danger");
	</script>
	<?php
}else{ 
	$total = $qty * $price;
	$update_order = "UPDATE kp_sale_items SET qty='$qty' WHERE item_id='$item_id' AND sale_id='$sale_id' AND uom='$uom' ";
    $update_order_r = mysqli_query($connection,$update_order) or die("Could not create"); 

    $update_tt = "UPDATE kp_sale_items SET total=qty*price,profit=profit*'$qty', tax=('$tax'/'$q')*total WHERE item_id='$item_id' AND sale_id='$sale_id' AND uom='$uom' ";
    $update_tt_r = mysqli_query($connection,$update_tt) or die("Could not create"); 

    $update_track = "UPDATE kp_stock_track SET qty='$qty',stock_bal='$stock_bal' WHERE item_id='$item_id' AND sale_id='$sale_id' AND uom='$uom' ";
    $update_track_r = mysqli_query($connection,$update_track) or die("Could not create");    

    
	$update_store = mysqli_query($connection,"UPDATE kp_items SET $uomqty='$stock_bal' WHERE item_id='$item_id'");


	$action="ADDED|".$added."|". get_item($item_id)."|TO SALE NO|".$sale_id."|";
	logs($action,"../../"); 

	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Quantity updated Successfully", "success");
	</script>
	<?php
}
?>