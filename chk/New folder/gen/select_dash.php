<?php
session_start(); 
include('../inc/connection.php'); 
include('../inc/gen_funcs.php');
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$dash = $row['dashboard'];  
?>   
<div class="modal-content" style="width: 350px;">
  <div class="modal-heading"> 
    <div style="padding: 10px;">
      <h4>SELECT DASHBOARD TO ACCESS </h4>
    </div>
  </div>
  <div class="modal-body row" > 
  	<a href="back/dash/<?php echo $dash; ?>" class="dash-btn">BACK END </a>
  	<a href="front/dash/<?php echo $dash; ?>" class="dash-btn text-center">SALES</a>
  </div>
</div> 
 
