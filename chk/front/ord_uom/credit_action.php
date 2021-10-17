<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$folder="front/ord/"; 
thesion_page($folder);
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id']; 
$cust_id = $row['cust_id'];
$mkt = $row['mkt'];
$day = $row['day']; 
$type = $row['sale_type']; 
$total=grand_total($sale_id);

$deli = $_REQUEST['deli'];
$reg = $_REQUEST['reg'];
$beba = $_REQUEST['beba_sta'];
$means = $_REQUEST['means'];  
$disc = $_REQUEST['disc'];

$bal=cust_bal($cust_id);

$ord_total=$total+$deli;

$cust_bal=$bal+$ord_total;


if ($deli==0) {

}else{
	$insert_delivery= mysqli_query($connection,"INSERT INTO kp_logistics(beba_id,sale_id,amount,means,reg,day) VALUES('$beba_sta','$sale_id','$damount','$means','$reg',CURRENT_DATE)") or die(mysqli_error($connection));
	$action="ADDED|-|-|-|LOGISTICS FOR CREDIT SALE NO ".$sale_id;
	logs($action,"../../");
}
 
$create_sale = mysqli_query($connection,"INSERT INTO kp_sales(sale_id,cust_id,user_id,sale_amount,disc,total_amount,type,day,mktr,sale_bal,cf_bal)  VALUES('$sale_id','$cust_id','$user_id','$ord_total','$disc','$ord_total','$type','$day','$mkt','$ord_total','$cust_bal')")  ;//or die(mysqli_error($connection));
 
if (!$create_sale) {
    $action="PLACED ALREADY PLACED|-|-|-|CREDIT SALE|".$sale_id;
	logs($action,"../../");
		?>
    <script type="text/javascript">
        window.location = "../print/print_sale.php";
    </script>
<?php
}else{
	cust_trans($cust_id,"SALE","sale_id",$sale_id,$ord_total);
    // $msg="Thank you for your ".$ord_total." Order";
    // create_sms($cust_id,$msg);
	$action="PLACED|-|-|-|CREDIT SALE|".$sale_id;
	logs($action,"../../");

    $update_balance = mysqli_query($connection , "UPDATE kp_customers SET  bal=bal+'$ord_total' WHERE  cust_id='$cust_id'") or die(mysqli_error($connection));

    $clear_sale_status = mysqli_query($connection,"DELETE FROM kp_sale_status  WHERE sale_id='$sale_id'") or die("Error"); 
    //sale_req($sale_id);

 ?>
    <script type="text/javascript">
        // window.location = "../print/print_sale.php";
    </script>
<?php
    }
?>