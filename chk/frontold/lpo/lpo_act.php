<?php
session_start();
include('../../inc/connection.php');
include('funcs.php'); 
$folder="front/lpo/"; 
thesion_page($folder);
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$lpo_id = $row['lpo_id']; 
$cust_id = $row['cust_id']; 
$day = $row['day'];  
$shop = $row['shop'];  
$total=column_total('kp_lpo_items','total',"lpo_id='$lpo_id'");//grand_total($sale_id);

 
$taxby = $_REQUEST['taxby'];
$tax = $_REQUEST['tax'];
$refno = $_REQUEST['refno'];

$bal=get_column('kp_customers','bal',"cust_id='$cust_id'");//cust_bal($cust_id);

if ($taxby==1 ){  
    $get_item = "SELECT item_id,total FROM kp_lpo_items WHERE lpo_id='$lpo_id'";
    $get_item_r = mysqli_query($connection,$get_item) or die("Could not fetch item_id" );
    while ($t = mysqli_fetch_assoc($get_item_r)) {
        $item_id=$t['item_id'];
        $itemtotal=$t['total'];
        $tax_id=get_column('kp_items','tax_id',"item_id='$item_id'");
        $perc=get_column('kp_tax','percent',"tax_id='$tax_id'");
        if ($tax==1) {
          $q=100+$perc;
          $vatt=($perc/$q)*$itemtotal;
          $vatable=$itemtotal-$vatt;
        }else{
            $vatable=$itemtotal;
            $vatt=($perc/100)*$itemtotal;
        }
        $update_lpo_item = mysqli_query($connection,"UPDATE kp_lpo_items SET tax_id='$tax_id',tax_type='$tax',vat='$vatt',vatable='$vatable' WHERE lpo_id='$lpo_id' AND item_id='$item_id'");
    }

    $vatable = column_total('kp_lpo_items','vatable',"lpo_id='$lpo_id'"); 
    $perc = 0; 
    $vatt =column_total('kp_lpo_items','vat',"lpo_id='$lpo_id'");   

}else{
    $vatable = $_REQUEST['vatable']; 
    $perc = $_REQUEST['perc']; 
    $vatt = $_REQUEST['vatt']; 
    $tt = $_REQUEST['tt'];
}
$create_sale = mysqli_query($connection,"INSERT INTO kp_lpo(lpo_id,cust_id,user_id,amount,day,cf_bal,tax_type,vatable,vat,tax_perc,refno,shop)  VALUES('$lpo_id','$cust_id','$user_id','$total','$day','$bal','$tax','$vatable','$vatt','$perc','$refno','$shop')");
 
if (!$create_sale) {
    $action="PLACED ALREADY PLACED|-|-|-|LPO|".$lpo_id;
	logs($action,"../../");
	?>
        <script type="text/javascript">
            window.location = "print_lpo.php";
        </script>
    <?php
}else{
	cust_trans($cust_id,"LPO","lpo_id",$lpo_id,$total); 
	$action="PLACED|-|-|-|LPO NO |".$sale_id;
	logs($action,"../../");

  

    $clear_sale_status = mysqli_query($connection,"DELETE FROM kp_lpo_status  WHERE lpo_id='$lpo_id'") or die("Error"); 
    //sale_req($sale_id);

     ?>
        <script type="text/javascript">
             window.location = "print_lpo.php";
        </script>
    <?php
}
?>