
<?php
	session_start();
	include('../inc/connection.php');
	// include('../clude/funcs.php');
	$user_id = $_SESSION['user_id']; 
	$name = strtoupper($_REQUEST['name']);
	$phone = $_REQUEST['phone'];
	$loc = $_REQUEST['loc'];
	$email = $_REQUEST['email'];
	$pin = $_REQUEST['pin'];
	$vat = $_REQUEST['vat'];
	$address =  strtoupper($_REQUEST['address']); 
	if (empty($name) &&empty($phone)) {
		?>
		<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('MAKESURE YOU ENTER SUPPLIER DETAILS', "warning"); 
</script>
	<?php
	}else{ 

	$get_sup = mysqli_query($connection,"SELECT sup_id FROM kp_suppliers WHERE sup_phone='$phone' AND sup_phone!=0") or die(mysqli_error($connection)); 
	if (mysqli_num_rows($get_sup)>1) {
		?>
		<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('SUPPLIER ALREADY IN OUR DATABASE', "danger"); 
</script>
	<?php
	}else{ 

		$create_beba = mysqli_query($connection,"INSERT INTO kp_suppliers(sup_name,sup_address,sup_email,sup_phone,sup_location,sup_pin,sup_vat,created_by) VALUES('$name','$address','$email','$phone','$loc','$pin','$vat','$user_id')") or die(mysqli_error($connection));
  
	if (!$create_beba){
		?>
		<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('SUPPLIER NOT CREATED', "danger"); 
</script>
	<?php
	}else{  
		?>
		<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('SUPPLIER Added Successfully', "success"); 
</script>
	<?php
	
	}
 }
}
?>