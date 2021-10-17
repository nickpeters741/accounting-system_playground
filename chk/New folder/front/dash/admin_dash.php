<?php 
include("../clude/head.php"); 
$user_id = $_SESSION['user_id'];
$folder="front/dash/"; 
thesion_page($folder);
clear_thesion_ids($user_id);
$action="LOADED FRONT ADMIN DASHBOARD";
$url="../../";
logs($action,$url);
?>
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
			<div class="row">
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-red">
						<div class="stats-icon"><i class="fa fa-desktop"></i></div>
						<div class="stats-info">
							<h4>MY TODAY SALES</h4>
							<p>0</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-orange">
						<div class="stats-icon"><i class="fa fa-link"></i></div>
						<div class="stats-info">
							<h4>MONTHS TARGET</h4>
							<p>0%</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-3 col-md-6">
					<div class="widget widget-stats bg-grey-darker">
						<div class="stats-icon"><i class="fa fa-users"></i></div>
						<div class="stats-info">
							<h4>MONTHS TARGET</h4>
							<p>0</p>	
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
							<h4>TOTALTRANSACTIONS</h4>
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
					<div class="panel panel-inverse" data-sortable-id="index-1">
						<div class="panel-heading">
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
							<h4 class="panel-title">Website Analytics (Last 7 Days)</h4>
						</div>
						<div class="panel-body">
							<div id="interactive-chart" class="height-sm"></div>
						</div>
					</div>
					<!-- end panel -->
				</div>
				<!-- end col-8 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end #content --> 
<!-- end page container -->

<?php include("../clude/foot.php") ?>
 <script type="text/javascript">
 	$(document).ready(function() {
  	$(document).keydown(function(e) {
			var code = (e.keyCode ? e.keyCode : e.which);
      if(code==13) {
      	window.location.href='../ord/init_sale.php?key=00'; 
      } else if(code==113) {
				//113 is code for F2 
				$("#modal").modal('show');
				$.ajax({
	        url: '../gen/lookup.php',
	        type: 'POST',
	        data: '',
	        dataType: 'html'
      	})
      	.done(function(data){ 
	        $('#load').html('');
	        $('#load').html(data);
      	})
      	.fail(function(){
	        $('#load').html('');
	        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      	});
    	}
  	});
	});
 </script>
<script src="../scripts/gen.js"></script>
<script src="../scripts/select_sale.js"></script>
</body>
</html>