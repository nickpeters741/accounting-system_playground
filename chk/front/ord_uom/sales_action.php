<?php
session_start();
include('../../inc/connection.php');
include('sale_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_type = $row['sale_type'];
$mkt = $row['mkt'];
$sale_id = $row['sale_id'];
$cust_id = $row['cust_id'];
$day = $row['day'];

//$bar = $_POST['bar'];
$qty=$_POST['qty'];
$saleuom=$_POST['uom'];
$uomqty="uom".$saleuom."qty";



if($sale_id==0 OR empty($sale_id)) {
	?>
	<script type="text/javascript">
		window.location.href ="../dash/admin_dash.php";
	</script>
	<?php 
}elseif($cust_id==0 OR empty($cust_id)) {
	?>
	<script type="text/javascript">
		$('#cust-change').click();
	</script>
	<?php 
}elseif($saleuom==0 OR empty($saleuom)) {
	?>
	<script type="text/javascript">
		$('#uom').click();
	</script>
	<?php 
}elseif ( empty($_POST['item_id'])) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send("SCAN BARCODE OR SELECT ITEM!!!!!", "danger");
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
				$bprice = $it['bprice'];
				$stock = item_stock($item_id) ; 
				//check stock
				if ($qty > $stock) {
				?>
				<script type="text/javascript">
					var hulla = new hullabaloo();
					hulla.send("Item Not in Stock", "danger");
				</script>
				<?php
				}else{
					make_sale($item_id,$sale_id,$day,$user_id,$price,0,$sale_type);
				} 
			}
		}
		//finish bb
	}else{
		//work on item
		$item_id		=$_POST['item_id']; 
		$base 			= get_column('kp_items',"base_price","item_id='$item_id'");
		$bprice 		= get_column('kp_items',"bprice","item_id='$item_id'");
		$stock 			= get_column('kp_items',"qty","item_id='$item_id'");
		$tax_id 		= get_column('kp_items',"tax_id","item_id='$item_id'");
		$uomstock 		= get_column('kp_items',$uomqty,"item_id='$item_id'");
		//check stock
		if (empty($_POST['price']) || $_POST['price']==0) {
			$price = get_column('kp_items',"sprice","item_id='$item_id'");
		}else{
			$price=$_POST['price'];
		}
		if ($base > $price) {
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send("Price Cannot Be below Base price", "danger");
			</script>
			<?php
		}elseif ($qty > $uomstock){
			$qtyuom=get_column('kp_uom','qty',"uom_id='$saleuom'");
			if ($qtyuom>1) {
				?>
				<script type="text/javascript">
					var hulla = new hullabaloo();
					hulla.send("Item Not in Stock", "danger");
				</script>
				<?php 
			}else{
				$uom=checkuom($item_id); 
				$uom_size=count($uom);
				if ($uom_size>0) {
					$tt=0;
					for ($i=0; $i < $uom_size; $i++) { 
						$uqty="uom".$uom[$i]."qty";
						$uoqty=get_column('kp_items',$uqty,"item_id='$item_id'");
						$tt=$tt+$uoqty;
					}
					?>
					<script type="text/javascript">
						break_bulk('<?php echo $item_id; ?>');
					</script>
					<?php
				}else{
					?>
					<script type="text/javascript">
						var hulla = new hullabaloo();
						hulla.send("Item Not in Stock", "danger");
					</script>
					<?php
				}
			}
			
		}else{
			make_sale($item_id,$sale_id,$day,$user_id,$price,$qty,$sale_type,$saleuom);
		} 
	}
}


?>