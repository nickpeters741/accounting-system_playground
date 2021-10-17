<?php

include('includes/connection.php');
if (isset($_REQUEST['bname'])) {
	$customer_id = $_REQUEST['customer_id'];
	$bname = $_REQUEST['bname'];
	$cname = $_REQUEST['cname'];
	$alias = $_REQUEST['alias'];
	$phone = $_REQUEST['phone'];
	$address = $_REQUEST['address'];
	//$address2 = $_REQUEST['address2'];
	$city = $_REQUEST['city'];
	//$cust_type = $_REQUEST['cust_type'];

	 
	

	if (empty($bname) or empty($cname) or empty($alias)or empty($phone)  or empty($address) ) {
		header("Location:edit_customer.php?id=$customer_id");
	}else{
		$edit_customer = "UPDATE customers SET bname='$bname',cname='$cname',pnumber1='$pnumber1',alias='$alias',
						  address2='$address2',address='$address',cust_type='$cust_type_id', city='$city' WHERE customer_id='$customer_id' " or die("Error o 25");
	    $edit_customer_r = mysqli_query($connection,$edit_customer) or die("Error editing the customer profile");
	    if (!$edit_customer_r) {
	    	echo "Error editing";
	    }else{
	    	header("Location:customers.php?msg=2");
	    }
	}
}



?>