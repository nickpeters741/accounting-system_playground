<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$pin = $_REQUEST['name'];
$sale_id = $_REQUEST['sale_id'];
$user_id=$_SESSION['user_id'];

 if (empty($_REQUEST['name'])) {
?> 
<script type="text/javascript">
	$("#error-name").html("Password can't be empty!!!!!Trials are documented too");
	$("#error-name").show();
</script>
<?php
}else{
	$get_sale= mysqli_query($connection,"SELECT *  FROM kp_sales WHERE sale_id='$sale_id'");
    $gis = mysqli_fetch_assoc($get_sale);
    $day=$gis['day'];
    $amount=$gis['total_amount'];
    $type=$gis['type'];
    $cust_id=$gis['cust_id'];
     
	if (!front_perm($pin,2)) {
	?><div class="alert alert-danger">
            <h4><b>Wrong Passcode!! Trials are documented.</b></h4>
        </div>
        <?php
	}else{ 
		$appr_by=user_id($pin);

		//track delete
		$delete = "DELETE FROM kp_stock_track WHERE sale_id='$sale_id'";
        $delete_r = mysqli_query($connection,$delete) or die("Could not delete product");
        if (!$delete_r) {
        	?><div class="alert alert-danger">
            <h4><b>Error stock untracking!! Report this to developer.</b></h4>
        </div>
        <?php 
        }else{
        	$get_items= mysqli_query($connection,"SELECT item_id,price,qty,total  FROM kp_sale_items WHERE sale_id='$sale_id'");
        while ($gid = mysqli_fetch_assoc($get_items)) {
            $item_id = $gid ['item_id'];
            $number=$gid['qty'];
            $price = $gid['price'];
            $total = $gid['total'];

            $update_bar_store = mysqli_query($connection,"UPDATE kp_items SET qty=qty+'$number' WHERE item_id='$item_id'") or die(mysqli_error($connection));

            $insert = mysqli_query($connection,"INSERT INTO kp_del_items(sale_id,item_id,qty,price,total) VALUES('$sale_id','$item_id','$number','$price','$total')") or die("Error adding to deleted list.:".mysqli_error($connection));
        }

        $insert_deleted = mysqli_query($connection,"INSERT INTO kp_del_orders(sale_id,user_id,appr_by,amount,ord_day,del_day) VALUES('$sale_id','$user_id','$appr_by','$amount','$day',CURRENT_DATE)") or die('Error creating delete history'.mysqli_error($connection));


        $delete_orders = "DELETE FROM kp_sale_items WHERE sale_id='$sale_id'";
        $delete_orders_r = mysqli_query($connection,$delete_orders)or die("Could not delete the order");

        $delete_pay = "DELETE FROM kp_sale_payment WHERE sale_id='$sale_id'";
        $delete_pay_r = mysqli_query($connection,$delete_pay)or die("Could not delete the order");

        $delete_history = mysqli_query($connection,"DELETE FROM kp_sales WHERE sale_id='$sale_id'") or die("Could not delete the order hitory");
         if ($type==2) {
            $update_cust_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal-'$amount' WHERE cust_id='$cust_id'") or die(mysqli_error($connection)); 
        }

    $delete_req = "DELETE FROM kp_req WHERE sale_id='$sale_id'";
    $delete_req_r = mysqli_query($connection,$delete_req) or die("Could not delete product");
    $delete_req_items = "DELETE FROM kp_req_items WHERE sale_id='$sale_id'";
    $delete_req_items_r = mysqli_query($connection,$delete_req_items) or die("Could not delete product");
           
?>
<script type="text/javascript">
	var sale_id='<?php echo $sale_id ?>';
	$('#modal').modal('toggle');
    $('#row'+sale_id).remove();  
    var hulla = new hullabaloo();
    hulla.send('SALE VOIDED SUCCESSFULLY', "success");
</script>
<?php
 }
}
}