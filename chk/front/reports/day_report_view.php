<?php 
require("../clude/head.php");
$day = date('Y-m-d');
$type = $_GET['type']; 
$sum=0;
if ($type==1) {
	$type_name="CASH";
	$str="INNER JOIN kp_sale_payment ON kp_sales.sale_id = kp_sale_payment.sale_id  WHERE kp_sales.day='$day' AND kp_sales.type='$type'";
}elseif ($type==2) {
	$type_name="CREDIT";
	$str="WHERE kp_sales.day='$day' AND kp_sales.type='$type'";
}else{
	$type_name="COMBINED";
	$str="WHERE kp_sales.day='$day'";
}
if ($type==1 OR $type==2) {
$pay_count= mysqli_query($connection,"SELECT count(pay_id) as pays FROM  kp_pay_mode");
$ref_count= mysqli_query($connection,"SELECT count(pay_id) as pay_ref FROM  kp_pay_mode WHERE has_ref=1");

$ra = mysqli_fetch_assoc($ref_count);
$ref_count=$ra['pay_ref'];

$ca = mysqli_fetch_assoc($pay_count);
$count=$ca['pays'];
}else{
$count=0;	
}

$sumsc=0;
?>
 
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
  ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
  <?php 
    require("../clude/menu.php");
  ?>
  <!-- end #sidebar -->
  <!-- begin #content -->
  <div id="content" class="content">
  	<div class="print col-md-12" style="background-color: white;">
  		<table class="table">
			<thead>
			   	<tr>
			   		<th colspan="<?php echo $count+9+$ref_count; ?>" style="font-size: 19px;"><b><?php echo $day." ".$type_name;?>  SALES REPORT</b></th>
			   	</tr>
			   	<tr>
			   		<th>Receipt No:</th>
			   		<th>Ref No:</th>
			      	<th>Customer</th>
			      	<th>Served By</th>
			      	<th>Time</th> 
			      	<?php 
			      	if ($type==1) {
			      	$pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
			    	?>
			    	<th>Store Credit</th> 
			    	<?php
			   	while ($pa = mysqli_fetch_assoc($pay_mode)) {  
			   		?>
			   		<th style=" color: white; background-color: <?php echo $pa['btn_color']; ?>"><?php echo $pa['name']; ?></th>
			   		<?php 
			   		if ($pa['has_ref']==1) { 
			   		?>
			   		<th style=" color: white; background-color: <?php echo $pa['btn_color']; ?>"><?php echo $pa['name']; ?> CODE</th>
			   		<?php
			   	} 
			   	} 
			} 
			   		?>
			        <th>Total</th>						         
			        <th class="hidden-print">Action</th>
			    </tr>
			</thead>
			<tbody>
              <?php  
			   $sales = mysqli_query($connection,"SELECT * FROM kp_sales  $str ORDER BY kp_sales.sale_id");
			   if (mysqli_num_rows($sales) < 1) {
			   	?>
			   	<tr>
			   		<td colspan="<?php echo $count+8; ?>">
			   		
			   	<div class="alert alert-warning">
			   		<p>There are no recorded sales</p>
			   	</div>	
			   		</td>
			   	</tr>
			   	<?php
			   }else{
			   	while ($sa = mysqli_fetch_assoc($sales)) {
			   		$sale_id = $sa['sale_id'];
			   		$cust_id = $sa['cust_id'];
			   		$user_id = $sa['user_id'];
			   		$refno = $sa['refno'];
			   		$typo = $sa['type'];
			   		if ($typo==1) {
			   			$sale="CASH";
			   		}elseif ($typo==2) {
			   			$sale="CREDIT";
			   		}else{
			   			$sale="ERROR";
			   		}
			   		$datime = date_create($sa['datime']);
			   		$sale_amount=$sa['total_amount'];
			   		$sum=$sum+$sale_amount; 
			   	?>
			   		<tr ondblclick="view(<?php echo $sale_id; ?>)">
			   			<td><?php echo $sale_id; ?></td>
			   			<td><?php echo $refno; ?></td>
			   			<td><?php echo get_cust($cust_id); ?></td>						   		
			   			<td><?php echo get_user($user_id); ?></td>
			   			<td><?php echo date_format($datime, "H:i:s"); ?></td> 
			   			
			   			<?php
			   				if ($type==1) {
					   			$pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode");
					   		
			   		$sumsc=$sumsc+$sa['modesc'];	?>
			    	 
			      	<td><?php echo $sa['modesc']; ?></td> 
			    	<?php
			    	while ($pa = mysqli_fetch_assoc($pay_mode)) {
			    		$mode=$pa['pay_id']; 
			    		?>
					   	<td><?php echo $sa['mode'.$mode]; ?></td>
					   	<?php 
					   	if ($pa['has_ref']==1) { 
					   		?>
					   		<td><?php echo $sa['moderef'.$mode]; ?></td>
					   		<?php
					   	}
					   }
					   		} 
			   			?>
			   			<td><?php echo $sale_amount; ?></td>
			   			<td class="hidden-print"> 
			   			</button><button onclick="reprint(<?php echo $sale_id.",".$type; ?> );"  ><i class='fa fa-print' ></i></button></td>

			   		</tr>
			   		 

			   	<?php	
			   	}
			   	?>
			   	<!-- <tfoot> -->
			   		<tr>
			   			<th colspan="<?php echo 5; ?>" class="text-center">Total Amount</th> 
			   			<?php
			   			if ($type==1) {
			   				$pay_mode = mysqli_query($connection,"SELECT * FROM  kp_pay_mode ");
			   				?>

			   			<th><?php echo $sumsc; ?></th>
			   			<?php
			   				while ($pa = mysqli_fetch_assoc($pay_mode)) {
			   					$mode=$pa['pay_id'];  	
			   				?>
			   				<th><?php echo paymode_total($mode,$day,$type);?></th>
			   				<?php
			   					if ($pa['has_ref']==1) { 
			   						?>
			   						<th>-</th>
			   						<?php
			   					}
			   				}
			   			}
			   	?>
			   			<th><?php echo $sum; ?></th>
			   			<th class="hidden-print"></th>
			   		</tr>
			   	<!-- </tfoot> -->
			   	<?php
			   }
			   ?>

			
			
				</tbody>
			

		    	</table>

			<!-- end invoice -->
		</div>
 
	</div>
 <!-- end page container -->
 <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../assets/crossbrowserjs/html5shiv.js"></script>
    <script src="../assets/crossbrowserjs/respond.min.js"></script>
    <script src="../assets/crossbrowserjs/excanvas.min.js"></script>
  <![endif]-->
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script>
  
  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== -->

  <!-- ================== BEGIN PAGE LEVEL JS ================== -->
  <script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
  <script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/jszip.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/pdfmake.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.print.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/AutoFill/js/dataTables.autoFill.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/KeyTable/js/dataTables.keyTable.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/RowReorder/js/dataTables.rowReorder.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
  <script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
  <!-- ================== END PAGE LEVEL JS ================== -->
   
<script type="text/javascript">
function view(id){
	$('#modal').modal('show');
	$.ajax({
  		url: 'sale_items.php',
        typr: 'POST',
        data: 'id='+id,
        dataType: 'html'
    })
    .done(function(data){
    $('#load').html('');
    $('#load').html(data);
    })
    .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
}
function reprint(id,type){ 
	$('#modal').modal('show');
      $('#load').html(''); // leave this diff blank 
      $.ajax({
        url: 'trans-modal.php',
        typr: 'GET',
        data: 'id='+id+'&type='+type+'&act=REPRINT',
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
}
$(document).ready(function() {
  App.init();
  TableManageCombine.init();
 $(document).on('click','#re-print', function(e){ 
      
    });
}); 


// $(document).ready(function()
//    {
//       $(document).on('click','#getItem', function(e)
//       {
//       	e.preventDefault();
//       	var uid = $(this).data('id'); // get id of clicked row
//       	$('#dynamic-content').html(''); // leave this diff blank 
      	
//       });

//    });
</script> 
</body>
</html>