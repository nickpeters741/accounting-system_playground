<?php
session_start();
include('../../inc/connection.php'); 

$selectBoxOption1 = '';

$sql1 = "SELECT beba_id,name FROM  kp_beba";



$result = mysqli_query($connection , $sql1) or die('could not fetch beba');

	$selectBoxOption1 .="<option value = '0' selected>"."----SELECT BEBA-----"."</option>";

while($row = mysqli_fetch_assoc($result)){   

    $selectBoxOption1 .="<option value = '".$row['beba_id']."'>".$row['name']."</option>"; 

}

echo $selectBoxOption1;

?>