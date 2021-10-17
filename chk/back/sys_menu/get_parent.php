<?php

//header('Content-Type: application/json');

include('../../inc/connection.php');

$id=$_GET['id'];

//$connection = mysqli_connect($dbhost ,$dbuser ,$dbpass ,$dbname);

// select box option tag
$selectBoxOption1 = ''; 

// connect mysql server
$sql1 = "SELECT * FROM kp_menu WHERE level='$id'";
//$result1 = mysqli_query($sql1);

$result = mysqli_query($connection , $sql1)
              or die('could not fetch sub categories');

while($row = mysqli_fetch_assoc($result)){   
    $selectBoxOption1 .="<option value = '".$row['menu_id']."'>".$row['name']."</option>"; 
}
// return options
echo $selectBoxOption1;
//print json_encode($selectBoxOption1);
?>