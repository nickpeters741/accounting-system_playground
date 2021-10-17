<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
page_restrict();
if (isset($_GET['id'])) {

	if ($_GET['id']==0 OR empty($_GET['id'])) {
      header("Location:return.php");  
   }else{
      $user_id= $_SESSION['user_id'];
      $sale_id=$_GET['id'];
      $cust_id=$_GET['cust_id']; 
      $get_s = mysqli_query($connection , "SELECT ret_id FROM kp_ret_status WHERE sale_id='$sale_id' ") or die(mysqli_error($connection));
      $sm=mysqli_num_rows($get_s);
      if ($sm>0) {
        $ret_id=mysqli_fetch_assoc($get_s)['ret_id'];
      }else{
         $get_ret = mysqli_query($connection , "SELECT ret_id FROM kp_ret_id") or die(mysqli_error($connection));
         $num=mysqli_num_rows($get_ret);
         if ($num<=0) {
            $create_new_id = mysqli_query($connection,"INSERT INTO kp_ret_id(ret_id) VALUES(1)") or die("Could not create a new order status".mysqli_error($connection));
            $ret_id = 1;
         }else{
            $ret_id=mysqli_fetch_assoc($get_ret)['ret_id']+1;
         }

         $update_ret_id = "UPDATE kp_ret_id SET ret_id='$ret_id'";
         $$update_ret_id_r = mysqli_query($connection,$update_ret_id) or die("Could not create a new order number".mysqli_error($connection));
         
         $add_status = mysqli_query($connection,"INSERT INTO kp_ret_status(ret_id,sale_id,cust_id,user_id) VALUES('$ret_id','$sale_id','$cust_id','$user_id')") or die("Could not create a new order status".mysqli_error($connection));
      }
      $folder='front/return/';
      return_thesion($folder,$ret_id,$sale_id,$cust_id);
      header("Location:return_page.php"); 
   }
}else{
   header("Location:return.php"); 
}
?>