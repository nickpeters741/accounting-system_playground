<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id = $_SESSION['user_id'];
$sup_id = $_REQUEST['id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];

 if (empty($sup_id) OR $sup_id==0 ) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Danger!!! Customer Cannot be Empty Please select !!!!!', "danger");  
</script>
<?php
}else{   
	$update = mysqli_query($connection,"UPDATE kp_po_status SET po_id='$po_id' WHERE sale_id='$sale_id'") or die("Could not update po status");
	$update = mysqli_query($connection,"UPDATE kp_thesion SET sup_id='$sup_id' WHERE user_id='$user_id'") or die("Could not update thesion");
	if (!$update) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Danger!!! Contact Developer or Manager', "danger"); 
	   // $('#modal2').modal('toggle');
	</script>
    <?php
	}else{ 
		$action="CHANGED|-|-|-|PURCHASE SUPPLIER |". get_sup($sup_id);
		logs($action,"../../"); 
	}
	?>
	<script type="text/javascript">
		$("#supo").text('<?php echo get_sup($sup_id); ?>');
		var hulla = new hullabaloo();
	    hulla.send('Success!!! Customer updated successfully', "success");  
	    $('#modal').modal('toggle');
	</script>
  <?php
	}
	?>