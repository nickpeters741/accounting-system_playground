<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id   		= $_SESSION['user_id'];
$item_id    	= $_POST['item'];  
$break_item     = $_POST['break_item'];
$break_pcs      = get_column('kp_items',"pcs","item_id='$break_item'");
if (empty($break_item) || $break_item==0) {
	?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Bulk Item  is Required', "danger"); 
	</script>
	<?php
$errorMSG = "1";
}   

if(empty($errorMSG)){
	//get pices uom 
	$string="qty=qty+'$break_pcs' WHERE  item_id='$item_id'";
	if (Updatedata('kp_items',$string)) {
		$string2="qty=qty-1 WHERE  item_id='$break_item'";
		if (Updatedata('kp_items',$string2)) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Bulk Broken Successfully', "success"); 
		    $('#bulk-form')[0].reset();
			$('#modal').modal('toggle');
		</script>
		<?php
		}else{
			$error=mysqli_error($connection);
			?>
			<script type="text/javascript"> 
				var er= "<?php echo $error; ?>" ;
				var hulla = new hullabaloo();
			    hulla.send('Error while Breaking Bulk '+ er, "danger"); 
			</script>
			<?php	
		} 
	}else{
		$error=mysqli_error($connection);
		?>
		<script type="text/javascript"> 
			var er= "<?php echo $error; ?>" ;
			var hulla = new hullabaloo();
		    hulla.send('Error while Breaking Bulk '+ er, "danger"); 
		</script>
		<?php 
	}  
}

?>
