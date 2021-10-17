<?php 
include("../clude/head.php"); 

$user_id = $_SESSION['user_id'];
$day=$_POST['day'];

$folder="front/reports/"; 
thesion_page($folder);
clear_thesion_ids($user_id);

$action="LOADED FRONT ADMIN DASHBOARD";
$url="../../";
logs($action,$url);

?>
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab 
{
	float: left;
	border: 1px solid #ccc; 
	background-color: #f1f1f1;
	width: 100%;
	height: auto;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: #fff;
  color: black;
  padding: 4px;
  width: 96%;
  /*border-bottom: 1px solid #ccc;*/
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 12px;
  margin: 5px
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content 
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height: 300px;
}*/
</style>
<body> 
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #menu -->
		<?php include("../clude/header.php") ?>
		<!-- end #menu -->
		<!-- begin #menu -->
		<?php include("../clude/menu.php") ?>
		<!-- end #menu -->
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin row -->
			<div class="row row-space-6">
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-blue"> 
						<div class="stats-info"> 
							<h4>TOTAL SALES</h4>
							<p><?php echo days_total("kp_sales","total_amount","day="."'".$day."'"); ?></p>	
						 </div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-black"> 
						<div class="stats-info">
							<h4>ALL BILLS</h4>
							<p><?php echo days_count("kp_sales","sale_id","day="."'".$day."'"); ?></p>
						</div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-grey-darker"> 
						<div class="stats-info">
							<h4>CREDIT PAID</h4>
							<p><?php echo days_total("kp_sale_cred_pay_hist","amount","day="."'".$day."'"); ?></p>	
						</div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-orange"> 
						<div class="stats-info">
							<h4>PURCHASES</h4>
							<p><?php echo days_total("kp_po","amount","po_date="."'".$day."'"); ?></p>
						</div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-orange"> 
						<div class="stats-info">
							<h4>RETURNS</h4>
							<p><?php echo days_total("kp_ret","ret_amount","ret_date="."'".$day."'"); ?></p>	
						</div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-2 col-md-2">
					<div class="widget widget-stats bg-purple"> 
						<div class="stats-info">
							<h4>VOIDED</h4>
							<p><?php echo "0"; ?></p>	
						</div>
						<!-- <div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div> -->
					</div>
				</div>
				<!-- end col-3 -->
				 
			</div>
			<!-- end row --> 
			<!-- begin row -->
			<div class="row row-space-6">
				<!-- begin col-4 -->
				<div class="col-lg-3 col-md-3 height-md" >
					<!-- begin panel -->
					<div class="panel">
					<div class="panel-heading"> 
							<h4 class="panel-title"><?php echo $day; ?> REPORTS</h4>
						</div>  
						<div class="tab">
							<button class="tablinks" id="print"  data-id="<?php echo $day; ?>">PRINT Z REPORT (THERMAL)<i class='fa fa-print' ></i></button>
							<button class="tablinks" id="cash" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">CASH SALES</button> 
				            <button class="tablinks" id="credit" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">CREDIT SALES</button> 
							<button class="tablinks" id="cred-pay" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">CREDIT PAYMENTS</button>
				            <button class="tablinks" id="item_sum" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">SOLD ITEMS</button>
				            <button class="tablinks" id="purc" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">PURCHASES</button>
				            <button class="tablinks" id="purc_items" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">PURCHASED ITEMS</button>
				            <button class="tablinks" id="return" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">RETURNS</button>
				            <button class="tablinks" id="return_items" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">RETURNED ITEMS</button>
				            <button class="tablinks" id="voided" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">DELETED SALES</button> 
				            <button class="tablinks" id="voided" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">REPRINTED SALES</button>  
				            <button class="tablinks" id="held" data-id="<?php echo $day; ?>"  data-id2="<?php echo $shop; ?>">HELD SALES</button>  
	            			<!-- <button class="tablinks" id="cancel">CANCELED SALES</button> -->  
						</div>  
					</div> 
					<!-- end panel -->
				</div>
				<!-- end col-4 -->
				<!-- begin col-4 -->
				<div class="col-lg-8 col-md-8">
					<!-- begin panel -->
					 <div class="panel"> 
					 	<div id="set" class="height-md" style="overflow-y:scroll; height: 100%; width: auto; background-color: #fff;"></div> 
					</div> 
					<!-- end panel -->
				</div>
				<!-- end col-4 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end #content --> 
<!-- end page container -->
<?php include("../clude/foot.php") ?>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="day_close.js"></script>  
<!-- ================== END PAGE LEVEL JS ================== -->  
</body>
</html>