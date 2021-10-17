<?php
include('../../inc/connection.php');
$cat_id=$_GET['id'];
$Option1 = ''; 
$sql1 = "SELECT * FROM kp_sub_cat " ;
echo $sql1;
$result = mysqli_query($connection , $sql1) or die('could not fetch sub categories');
$num=mysqli_num_rows($result);
$row = mysqli_fetch_assoc($result);
 
if ($num==0) {
  	$Option1 .="<option value = '".$num."'>"."NO SUBS"."</option>";
}else{
  	$Option1 .="<option value = "."0".">"."-----SELECT CATEGORY-----"."</option>";
  	while($row = mysqli_fetch_assoc($result)){   
  		$Option1 .="<option value = '".$row['sub_id']."'>".$row['name']."</option>"; 
  	}
}
echo $Option1;
//print json_encode($Option1);
?>