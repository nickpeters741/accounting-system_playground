<?php
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$lpo_id = $row['lpo_id']; 
$cust_id = $row['cust_id'];
$day = $row['day']; 

if($lpo_id==0 OR empty($lpo_id)) {
	?>
	<script type="text/javascript">
		window.location.href ="../lpo/init_page.php";
	</script>
	<?php 
}elseif($cust_id==0 OR empty($cust_id)) {
	?>
	<script type="text/javascript">
		$('#cust-change').click();
	</script>
	<?php 
}else{
	//check item id
	if ( empty($_POST['item_id'])) {
		//check bbb
		$bar = $_POST['bar'];
		if (empty($bar)) {
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send("SCAN BARCODE !!!!!", "danger");
			</script>
			<?php
		}else{
			$qty=1;
			//check if barcode exists
			$get_item = mysqli_query($connection,"SELECT * FROM kp_items WHERE barcode="."'".$bar."'") or die("test".mysqli_error($connection)); 
			if (mysqli_num_rows($get_item)<1) {
				?>
				<script type="text/javascript">  
					var hulla = new hullabaloo();
					hulla.send("Item not in the system!!!! Ask Admin to add", "danger");   
				</script>
				<?php
			}else{
				$it = mysqli_fetch_assoc($get_item);
				$item_id = $it['item_id'];  
				$price=0;
				add_item();  
			}
		}
		//finish bb
	}else{
		//work on item 
		$item_id		=$_POST['item_id']; 
		$base 		= get_column('kp_items',"base_price","item_id='$item_id'"); 
		//check stock
		if (empty($_POST['qty']) || $_POST['qty']==0) {
			$qty = 1;
		}else{
			$qty =$_POST['qty']; 
		}
		if (empty($_POST['price']) || $_POST['price']==0) {
			$price = get_column('kp_items',"sprice","item_id='$item_id'");
		}else{
			$price=$_POST['price'];
		}
		if ($base > $price) {
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send("Price Cannot Be below Base price  <?php echo "base=".$base." Price=".$price; ?>", "danger");
			</script>
			<?php
		}else{
			add_item();  
		} 
	}
}

	 