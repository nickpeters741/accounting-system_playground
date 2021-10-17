<?php
session_start(); 
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');  
$url = "../../assets";

if (isset($_GET['day'])) {
  	$today=$_GET['day'];
}else{
	date_default_timezone_set("Africa/Nairobi");
	$today=date("Y-m-d");
} 

$action="PRINTED|-|-|-|CLOSE OF DAY ".$today;
logs($action,"../../");
backup_tables('../../');
?>
<html>
	<head>
		<title><?php echo $today; ?>  Z REPORT</title>
		<link href="<?php echo $url; ?>/css/zreport.css" rel="stylesheet" />   
		<script type="text/javascript">
			function close(){
				window.location = '../front/dash/admin_dash.php';
			} 
		</script>
	</head>
	<body>
		<table style="width: 98%;">
		  	<thead>
			    <tr>
			      	<td>
			        	<div class="header-space"> </div>
			      	</td>
			    </tr>
		  	</thead>
		  	<tbody>
			    <tr>
			      	<td>
			        	<div class="content"> 
			        		<?php
														////START CASH SALES/////
														include('day_sum.php');
														//////END CASH SALES /////
														////START CASH SALES/////
														include('cash_sales.php');
														//////END CASH SALES /////
														//////START CREDIT SALES /////
														include('credit_sales.php');  
														//////END CREDIT SALES/////
														//////START CREDIT PAYMENTS /////
														include('credit_payment.php');  
														//////END CREDIT PAYMENTS/////
														//////START PURCHASES/////
														include('purchases.php');  
														//////END  PURCHASES////
														//////START PURCHASES/////
														include('requisitions.php');  
														//////END  PURCHASES////
														//////START PURCHASES/////
														include('returns.php');  
														//////END  PURCHASES////
													?>
			        	</div>
			        </td>
			    </tr>
			</tbody>  
			<tfoot>
				<tr>
					<td> 
						<div class="footer-space" style="width: 98%;">&nbsp; </div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="header" style="width: 98%;"> 
  <div style=" border-right: green; width: 60%; float: center; ">
  <h2 style=" text-align: right; margin-bottom: 0px; margin-right: 7px;"><u><?php echo $today; ?> CLOSE OF DAY REPORT</u> </h2> 
          </div>  
 
   
</div>
<div class="footer" style="width:98%;">
  </BR>
  <p class="pull-right"> 
    <span class="m-r-10"> PRINTED...........................................................</span>
    <span class="m-r-10"> CASHIER...........................................................</span>
    <span class="m-r-10"> SUPERVISOR.......................................................</span></BR></BR>
    <span class="m-r-10"> REMARKS............................................................................................</span>
  </p>
</div>
	</body>
</html>