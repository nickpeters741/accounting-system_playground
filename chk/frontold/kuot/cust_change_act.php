<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id = $_SESSION['user_id'];
$cust_id = $_REQUEST['cust_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id'];

 if (empty($cust_id) OR $cust_id==0 ) {
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Danger!!! Customer Cannot be Empty Please select !!!!!', "danger");  
</script>
<?php
}else{   
	$update = mysqli_query($connection,"UPDATE kp_qt_status SET cust_id='$cust_id' WHERE qt_id='$qt_id'") or die("Could not update");

	$update = mysqli_query($connection,"UPDATE kp_thesion SET cust_id='$cust_id' WHERE user_id='$user_id'") or die("Could not update");
	
	if (!$update) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
	    hulla.send('Danger!!! Contact Developer or Manager', "danger"); 
	   // $('#modal2').modal('toggle');
	</script>
    <?php
	}else{
		$_SESSION['cust_id']=$cust_id;
		$action="CHANGED|-|-|-|SALE CUSTOMER |". get_cust($cust_id);
		logs($action,"../../"); 
	}
	?>
	<script type="text/javascript">
		$("#custo").text('CUSTOMER: '+'<?php echo get_cust($cust_id); ?>');
		var hulla = new hullabaloo();
	    hulla.send('Success!!! Customer updated successfully', "success");  
	    $('#modal').modal('toggle');
	</script>
  <?php
	}
	?>