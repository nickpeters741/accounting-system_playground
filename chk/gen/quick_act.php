<?php
session_start();
include('../inc/connection.php');
include('../inc/gen_funcs.php');
$user_id=$_SESSION['user_id'];
$name = strtoupper($_POST['name']); 
$cat_id = $_POST['cat_id']; 
$code = strtoupper($_POST['code']); 
$base_price = $_POST['base_price'];
$max_price = $_POST['max_price'];
	
	if (empty($name) OR empty($base_price)) {?>
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Warning!!! Fields cannot be empty', "danger"); 
</script>
		<?php
	}elseif (check_duplicate("kp_items","stock_code",$code)) { ?>
<script type="text/javascript">
	var hulla = new hullabaloo();
    hulla.send('Warning!!! Item already Exist', "warning"); 
</script>
		<?php
	}else{
		$new_item = "INSERT INTO kp_items(stock_code,name,cat_id,base_price,max_price,qty) VALUES('$code','$name','$cat_id','$base_price','$max_price',1000)";
		$new_item_r = mysqli_query($connection,$new_item) or die("error uploading the details". mysqli_error($connection));

		$item_id = mysqli_insert_id($connection);
		$transact="ITEM CREATED IN QUICK ADD";
		$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
		if (!$new_item_r) {
		}else{ 
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send('Item Added Successfully', "success"); 
			</script>
			<?php 
	}
}

?>
