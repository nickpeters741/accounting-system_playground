<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id   		= $_SESSION['user_id'];
$item_id    	= $_POST['item'];  
$fromuom      	= $_POST['uom_id'];
$fromcol		= "uom".$fromuom."qty";	
$errorMSG    	= "";

$touom          = get_column('kp_uom',"uom_id","qty=1");
$tocol		    = "uom".$touom."qty";
$breakqty		= get_column('kp_uom',"qty","uom_id='$fromuom'");
// /* uom */
if (empty($fromuom) || $fromuom==0) {
	?> 
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Bulk is Required', "danger"); 
	</script>
	<?php
$errorMSG = "1";
}   

if(empty($errorMSG)){
	//get pices uom
	$touom=get_column('kp_uom',"uom_id","qty=1");
	$tocol		= "uom".$touom."qty";
	$string=" $fromcol=$fromcol-1, $tocol=$tocol+'$breakqty' WHERE  item_id='$item_id'";
	if (Updatedata('kp_items',$string)) {
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
}

?>
