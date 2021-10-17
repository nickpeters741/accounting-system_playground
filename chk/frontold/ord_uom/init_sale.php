<?php
session_start();
include('../../inc/connection.php');
include('sale_funcs.php');
page_restrict();
$folder="front/ord/";  
if (isset($_GET['key'])) { 
   $cust_id=1;
   $mkt=$_SESSION['user_id'];
   $day=today(); 
   $sale_type=1;
   $sale_id=last_id($sale_type,$cust_id,$mkt,$day);
   sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day);
   $action="INITIALIZED|-|-|-|SALE NO ".$sale_id;
   logs($action,"../../");
   header("Location:order.php");
}elseif (isset($_GET['status'])) { 
   $day=$_GET['day'];
   $sale_type=$_GET['type'];
   $cust_id=$_GET['cust'];
   $mkt=$_GET['mkt'];
   $sale_id=$_GET['sale_id'];
   $sale_id=$_GET['id'];
   sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day);
   header("Location:order.php");
}elseif (isset($_POST['1'])) {	//NB 1 IS FOR CASH AND 2 IS FOR CREDIT
   $_SESSION['sale']=1; 
   $sale_type=1;
   $cust_id=$_POST['cust_id'];
   $mkt=$_POST['mkt'];
   $day=today();
   $sale_id=last_id($sale_type,$cust_id,$mkt,$day);
   sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day);
   header("Location:order.php");
}elseif (isset($_POST['2'])) {  
   $sale_type=2;
   $cust_id=$_POST['cust_id'];
   $mkt==$_POST['mkt'];   
   $day=$_POST['day'];
   $sale_id=last_id($sale_type,$cust_id,$mkt,$day);
   sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day);
   header("Location:order.php");
} 
?>