<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 

if ($po_id==0) {
  	header("Location: init_page.php");
}else{
	$item_id = $_POST['item_id'];
	$quantity = $_POST['qty'];
	$price = $_POST['price'];
	$uom = $_POST['uom'];
}
if (empty($item_id) OR $item_id==0) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Item required !!!!! Make sure you select an item", "danger");
	</script>
	<?php
}elseif (empty($quantity)  OR $quantity==0) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Quantity is Required and cant be zero!!!!!", "danger");
	</script>
	<?php
}elseif (empty($price)  OR $price==0) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Price is Required and cant be zero!!!!!", "danger");
	</script>
	<?php
}else{
	$amount=$quantity*$price; 
	$results = mysqli_query($connection ,"SELECT * FROM kp_po_items WHERE item_id ='$item_id' AND po_id='$po_id'") or die("error selectig po items".mysqli_error($connection));
	if(mysqli_num_rows($results) < 1) {
		$create = mysqli_query($connection,"INSERT INTO kp_po_items(po_id,item_id,qty,price,total,day) VALUES('$po_id','$item_id','$quantity','$price','$amount',CURRENT_DATE)") or die(mysqli_error($connection));
		if (!$create) {
				$action="FAILED TO ADD ".get_item($item_id)." TO PURCHASE ORDER NO | ".$po_id;
				$url="../../";
				logs($action,$url);
				?>
				<div class="panel-body">
					<div class="row">
						<div class="alert alert-warning"> 
							<p><i class="fa fa-lg fa-warning"></i>&nbsp;Failed to add the item.Please try again.</p>
						</div>
					</div>
				</div>
				<?php
			}else{
				$action="SUCCESSFULLY ADDED ".get_item($item_id)." TO PO NO | ".$po_id;
				$url="../../";
				logs($action,$url);
			}
		}else{
			$action="COULDNT ADD DUPLICATE ".get_item($item_id)." TO PO NO | ".$po_id;
				$url="../../";
				logs($action,$url);
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send("Oops!!!Item already captured update price and quantity in approve section.!!!!!", "warning");
			</script>
			<?php
		}
	}
?>
	
