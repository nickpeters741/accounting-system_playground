<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type'];
$sale_id = $row['sale_id'];

if($sale_type==2){ 
	$type=1;
}else{ 
	$type=2;
}

$verify = mysqli_query($connection,"UPDATE kp_sale_items SET type='$type' WHERE sale_id='$sale_id'") or die("Could not verify");
 $update = mysqli_query($connection,"UPDATE kp_sale_status SET type='$type' WHERE sale_id='$sale_id'") or die("Could not update");
	$update = mysqli_query($connection,"UPDATE kp_thesion SET sale_type='$type' WHERE user_id='$user_id'") or die("Could not update");
?> 
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Success!!! Sale Change ', "Success"); 
   $('#modal').modal('toggle');


location.reload();
</script>
 