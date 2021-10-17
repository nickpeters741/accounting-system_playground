<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type']; 
$sale_id = $row['sale_id'];  


$item_id = mysqli_real_escape_string($connection,$_POST['item_id']);
$disc  = mysqli_real_escape_string($connection,$_POST['disc']);

$get_price = mysqli_query($connection,"SELECT * FROM kp_sale_items WHERE item_id='$item_id' AND sale_id='$sale_id'");
$s = mysqli_fetch_assoc($get_price);
$price = $s['price'];
   
$get_stock = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'");
$p = mysqli_fetch_assoc($get_stock); 
$bprice = $p['bprice'];
$base_price = $p['base_price'];
$stock = $p['qty']; 
$d_price=$price-$disc; 
$profit=$d_price-$bprice;

$tax_id = $p['tax_id'];
$tax=get_column("kp_tax","percent","tax_id=$tax_id");
$tax_type=get_column("kp_settings_gen","tax_type","id=1");
if ($tax_type==1) {
	$q=100+$tax;
	$qq=$tax/$q;
}else{
	$q=100;
	$qq=$tax/$q;
}

if (empty($disc) OR $disc==0) {
?>
	<p style="color:red;"><b> &nbsp;Discount is Cannot empty</b></p>
	<?php
}elseif ($disc > $price) {
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
	hulla.send("Discount Cannot be Greater than Price", "danger");

</script>
<?php
}elseif ($d_price < $base_price) {
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
	hulla.send("Price cannot be Less than the Base Price", "danger");

</script>
<?php
}else{ 
	$update_order = "UPDATE kp_sale_items SET disc='$disc',price='$price',total='$d_price'*qty,profit=qty*'$profit' ,tax='$qq'*total WHERE item_id='$item_id' AND sale_id='$sale_id'";
    $update_order_r = mysqli_query($connection,$update_order) or die("Could not create"); 

 //    $update_tt = "UPDATE kp_sale_items SET total=qty*price WHERE item_id='$item_id' AND sale_id='$sale_id'";
 //    $update_tt_r = mysqli_query($connection,$update_tt) or die("Could not create"); 

 //    $update_track = "UPDATE kp_stock_track SET qty='$qty' WHERE item_id='$item_id' AND sale_id='$sale_id'";
 //    $update_track_r = mysqli_query($connection,$update_track) or die("Could not create");    

    
	// $update_store = mysqli_query($connection,"UPDATE kp_items SET qty=qty-'$added' WHERE item_id='$item_id'");


$action="ADDED DISCOUNT|".$disc." |". get_item($item_id)."|SALE|".$sale_id;
logs($action,"../../");  
 
?>
<script type="text/javascript">
	var hulla = new hullabaloo();
	hulla.send("Discount updated Successfully", "success");

</script>

<?php

				
}
 
 
?>