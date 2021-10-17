 <?php
session_start();
include('../../inc/connection.php');
include('sale_funcs.php'); 
$nm = $_GET['nm'];
 
$get_price = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$nm'");
$p = mysqli_fetch_assoc($get_price);
$sprice = $p['sprice'];
$wprice = $p['wprice'];
$base_price = $p['base_price'];
$qty = $p['qty']; 
?> 
 
	<div class="col-md-4" >
	    <button class="btn btn-xs btn-primary">BASE PRICE&nbsp; <?php echo $base_price; ?> 
	    </button>
	</div>
	<div class="col-md-4" >
	    <a data-toggle="modal" data-target="#modal" id="btn-price" onclick="price_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-warning">WHOLESALE&nbsp; <?php echo $wprice; ?> 
	    </a>
	</div> 
	<div class="col-md-4" >
	    <a data-toggle="modal" data-target="#modal" id="btn-price" onclick="price_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-warning">SELLING&nbsp; <?php echo $sprice; ?> 
	    </a>
	</div> 
	<!-- <div class="col-md-2"> 
		<a id="broker" data-toggle="modal"  data-target="#modal" data-id="<?php echo $nm; ?>" class="btn btn-sm btn-primary">BROKER</a> 
 	</div>  -->
<?php
 	$query = "SELECT * FROM kp_uom";
    $result = mysqli_query($connection,$query); 
    while($row = mysqli_fetch_array($result)){ 
        $uom_id=$row['uom_id'];
        $column='uom'.$uom_id;
	    $qtycol= "uom".$uom_id."qty";
        $item_query = "SELECT $column,$qtycol FROM kp_items WHERE item_id='$nm'";
	    $item_result = mysqli_query($connection,$item_query);
	    $tow = mysqli_fetch_array($item_result);
	    if ($tow[$column]==1) { 
		    ?>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#modal" id="btn-qty" onclick="qty_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-purple">  <?php echo $tow[$qtycol]; ?>&nbsp;<?php echo uom_name($nm,$uom_id); ?> </a> 
			</div>
			<?php
		}
	}
    ?>
	 
 

                      