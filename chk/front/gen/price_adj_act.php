<?php
session_start();
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];  
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$price = $row['price'];
$sale_id = $row['sale_id'];

$item_id = $_REQUEST['item_id'];
$base = $_REQUEST['base'];
$bprice = $_REQUEST['bprice'];
$sprice = $_REQUEST['sprice']; 
$wprice = $_REQUEST['wprice']; 
$reason = $_REQUEST['reason'];
$init = $_REQUEST['init'];
$cabi = $_REQUEST['cabi']; 
$sale_price=$sprice; 

$get_price = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'");
$p = mysqli_fetch_assoc($get_price); 
$init_base = $p['base_price'];  
$init_sprice = $p['sprice'];
$init_bprice = $p['bprice'];  
$init_wprice = $p['wprice'];  

if (empty($sprice) OR empty($base) OR empty($reason)) {
?>
<div class="panel-body">
	<div class="alert alert-warning">
		<strong>You Must input reason and Price.</strong>
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
		$u = mysqli_fetch_assoc($verify);
		$app_user=$u['user_id']; 
		// $create_history = mysqli_query($connection, "INSERT INTO kp_item_price_hist(item_id,prev_bprice,new_bprice,prev_sprice,new_sprice,reason,user_id,app_by) VALUES('$item_id','$init_bprice','$bprice','$init_sprice','$sprice','$reason','$user_id','$app_user')") or die(mysqli_error($connection));
		// if (!$create_history) {
		// 	echo "Failed to create History";
		// }else{
			$adjust_quantity = mysqli_query($connection, "UPDATE kp_items SET sprice = '$sprice',bprice='$bprice',wprice='$wprice',base_price='$base' WHERE item_id='$item_id'") or die(mysqli_error($connection));
		 
		 $transact="FRONT PRICE ADJUSTMENT"; 
		$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item".mysqli_error($connection));
			?> 
			<script type="text/javascript">
				var text ='<?php echo $sale_price; ?>';
				var hulla = new hullabaloo();
				hulla.send("Price Updated Successfully", "success");
				//document.getElementById('price-btn').innerHTML = text;
			    $('#modal').modal('toggle'); 
			</script>
		<?php
		// }
	}
}
?>
		

 