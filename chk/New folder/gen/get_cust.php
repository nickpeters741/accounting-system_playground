<?php
include('../inc/connection.php'); 
$option = '';
$sql1 = "SELECT * FROM  kp_customers ORDER BY name ASC";
$result = mysqli_query($connection , $sql1) or die('could not fetch Customers');
	$option .="<option value = '0'>"."----SELECT CUSTOMER-----"."</option>";
while($row = mysqli_fetch_assoc($result)){   
    $option .="<option value = '".$row['cust_id']."'>".$row['phone']."-".strtoupper($row['name'])."</option>"; 
}
echo $option;
?>