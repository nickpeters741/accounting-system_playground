<?php
session_start();
include('../../inc/connection.php');
include('sale_funcs.php'); 
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
$shop = $row['shop']; 
$total=column_total('kp_sale_items','total',"sale_id='$sale_id'");//grand_total($sale_id);

$deli = $_REQUEST['deli'];
$reg = $_REQUEST['reg'];
$beba = $_REQUEST['beba_sta'];
$means = $_REQUEST['means'];  
$disc = $_REQUEST['disc'];
$vatable = $_REQUEST['vatable'];  
$vatt = $_REQUEST['vatt'];  
$tax = $_REQUEST['tax'];
$lporefno = $_REQUEST['lporefno'];
$delino = $_REQUEST['delino'];
$bal=get_column('kp_customers','bal',"cust_id='$cust_id'");//cust_bal($cust_id);

$ord_total=$total+$deli;

$cust_bal=$bal+$ord_total;


if ($deli==0) {

}else{
	$insert_delivery= mysqli_query($connection,"INSERT INTO kp_logistics(beba_id,sale_id,amount,means,reg,day) VALUES('$beba_sta','$sale_id','$damount','$means','$reg',CURRENT_DATE)") or die(mysqli_error($connection));
	$action="ADDED|-|-|-|LOGISTICS FOR CREDIT SALE NO ".$sale_id;
	logs($action,"../../");
}
 //echo "INSERT INTO kp_sales(sale_id,cust_id,user_id,sale_amount,disc,total_amount,type,day,mktr,sale_bal,cf_bal,tax_type,vatable,vat)  VALUES('$sale_id','$cust_id','$user_id','$ord_total','$disc','$ord_total','$type','$day','$mkt','$ord_total','$cust_bal','$tax','$vatable','$vatt')";
$create_sale = mysqli_query($connection,"INSERT INTO kp_sales(sale_id,cust_id,user_id,sale_amount,disc,total_amount,type,day,mktr,sale_bal,cf_bal,tax_type,vatable,vat,shop,deliverynoteid,lpo_refno)  VALUES('$sale_id','$cust_id','$user_id','$ord_total','$disc','$ord_total','$type','$day','$mkt','$ord_total','$cust_bal','$tax','$vatable','$vatt','$shop','$delino','$lporefno')")  or die(mysqli_error($connection));
 
if (!$create_sale) {
    $action="PLACED ALREADY PLACED|-|-|-|CREDIT SALE|".$sale_id;
	logs($action,"../../");
    echo "PLACED ALREADY PLACED|-|-|-|CREDIT SALE|";
	?>
        <script type="text/javascript">
            //window.location = "../print/print_credit.php";
        </script>
    <?php
}else{

    //Get last invoice id for update
    $invoiceid = invoice_id($shop);
    $curr_inv_id = $invoiceid + 1;
    $create_inv_id = mysqli_query($connection,"INSERT INTO kp_invoiceids(shop,invoiceid,saleid) VALUES('$shop' , '$curr_inv_id', '$sale_id')") or die(mysqli_error($connection));;

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
            window.location = "../print/print_credit.php";
        </script>
    <?php
}
?>