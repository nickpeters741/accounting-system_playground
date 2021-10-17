<script type="text/javascript">
// 	function load_sms(){ 
//   xmlhttp=new XMLHttpRequest();
//   xmlhttp.onreadystatechange=function(){
//     if (xmlhttp.readyState==4 && xmlhttp.status==200){
//       //document.getElementById("d1").innerHTML=xmlhttp.responseText;
//     }
//   }
// xmlhttp.open("GET","../../gen/send.php",true);
// xmlhttp.send();
// }
// window.onload = load_sms;

</script>
<?php 
  include('../../inc/connection.php');  
   
    ?><!-- begin #header -->
		<div id="header" class="header navbar-default">
			<!-- begin navbar-header -->
			<div class="navbar-header">
				<a href="../dash/index.php" class="navbar-brand"><img src="../../assets/img/logo/kpos.png" style="width: 120px; height: auto;"> </a>
				<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!-- end navbar-header -->
			<div class="navbar-header">
				<img src="<?php
				$shop=get_column('kp_thesion','shop',"user_id='$user_id'");
				 echo get_column('kp_settings_gen','image_path',"id='$shop'"); ?>" style="margin-left: 400px; width: auto; height: 50px;">
			</div>
			
			<!-- begin header-nav -->
			<ul class="navbar-nav navbar-right"> 
				<li class="dropdown">
					<a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
						<i class="fa fa-bell"></i>
						<span class="label" ><?php //echo stock_out_alert()+purchase_alerts()+reorder_alerts(); ?></span>
					</a>
					<ul class="dropdown-menu media-list dropdown-menu-right"> 
						<li class="media">
							<a href="javascript:;"> 
								<div class="media-body">
									<h6 class="media-heading">Received Purchase Orders<span class="badge badge-primary pull-right"><?php //echo purchase_alerts(); ?></span></h6>
									<p>Shows all raised Purchase order not yet received.</p>

								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;"> 
								<div class="media-body">
									<h6 class="media-heading">Items Below Reorder level<span class="badge badge-warning pull-right"><?php // echo reorder_alerts(); ?></span></h6>
									<p>Shows Items that are below reorder level.</p> 
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;"> 
								<div class="media-body">
									<h6 class="media-heading">Out Of Stock<span class="badge badge-danger pull-right"><?php //echo stock_out_alert(); ?></span></h6>
									<p>Shows items that are completely out of stock.</p> 
								</div>
							</a>
						</li>
						 
					</ul>
				</li>
				<li class="dropdown navbar-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../../assets/img/user/user-13.jpg" alt="" style="margin: 0 auto;border: 3px solid #d2d6de; border-radius: 50%;" /> 
						<span class="d-none d-md-inline"><?php echo get_user($_SESSION['user_id']); ?></span> <b class="caret"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-right" style="background-color: #753f91;">
						<?php
						if ($panel==3) {
						?>
						<a href="../../back/dash/" class="dropdown-item">Backend</a> 
						<?php
						}
						?> 
						<!-- <a data-toggle="modal" data-target="#modal" data-id="<?php echo $_SESSION['user_id']; ?>" id="changepass" class="dropdown-item" >Update Password</a>  -->
					 	<div class="dropdown-divider"></div>
						<a href="../../log_out.php" class="dropdown-item">Log Out</a>
					</div>
				</li>
				<!-- <li class="dropdown navbar-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../../assets/img/user/user-12.jpg" alt="" /> 
						<span class="d-none d-md-inline"><?php echo strtoupper($_SESSION['username']); ?></span> <b class="caret"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="javascript:;" class="dropdown-item">Edit Profile</a> 
						<a data-toggle="modal" data-target="#user-modal" data-id="<?php echo $_SESSION['staff_id']; ?>" id="changepass" class="dropdown-item">Update Password</a>
						<div class="dropdown-divider"></div>
						<a href="../../log_out.php" class="dropdown-item">Log Out</a>
					</div>
				</li> -->
			</ul>
			<!-- end header navigation right -->
		</div>
		<!-- end #header -->
		