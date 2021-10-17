<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$pin = $_REQUEST['pin'];
$item_id = $_REQUEST['item_id'];
$qty = $_REQUEST['qty'];
$price = $_REQUEST['price'];
$sup_id = $_REQUEST['sup_id'];
$amount=$price*$qty;
$user_id=$_SESSION['user_id'];  
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];

	$get_item = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'") or die("test".mysqli_error($connection)); 
	$it = mysqli_fetch_assoc($get_item); 
	$stock = $it['qty'];
	$stock_bal=$qty+$stock;
if (empty($_REQUEST['pin'])) {
	?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Danger!!! Password Cannot be Empty', "danger");  
	</script>
	<?php
}else{
	$verify = mysqli_query($connection,"SELECT * FROM kp_users WHERE cabi='$pin'") or die("Could not verify");
	if (mysqli_num_rows($verify) < 1) {
		$action="ENTERED WRONG PASSWORD|-|-|-|IN MARKETER CHANGE FOR SALE |". $sale_id;
		logs($action,"../../"); 
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Wrong Password, Trials are Documented', "danger");  
		</script>
	    <?php
	}else{ 
		$check_id=mysqli_query($connection,"SELECT po_id FROM kp_po_status WHERE  po_user_id='$user_id' AND sale_id='$sale_id' AND sup_id='$sup_id'");
		if (mysqli_num_rows($check_id) > 0) {
			$on = mysqli_fetch_assoc($check_id);
			$po_id = $on['po_id']; 
		}else{ 
			$get_id=mysqli_query($connection,"SELECT po_id FROM kp_po_id");
			if (mysqli_num_rows($get_id) > 0) {
				$update_po = mysqli_query($connection,"UPDATE kp_po_id SET po_id=po_id+1") or die("Could not create a new purchase order number");
			}else{
				$create_id = "INSERT INTO kp_po_id(po_id) VALUES(1)";
				$create_id_r = mysqli_query($connection,$create_id) or die("Could not create a new purchase number"); 
			}
			
			$get_po_r = mysqli_query($connection,"SELECT po_id FROM kp_po_id") or die("Could not get the last purchase id");
			$row = mysqli_fetch_array($get_po_r);
			$po_id = $row['po_id'];

			$create_po_status = "INSERT INTO kp_po_status(po_id,po_user_id,sale_id,sup_id) VALUES('$po_id','$user_id','$sale_id','$sup_id')";
			$create_po_status_r = mysqli_query($connection,$create_po_status) or die("Could not create a new purchase number"); 
		}

		$check_lpo=mysqli_query($connection,"SELECT * FROM kp_po WHERE  po_id='$po_id' AND sup_id='$sup_id'");
		if (mysqli_num_rows($check_lpo) > 0) {
			$add_item = "INSERT INTO kp_po_items(po_id,item_id,qty,price,total,rec_qty,rec_price,rec_total,rec_user,rec_status,s2s) VALUES('$po_id','$item_id','$qty','$price','$amount','$qty','$price','$amount','$user_id',1,1)";
			$add_item_r = mysqli_query($connection,$add_item) or die("Could not create a new purchase number"); 

			$update_po = mysqli_query($connection,"UPDATE kp_po SET amount=amount+'$amount' WHERE po_id='$po_id'") or die("Could not update");

			$check_grn=mysqli_query($connection,"SELECT * FROM kp_grn WHERE po_id='$po_id'");
			$num=mysqli_num_rows($check_grn);
			if ($num<1) {
				$create_GRN= mysqli_query($connection,"INSERT INTO kp_grn(po_id,sup_id,user_id,amount,bal,day) VALUES('$po_id','$sup_id','$user_id','$amount','$amount',CURRENT_DATE)") or die(mysqli_error($connection));
			}else{
				$updte_GRN= mysqli_query($connection,"UPDATE kp_grn SET amount=amount+'$amount', bal='$price*$qty' WHERE po_id='$po_id'") or die(mysqli_error($connection));
			}

			$update_track = mysqli_query($connection,"INSERT INTO kp_stock_track(item_id,po_id,user_id,qty,status,day,stock_bal) VALUES('$item_id','$po_id','$user_id','$qty','IN',CURRENT_DATE,'$stock_bal')") or die(mysqli_error($connection)."Failed to update the stock track");
			if (!$update_track) {
				echo "Failed to update track";
			}else{ 
				$edit_qty = "UPDATE kp_items SET qty=qty+'$qty'  WHERE item_id='$item_id'";
				$edit_qty_r = mysqli_query($connection,$edit_qty) or die(mysqli_error($connection));
			}
		}else{
			$add_item = "INSERT INTO kp_po_items(po_id,item_id,qty,price,total,rec_qty,rec_price,rec_total,rec_user,rec_status,s2s) VALUES('$po_id','$item_id','$qty','$price','$amount','$qty','$price','$amount','$user_id',1,1)";
			$add_item_r = mysqli_query($connection,$add_item) or die("Could not create a new purchase number"); 

			$add_item = "INSERT INTO kp_po(po_id,sup_id,ord_user,ord_date,amount,rec_staff,rec_date,stock_status,grn_status) VALUES('$po_id','$sup_id','$user_id',CURRENT_DATE,'$amount','$user_id',CURRENT_DATE,1,1)";
			$add_item_r = mysqli_query($connection,$add_item) or die("Could not create a new purchase number"); 

			$check_grn=mysqli_query($connection,"SELECT * FROM kp_grn WHERE po_id='$po_id'");
			$num=mysqli_num_rows($check_grn);
			if ($num<1) {
				$create_GRN= mysqli_query($connection,"INSERT INTO kp_grn(po_id,sup_id,user_id,amount,bal,day) VALUES('$po_id','$sup_id','$user_id','$amount','$price*$qty',CURRENT_DATE)") or die(mysqli_error($connection));
			}else{
				$updte_GRN= mysqli_query($connection,"UPDATE kp_grn SET amount=amount+'$amount', bal=bal+'$amount' WHERE po_id='$po_id'") or die(mysqli_error($connection));
			}

			$update_track = mysqli_query($connection,"INSERT INTO kp_stock_track(item_id,po_id,user_id,qty,status,day,stock_bal) VALUES('$item_id','$po_id','$user_id','$qty','IN',CURRENT_DATE,'$stock_bal')") or die(mysqli_error($connection)."Failed to update the stock track");
			if (!$update_track) {
				echo "Failed to update track";
			}else{ 
				$edit_qty = "UPDATE kp_items SET qty=qty+'$qty'  WHERE item_id='$item_id'";
				$edit_qty_r = mysqli_query($connection,$edit_qty) or die(mysqli_error($connection));
			}
		}	
		//
		$action="RAISED|-|-|-|LPO FOR |". get_item($item_id);
		logs($action,"../../"); 
		?>
		<script type="text/javascript"> 
			var hulla = new hullabaloo();
			hulla.send('Success!!! Item purchased successfully and added to stock', "success"); 
			$('#modal2').modal('toggle');
			$('#modal').modal('toggle');
		</script>
	    <?php
	}
}
?>