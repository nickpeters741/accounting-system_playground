<?php
include('../inc/connection.php'); 
$option = '';
$sql1 = "SELECT * FROM  kp_users ORDER BY username ASC";
$result = mysqli_query($connection , $sql1) or die('could not fetch category');
	$option .="<option value = ''>"."----SELECT CATEGORY-----"."</option>";
while($row = mysqli_fetch_assoc($result)){   
    $option .="<option value = '".$row['user_id']."'>".strtoupper($row['username'])."</option>"; 
}
echo $option;
?>