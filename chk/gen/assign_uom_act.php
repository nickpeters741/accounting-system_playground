<?php
session_start();
include('../inc/connection.php');
include('../inc/gen_funcs.php');
$user_id   		= $_SESSION['user_id'];
$item_id    	= $_POST['item'];  
$uom         	= $_POST['uom'];
$uom_id      	= $_POST['uom_id'];	
$errorMSG    	= "";
// /* uom */
if (empty($_POST["uom"])) {
	?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Unit of Measure is Required', "danger"); 
	</script>
	<?php
	$errorMSG = "1";
} 

if(empty($errorMSG)){
	$array = array(); 
	foreach($uom_id as $i) {
		$array[] = "uom".$i."=1,"."uom".$i."qty=10"; 
	}
	$data_values=implode(',',$array);
	$string=$data_values.",uom='$uom' WHERE  item_id='$item_id'";
	if (Updatedata('kp_items',$string)) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Unit of Measure assigned Successfully', "success"); 
		    get_uom();
		    $('#uom-form')[0].reset();
		    $('#modal').modal('toggle');
		</script>
		<?php 
	}else{
		$error=mysqli_error($connection);
		?>
		<script type="text/javascript"> 
			var er= "<?php echo $error; ?>" ;
			var hulla = new hullabaloo();
		    hulla.send('Error while adding item '+ er, "danger"); 
		</script>
		<?php 
	}  
}

?>
