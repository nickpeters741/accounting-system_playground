<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];
$shop = $row['shop'];

$sup_id=$_REQUEST['sup'];
$disc=$_REQUEST['disc'];
$vatt=$_REQUEST['vatt'];  
$tt=$_REQUEST['tt'];
$perc=$_REQUEST['perc']; 
$tax_type=$_REQUEST['vat_type']; 
$vatable=$_REQUEST['vatable'];

$amount=po_total($po_id);  

echo "INSERT INTO kp_po(po_id,sup_id,ord_user,ord_date,amount,disc,tax_type,tax_perc,vatable,vat,shop) VALUES('$po_id','$sup_id','$user_id',CURRENT_DATE,'$tt','$disc','$tax_type','$perc','$vatable','$vatt','$shop')";

$create_po = mysqli_query($connection,"INSERT INTO kp_po(po_id,sup_id,ord_user,ord_date,amount,disc,tax_type,tax_perc,vatable,vat,shop) VALUES('$po_id','$sup_id','$user_id',CURRENT_DATE,'$tt','$disc','$tax_type','$perc','$vatable','$vatt','$shop')") or die(mysqli_error($connection));
if ($create_po) {
	$update_items = mysqli_query($connection,"UPDATE kp_po_items SET status=1 WHERE po_id='$po_id'") or die(mysqli_error($connection));
	if ($update_items) {
		$clear_status = mysqli_query($connection,"DELETE FROM kp_po_status  WHERE po_id='$po_id'") or die("Error");
		if ($clear_status) {
			$action="PLACED PURCHASE ORDER NO | ".$po_id;
			$url="../../";
			logs($action,$url);
			?>
			<script type="text/javascript">
				//window.location = 'po_print.php?id='+<?php echo $po_id; ?>;  
			</script>
			<?php
		}else{
			$update_items = mysqli_query($connection,"UPDATE kp_po_items SET status=2 WHERE po_id='$po_id'") or die(mysqli_error($connection));
			$clear_po = mysqli_query($connection,"DELETE FROM kp_po WHERE po_id='$po_id'") or die(mysqli_error($connection));
			?>
			<p style="color: red;">CONTACT ADMISTRATOR WITH ERROR "COULD NOT CLEAR STATUS"</p>
			<?php
		}
	}else{
		$clear_po = mysqli_query($connection,"DELETE FROM kp_po WHERE po_id='$po_id'") or die(mysqli_error($connection));
		?>
		<p style="color: red;">CONTACT ADMISTRATOR WITH ERROR "COULD NOT UPDATE PO ITEMS"</p>
		<?php
	}
}else{
?>
<p style="color: red;">CONTACT ADMISTRATOR WITH ERROR "COULD NOT INSERT PO"</p>
<?php
}

 