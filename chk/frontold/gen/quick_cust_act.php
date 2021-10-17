<?php
	session_start();
	include('../../inc/connection.php');
	include('../clude/funcs.php');

	$user_id = $_SESSION['user_id']; 

	$name = strtoupper($_REQUEST['name']);
	$phone_number = $_REQUEST['phone'];
	$phone= preg_replace('/^0/','+254',$phone_number);
	$email = $_REQUEST['email']; 

	$loc = strtoupper($_REQUEST['loc']);
	
	$action="LOADED|-|-|-|CHANGE SALES PERSON MODAL|";
	logs($action,"../../"); 
	 
	if (empty($name) &&empty($phone)) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Name or Phone cant be empty', "danger");  
		</script>
	<?php
	}elseif (check_duplicate('kp_customers','phone',$phone)) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Customer With same Phone exists', "danger");  
		</script>
	<?php
	}elseif (check_duplicate('kp_customers','name',$name)) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Customer With same name exists', "danger");  
		</script>
	<?php
	}else{ 
		$get_beba = mysqli_query($connection,"SELECT cust_id FROM kp_customers WHERE phone='$phone'") or die(mysqli_error($connection)); 
		if (mysqli_num_rows($get_beba)>1) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Customer Already in our database', "danger"); 
		    $('#gen-modal2').modal('toggle');
		</script>
		<?php
		}else{ 
			$create_beba = mysqli_query($connection,"INSERT INTO kp_customers(name,phone,location) VALUES('$name','$phone','$loc')") or die("Error creating Customer".mysqli_error($connection));
  			if (!$create_beba) {
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Danger!!! Item Not added', "danger"); 
		    $('#gen-modal2').modal('toggle');
		</script>
		<?php
		}else{  
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
		    hulla.send('Success!!! Customer Added Successfully', "success"); 
		    $('#gen-modal2').modal('toggle');
		</script>
		<?php
		}
	}
}
?>