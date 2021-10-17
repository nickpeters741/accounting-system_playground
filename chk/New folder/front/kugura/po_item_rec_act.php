 
<?php
session_start();
include('../../inc/connection.php');
include("funcs.php"); 
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po = $row['po_id'];  
$grn_id = $row['grn_id']; 

$qty = $_REQUEST['qty'];
$item_id = $_REQUEST['item'];
$price = $_REQUEST['price'];
$total=$qty*$price; 

$check_grn=mysqli_query($connection,"SELECT * FROM kp_grn_items WHERE grn_id='$grn_id' AND item_id='$item_id'");
$num=mysqli_num_rows($check_grn);
if ($num<1) {
	$create_grn= mysqli_query($connection,"INSERT INTO kp_grn_items(grn_id,item_id,qty,price,total,user_id,day) VALUES('$grn_id','$item_id','$qty','$price','$total','$user_id',CURRENT_DATE)") or die(mysqli_error($connection));
	if ($create_grn) {
			$check_po=mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po'");
			$dd=mysqli_fetch_assoc($check_po);
			$sup_id=$dd['sup_id'];


			$update = mysqli_query($connection,"UPDATE kp_po_items SET rec_qty=rec_qty+'$qty',rec_price='$price',rec_user='$user_id',rec_status = IF(rec_qty=qty, 1, rec_status), rec_total='$total'  WHERE po_id='$po' AND item_id='$item_id'");
			if ($update) {
				?>
	<div class="alert alert-success">
	  <strong><?php echo $qty." ". get_item($item_id); ?> RECEIVED SUCCSSFULLY!!!</strong>
	</div>
	<script type="text/javascript">
		
    $('#rec-modal').modal('toggle');
    window.location.reload(); 
	</script>
<?php
			}else{
				?>
				<p style="color: red;">COULD NOT UPDATE PO ITEMS </p>
				<?php
			} 
	}else{
	?>
		<p style="color: red;">COULD NOT INSERT ITEMS INTO GRN</p>
	<?php
	}
}else{
	?>
	<p style="color: red;">ITEM ALREADY RECEIVED IN THIS NOTE</p>
	<?php
}
 
?>