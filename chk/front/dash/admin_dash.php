<?php 
include("../clude/head.php"); 
$user_id = $_SESSION['user_id'];
$day=$_POST['day'];
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
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-6 col-md-6">
					<div class="widget widget-stats bg-grey-darker">
						<div class="stats-icon"><i class="fa fa-users"></i></div>
						<div class="stats-info">
							<h4>TODAY'S SALES</h4>
							<p>0</p>	
						</div>
						<div class="stats-link">
							<a href="javascript:;">View Detail <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-lg-6 col-md-6">
					<div class="widget widget-stats bg-black-lighter">
						<div class="stats-icon"><i class="fa fa-clock"></i></div>
						<div class="stats-info">
							<h4>MONTHLY SALES</h4>
							<p><?php echo days_count("kp_sales","sale_id","day="."'".$day."'"); ?></p>	
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