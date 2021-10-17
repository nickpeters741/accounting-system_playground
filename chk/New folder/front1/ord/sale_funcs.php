<?php
$filename = "../../inc/gen_funcs.php";
if (file_exists($filename)){
    include('../../inc/gen_funcs.php');
}elseif (file_exists("../inc/gen_funcs.php")){
    include('../inc/gen_funcs.php');
}else{
    
}

function salerestrict(){
	global $sale_id,$mkt,$cust_id;
	if ($sale_id==0) {
	  ?>
	 <script> 
	  window.location = "../dash/";
	 </script>
	  <?php
	}elseif ($mkt==0) {
	  ?>
	 <script>
	  $(document).ready(function () {
	    $("#salesperson").click();
	  });
	 </script>
	  <?php
	}elseif ($cust_id==0) {
	  ?>
	 <script>
	  $(document).ready(function () {
	    $("#cust-change").click();
	  });
	 </script>
	  <?php
	}  
}

function item_stock($item_id){
	global $connection;
	$get_item = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'") or die("test".mysqli_error($connection)); 
	$it = mysqli_fetch_assoc($get_item); 
	$stock = $it['qty'];
	return $stock;		
}
 
function track_stock($item_id,$sale_id,$qty,$stock_bal,$day){
	global $connection,$user_id;
	$check_track= "SELECT * FROM kp_stock_track WHERE item_id='$item_id' AND sale_id='$sale_id'";
	    $check_track_r = mysqli_query($connection,$check_track) or die("Could not get the product price");
		if (mysqli_num_rows($check_track_r)==0) {
	    	$tracking = mysqli_query($connection,"INSERT INTO kp_stock_track(item_id,sale_id,user_id,qty,status,day,stock_bal) VALUES('$item_id','$sale_id','$user_id','$qty','OUT','$day','$stock_bal')") or die("Error stock tracking". mysqli_error($connection));
	    }else{
	    	$update_track = "UPDATE kp_stock_track SET qty=qty+'$qty', stock_bal='$stock_bal' WHERE item_id='$item_id' AND sale_id='$sale_id'";
    		$update_track_r = mysqli_query($connection,$update_track)  or die("Could not track ". mysqli_error($connection));  
	    }
}


function checkuom($item_id){
	global $connection;
	$array = array();
	$query = "SELECT * FROM kp_uom";
  	$result = mysqli_query($connection,$query); 
  	while($row = mysqli_fetch_array($result)){ 
	    $uom_id=$row['uom_id'];
	    $column='uom'.$uom_id;
	    $item_query = "SELECT $column FROM kp_items WHERE item_id='$item_id'";
	    $item_result = mysqli_query($connection,$item_query);
	    $tow = mysqli_fetch_array($item_result);
	    if ($tow[$column]==1) {
	    	$array[] = $row['uom_id'];
	    }
  	}
  	return $array;
}

function make_sale($item_id,$sale_id,$day,$user_id,$price,$qty,$sale_type){
	global $connection;
	//check if item has portion  
	$stock = get_column('kp_items',"qty","item_id='$item_id'"); 
	$bprice = get_column('kp_items',"bprice","item_id='$item_id'");
	if ($price==0) { 
		$sprice = get_column('kp_items',"sprice","item_id='$item_id'"); 
	}else{ 
		$sprice =$price;
	} 

	$tax_id = get_column('kp_items',"tax_id","item_id='$item_id'");
	$tax=get_column("kp_tax","percent","tax_id=$tax_id");
	$tax_type=get_column("kp_settings_gen","tax_type","id=1"); 
	$commission=0;
	$profit=$sprice-$bprice; 
	$total = $qty * $sprice;
	$stock_bal=$stock-$qty;
	$portion=0;
	if ($tax_type==1) {
		$q=100+$tax;
		$tax_amount=($tax/$q)*$total;
	}else{ 
		$tax_amount=($tax/100)*$total;
	}
	if ($portion==1) { 
		///**************Deduct raw materials from the store *******//
		$get_portion_items = mysqli_query($connection,"SELECT * FROM kp_items_portion WHERE item_id='$item_id'");
		while ($row = mysqli_fetch_assoc($get_portion_items)){
		    $raw_id = $row['raw_id'];
		    $raw_qty = $row['qty'];
		    $update_item_stock = mysqli_query($connection,"UPDATE kp_items SET qty=qty-'$raw_qty' WHERE item_id='$raw_id'") or die(mysqli_error($connection));
		    track_stock($item_id,$sale_id,$raw_qty,$stock_bal,$day);
		}  
	}else{
		$update_item_stock = mysqli_query($connection,"UPDATE kp_items SET qty=qty-'$qty' WHERE item_id='$item_id'") or die(mysqli_error($connection));
		track_stock($item_id,$sale_id,$qty,$stock_bal,$day);
	}

	$get_order= "SELECT * FROM kp_sale_items WHERE item_id='$item_id' AND sale_id='$sale_id'";
	$get_order_r = mysqli_query($connection,$get_order) or die("Could not get the product price");
    if (mysqli_num_rows($get_order_r)==0) {
    	$add_order = "INSERT INTO kp_sale_items(sale_id,item_id,qty,price,total,day,profit,commission,type,bprice,tax,tax_id)  VALUES('$sale_id','$item_id','$qty','$sprice','$total','$day','$profit','$commission','$sale_type','$bprice','$tax_amount','$tax_id')";
		$add_order_r = mysqli_query($connection,$add_order) or die("Could not add order". mysqli_error($connection));
		 
    }else{
        $update_order = "UPDATE kp_sale_items SET qty=qty+'$qty', total=qty*price,tax=('$tax'/'$q')*total  WHERE item_id='$item_id' AND sale_id='$sale_id'";
        $update_order_r = mysqli_query($connection,$update_order) or die("Could not create". mysqli_error($connection)); 
   
    } 

    $action="ADDED|".$qty."|". get_item($item_id)."|TO SALE NO|".$sale_id."|";
	logs($action,"../../");	
}

function last_id($sale_type,$cust_id,$mkt,$day){
	global $connection;
	$user_id = $_SESSION['user_id'];
	$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
	$row=mysqli_fetch_assoc($get_details);
	$shop = $row['shop'];
	$check_order=mysqli_query($connection,"SELECT sale_id FROM kp_sale_status WHERE  user_id='$user_id' AND cust_id='$cust_id' AND status=2 AND type='$sale_type'");
	if (mysqli_num_rows($check_order) > 0) {
		$on = mysqli_fetch_assoc($check_order);
		$sale_id = $on['sale_id'];
	}else{
		$get_table = "SELECT sale_id FROM kp_sale_id";
		$get_table_r = mysqli_query($connection,$get_table) or die("Could not get the order numbers");
		$row = mysqli_fetch_array($get_table_r);
		if (empty($row)) { 
			$create_new_id = mysqli_query($connection,"INSERT INTO kp_sale_id(sale_id) VALUES(0)") or die("Could not create a new sale id");
			$sale_id = 1;
		}else{
			$last_sale_id = $row['sale_id'];
			$sale_id = $last_sale_id + 1;
		}
		$create_order_status = "INSERT INTO kp_sale_status(sale_id,user_id,cust_id,mkt,type,day) VALUES('$sale_id','$user_id','$cust_id','$mkt','$sale_type','$day')";
		$create_order_status_r = mysqli_query($connection,$create_order_status) or die("Could not create a new sale status");

		$create_last_order_no = "UPDATE kp_sale_id SET sale_id='$sale_id'";
		$create_last_order_no_r = mysqli_query($connection,$create_last_order_no) or die("Could not create a new order number");
	}
	return $sale_id;
}
?>