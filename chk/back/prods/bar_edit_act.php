<?php
include('../../inc/connection.php'); 
include('../../inc/gen_funcs.php'); 
$bar=$_REQUEST['bar']; 
$item_id=$_REQUEST['id'];
$st=$_REQUEST['st'];
if ( empty($bar) or empty($bar) ) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("Bar Cannot be empty!!!!", "warning");
	</script>
	<?php
}elseif(check_duplicate("kp_items","barcode",$bar)){
	$item=get_column("kp_items","name","barcode='$bar'")
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo({
			delay: 2000,
			allow_dismiss: true,  
			offset: {
				from: "top",
				amount: 20
			},
			icon: {
				danger: "fa fa-exclamation-circle",
			},
		});
		hulla.send("Another Item with that Barcod Already Exist!!!! <br>'<?php echo $item; ?>'", "danger");
	</script>
	<?php
}else{
	$edit_item = "UPDATE kp_items SET barcode='$bar' WHERE item_id='$item_id' " or die("Error edition the file");
	$edit_item_r = mysqli_query($connection,$edit_item) or die("error on 18");
	if (!$edit_item_r) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send("Failed to update Cotact Administrator!!!!", "danger");
		</script>
	<?php
	}else{
		if ($st==2) {
			?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send("Updated Successfully!!!!", "success"); 
			$('#modal').modal('toggle');
		</script>
		<?php
		}else{
				?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send("Updated Successfully!!!!", "success");
      		$('#bar'+<?php echo $item_id; ?>).html(<?php echo $bar; ?>);
			$('#modal').modal('toggle');
		</script>
		<?php
		}
		
	}
}
?>