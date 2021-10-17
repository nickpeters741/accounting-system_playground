<?php 
require("../clude/head.php");
$user_id = $_SESSION['user_id'];
$folder="back/dash/"; 
thesion_page($folder);
$action="LOADED ADMIN DASHBOARD";
$url="../../";
logs($action,$url);
?>
<script type="text/javascript" src="gstatic/loader.js"></script>	
<!-- begin #page-container -->
<!-- fade page-sidebar-fixed page-header-fixed -->
<div id="page-container" class="page-container fade page-sidebar-fixed page-header-fixed gradient-enabled show has-scroll">
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
			 
			<!-- begin row -->
			<div class="row">
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-red">
						<div class="stats-icon"><i class="fa fa-desktop"></i></div>
						<div class="stats-info">
							<h4>TODAY TOTAL SALES</h4>
							<p>3,291,922</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View DetailS<i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-orange">
						<div class="stats-icon"><i class="fa fa-link"></i></div>
						<div class="stats-info">
							<h4>TOTAL ORDERS TODAY</h4>
							<p>20.44%</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View DetailS<i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-purple-darker">
						<div class="stats-icon"><i class="fa fa-users"></i></div>
						<div class="stats-info">
							<h4>PURCHASES TODAY</h4>
							<p>1,291,922</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-black-lighter">
						<div class="stats-icon"><i class="fa fa-clock"></i></div>
						<div class="stats-info">
							<h4>AVG TIME ON SITE</h4>
							<p>00:12:23</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
			</div>
			<!-- end row -->
			<!-- begin row -->
			<div class="row">
				<!-- begin col-8 -->
				<div class="col-lg-8">
					<!-- begin panel -->
					<div class="panel panel-default" data-sortable-id="index-1">
						<div class="panel-heading">
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
							<h4 class="panel-title">SALES ANALYTICS FOR THE LAST 10 DAYS</h4>
						</div>
						<div class="panel-body">
							<div id="weekly-chart" class="height-sm"></div>
						</div>
					</div>
					<!-- end panel -->
				</div>
				<!-- end col-8 -->
				<!-- begin col-4 -->
				<div class="col-lg-4">
					<!-- begin panel -->
                    <div class="panel panel-default" data-sortable-id="flot-chart-5">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">Flot Interactive Pie Chart</h4>
                        </div>
                        <div class="panel-body"> <div id="donutchart" class="height-sm"></div>
                        </div>
                    </div>
		        	<!-- end panel -->
				</div>
				<!-- end col-4 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end #content -->

		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<!--[if lt IE 9]>
		<script src="../../assets/crossbrowserjs/html5shiv.js"></script>
		<script src="../../assets/crossbrowserjs/respond.min.js"></script>
		<script src="../../assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
	<script src="../../assets/js/theme/default.min.js"></script>
	<script src="../../assets/js/apps.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="../../assets/plugins/gritter/js/jquery.gritter.js"></script> 
	<script src="../../assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <!-- <script src="../assets/plugins/nvd3/d3.min.js"></script>
    <script src="../assets/plugins/nvd3/build/nv.d3.js"></script>  -->
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script src="../../assets/js/demo/dashboard.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script type="text/javascript">
  	$(document).ready(function() {
      App.init(); 
	

    google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <?php 
          $day=today();
	          $get_items = mysqli_query($connection,"SELECT item_id, SUM(total) AS totals FROM kp_sale_items WHERE day='$day' GROUP BY item_id ORDER BY totals DESC LIMIT 10");
	            while ($row = mysqli_fetch_assoc($get_items)) {
	            $item_id = $row['item_id'];
	            $item_details = mysqli_query($connection,"SELECT name FROM kp_items WHERE item_id='$item_id'");
	            $det = mysqli_fetch_assoc($item_details);
	            $item_name = $det['name'];

	            $total = $row['totals'];
	            echo "['".$item_name."', ".$total."],";
	          }
	          ?>
        ]);

        var options = {
          //title: 'TODAY TOP 10 ITEMS',
          //pieHole: 0.3,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    
     google.charts.setOnLoadCallback(drawChart1);

      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales'],
          <?php
          $get_week_sales = mysqli_query($connection,"SELECT * FROM kp_sales GROUP BY day ORDER BY day DESC LIMIT 10") or die("Error fetching sales.:".mysqli_error($connection));
          while ($row = mysqli_fetch_assoc($get_week_sales)) {
          		$day = $row['day'];
          		$get_total_sales = mysqli_query($connection,"SELECT SUM(total_amount) AS total FROM kp_sales WHERE day='$day'") or die(mysqli_error($connection));
          		$tt = mysqli_fetch_assoc($get_total_sales);
          		$total = $tt['total'];

          		$your_date = date("d M Y", strtotime($day));

          		echo "['".$your_date."', ".$total."],";
          }
          ?>
          
        ]);

        var options = {
          //title: 'SALES ANALYTICS (Last 10 Days)',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('weekly-chart'));

        chart.draw(data, options);
      }
    });
	</script>
</body>
</html>
