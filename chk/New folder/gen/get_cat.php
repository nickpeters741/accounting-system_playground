<?php
include('../inc/connection.php'); 
$option = '';
$sql1 = "SELECT * FROM  kp_category ORDER BY name ASC";
$result = mysqli_query($connection , $sql1) or die('could not fetch category');
	$option .="<option value = ''>"."----SELECT CATEGORY-----"."</option>";
while($row = mysqli_fetch_assoc($result)){   
    $option .="<option value = '".$row['cat_id']."'>".strtoupper($row['name'])."</option>"; 
}
echo $option;
?>