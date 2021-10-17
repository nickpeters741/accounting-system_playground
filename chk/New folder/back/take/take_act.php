
<?php
session_start();
include('../../inc/connection.php'); 
$item_id = $_REQUEST['id'];
$qty = $_REQUEST['qty'];
$day = $_REQUEST['day'];
$func = $_REQUEST['func'];    
$user_id = $_SESSION['user_id'];

if (empty($item_id) OR $item_id==0) {
	?>
	<script type="text/javascript">
		
		 window.setTimeout(function(){
		 	window.location.href = 'take.php?day='+'<?php echo $day; ?>';
		 }, 200);
	</script>
	<?php 
}elseif (empty($day)) {
	?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a>
		<strong>Warning!</strong> Reinitialize Take 
	</div>
	<?php 
}elseif (empty($qty)) {
	?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a>
		<strong>Warning!</strong> Quantity is Required.<br> <B style="color:red">NB. If stock is 0 input 00 as quanity</B> 
	</div>
	<?php 
}else{
	$closing_stock = mysqli_query($connection,"SELECT qty FROM kp_items WHERE item_id='$item_id'");
	$open = mysqli_fetch_assoc($closing_stock);
	$closing =$open['qty']; 
	$variance=$qty-$closing;
	$update = mysqli_query($connection,"UPDATE kp_items SET take=1,qty='$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));
	$place_order = mysqli_query($connection,"INSERT INTO kp_stock_take(item_id,user_id,closing,variance,counted,day) VALUES('$item_id','$user_id','$closing','$variance','$qty ','$day')") or die(mysqli_error($connection));	
		
	 
}
?>
