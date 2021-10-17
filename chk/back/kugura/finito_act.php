<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id'];
page_restrict(); 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];  
$grn_id = $row['grn_id']; 

$check_po=mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po_id'");
$dd=mysqli_fetch_assoc($check_po);
$sup_id=$dd['sup_id'];

if (empty($po_id) OR $po_id==0) {
  header("Location: po_pending.php");
}elseif (empty($grn_id) OR $grn_id==0) {
  header("Location: init_rec.php?id=$po_id");
}else{}

$check_grnt=mysqli_query($connection,"SELECT sum(total) as total  FROM kp_grn_items   WHERE grn_id='$grn_id'")or die(mysqli_error($connection));
$tt=mysqli_fetch_assoc($check_grnt);
$amount=$tt['total'];
$check_grn=mysqli_query($connection,"SELECT * FROM kp_grn WHERE grn_id='$grn_id'");
$num=mysqli_num_rows($check_grn);
if ($num<1) {
	$create_grn= mysqli_query($connection,"INSERT INTO kp_grn(grn_id,po_id,sup_id,amount,user_id,day) VALUES('$grn_id','$po_id','$sup_id','$amount','$user_id',CURRENT_DATE)") or die(mysqli_error($connection));
	if ($create_grn) {
			

			$update = mysqli_query($connection,"UPDATE kp_suppliers  SET sup_bal=sup_bal+'$amount'  WHERE sup_id='$sup_id'")or die(mysqli_error($connection));

			$update = mysqli_query($connection,"DELETE FROM kp_grn_status WHERE grn_id='$grn_id'")or die(mysqli_error($connection));

			$check = mysqli_query($connection,"SELECT po_id FROM kp_po_items WHERE  s2s=2 AND po_id='$po_id'");
			if (mysqli_num_rows($check) < 1) {
				mysqli_query($connection,"UPDATE kp_po SET rec_status=1,stock_status=1,rec_staff='$user_id' WHERE po_id='$po_id'") or die(mysqli_error($connection)."Failed to update the po");
				//header("Location:rec_page.php?msg=1");
				update_po($po_id);
			}

			if ($update) {
				?>
	<div class="alert alert-success">
	  <strong>FINISHED SUCCSSFULLY!!!</strong>
	</div>
	<script type="text/javascript">
		$('#rec-modal').modal('toggle');
		window.location.reload(); 
		window.location='grn_print.php'; 
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
	<p style="color: red;">CONTACT DEVELOPER WITH DUPLICATION ERROR</p>
	<?php
}
 
?>