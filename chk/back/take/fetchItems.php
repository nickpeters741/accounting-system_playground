<?php  
include('../../inc/connection.php'); 
$selectBoxOption1 = '';
$sql1 = "SELECT item_id,name FROM  kp_items WHERE take=2 ORDER BY name ASC";
$result = mysqli_query($connection , $sql1) or die('could not fetch items'); 	 
while($row = mysqli_fetch_assoc($result)){   
    $selectBoxOption1 .="<option value = '".$row['item_id']."'>".$row['name']."</option>"; 
}
echo $selectBoxOption1;
 
?>


