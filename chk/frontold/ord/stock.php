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
$bar = $p['barcode']; 
?> 
 
	<!--  <div class="col-md-2"> 
		<a id="broker" data-toggle="modal"  data-target="#modal" data-id="<?php echo $nm; ?>" class="btn btn-xs btn-lime">BROKER</a> 
 	</div>  --> 
	<div class="col-md-3" >
	    <button class="btn btn-xs btn-primary">BASE PRICE&nbsp; <?php echo $base_price; ?>  </button>
	</div> 
	<div class="col-md-3" >
	    <a data-toggle="modal" data-target="#modal" id="btn-price" onclick="price_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-primary">SELLING&nbsp; <?php echo $sprice; ?> 
	    </a>
	</div> 
	<div class="col-md-2">
		<a data-toggle="modal" data-target="#modal" id="btn-qty" onclick="qty_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-purple">QTY&nbsp;<?php echo $qty; ?></a> 
	</div>  

 <div class="col-md-2">
		<a data-toggle="modal" data-target="#modal" id="barcode" onclick="bar_adj(<?php echo $nm; ?>)" class="btn  btn-xs btn-lime">BARCODE</a> 
	</div>  


                      