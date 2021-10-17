<?php
include('../inc/connection.php'); 
$option = '';
$sql1 = "SELECT * FROM  kp_suppliers ORDER BY sup_name ASC";
$result = mysqli_query($connection , $sql1) or die('could not fetch supplier');
	$option .="<option value = ''>"."----SELECT SUPPLIER-----"."</option>";
while($row = mysqli_fetch_assoc($result)){   
    $option .="<option value = '".$row['sup_id']."'>".strtoupper($row['sup_name'])."</option>"; 
}
echo $option;
?>