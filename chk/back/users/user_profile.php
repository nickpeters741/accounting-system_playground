<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>Color Admin | Profile Page</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="../assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
	<link href="../assets/plugins/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
	<link href="../assets/plugins/font-awesome/5.0/css/fontawesome-all.min.css" rel="stylesheet" />
	<link href="../assets/plugins/animate/animate.min.css" rel="stylesheet" />
	<link href="../assets/css/default/style.min.css" rel="stylesheet" />
	<link href="../assets/css/default/style-responsive.min.css" rel="stylesheet" />
	<link href="../assets/css/default/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
	<link href="../assets/plugins/superbox/css/superbox.min.css" rel="stylesheet" />
	<link href="../assets/plugins/lity/dist/lity.min.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="../assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade show"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->
		<div id="header" class="header navbar-default">
			<!-- begin navbar-header -->
			<div class="navbar-header">
				<a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>Color</b> Admin</a>
				<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!-- end navbar-header -->
			
			<!-- begin header-nav -->
			<ul class="navbar-nav navbar-right">
				<li>
					<form class="navbar-form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter keyword" />
							<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</li>
				<li class="dropdown">
					<a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
						<i class="fa fa-bell"></i>
						<span class="label">5</span>
					</a>
					<ul class="dropdown-menu media-list dropdown-menu-right">
						<li class="dropdown-header">NOTIFICATIONS (5)</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-bug media-object bg-silver-darker"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">Server Error Reports <i class="fa fa-exclamation-circle text-danger"></i></h6>
									<div class="text-muted f-s-11">3 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<img src="../assets/img/user/user-1.jpg" class="media-object" alt="" />
									<i class="fab fa-facebook-messenger text-primary media-object-icon"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">John Smith</h6>
									<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
									<div class="text-muted f-s-11">25 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<img src="../assets/img/user/user-2.jpg" class="media-object" alt="" />
									<i class="fab fa-facebook-messenger text-primary media-object-icon"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading">Olivia</h6>
									<p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
									<div class="text-muted f-s-11">35 minutes ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-plus media-object bg-silver-darker"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading"> New User Registered</h6>
									<div class="text-muted f-s-11">1 hour ago</div>
								</div>
							</a>
						</li>
						<li class="media">
							<a href="javascript:;">
								<div class="media-left">
									<i class="fa fa-envelope media-object bg-silver-darker"></i>
									<i class="fab fa-google text-warning media-object-icon f-s-14"></i>
								</div>
								<div class="media-body">
									<h6 class="media-heading"> New Email From John</h6>
									<div class="text-muted f-s-11">2 hour ago</div>
								</div>
							</a>
						</li>
						<li class="dropdown-footer text-center">
							<a href="javascript:;">View more</a>
						</li>
					</ul>
				</li>
				<li class="dropdown navbar-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../assets/img/user/user-13.jpg" alt="" /> 
						<span class="d-none d-md-inline">Adam Schwartz</span> <b class="caret"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="javascript:;" class="dropdown-item">Edit Profile</a>
						<a href="javascript:;" class="dropdown-item"><span class="badge badge-danger pull-right">2</span> Inbox</a>
						<a href="javascript:;" class="dropdown-item">Calendar</a>
						<a href="javascript:;" class="dropdown-item">Setting</a>
						<div class="dropdown-divider"></div>
						<a href="javascript:;" class="dropdown-item">Log Out</a>
					</div>
				</li>
			</ul>
			<!-- end header navigation right -->
		</div>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<a href="javascript:;" data-toggle="nav-profile">
							<div class="cover with-shadow"></div>
							<div class="image">
								<img src="../assets/img/user/user-13.jpg" alt="" />
							</div>
							<div class="info">
								<b class="caret pull-right"></b>
								Sean Ngu
								<small>Front end developer</small>
							</div>
						</a>
					</li>
					<li>
						<ul class="nav nav-profile">
                            <li><a href="javascript:;"><i class="fa fa-cog"></i> Settings</a></li>
                            <li><a href="javascript:;"><i class="fa fa-pencil-alt"></i> Send Feedback</a></li>
                            <li><a href="javascript:;"><i class="fa fa-question-circle"></i> Helps</a></li>
                        </ul>
					</li>
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav">
					<li class="nav-header">Navigation</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-th-large"></i>
						    <span>Dashboard</span>
					    </a>
						<ul class="sub-menu">
						    <li><a href="index.html">Dashboard v1</a></li>
						    <li><a href="index_v2.html">Dashboard v2</a></li>
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
							<span class="badge pull-right">10</span>
							<i class="fa fa-hdd"></i> 
							<span>Email</span>
						</a>
						<ul class="sub-menu">
						    <li><a href="email_inbox.html">Inbox</a></li>
						    <li><a href="email_compose.html">Compose</a></li>
						    <li><a href="email_detail.html">Detail</a></li>
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-gem"></i>
						    <span>UI Elements <span class="label label-theme m-l-5">NEW</span></span> 
						</a>
						<ul class="sub-menu">
							<li><a href="ui_general.html">General</a></li>
							<li><a href="ui_typography.html">Typography</a></li>
							<li><a href="ui_tabs_accordions.html">Tabs & Accordions</a></li>
							<li><a href="ui_unlimited_tabs.html">Unlimited Nav Tabs</a></li>
							<li><a href="ui_modal_notification.html">Modal & Notification <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
							<li><a href="ui_widget_boxes.html">Widget Boxes</a></li>
							<li><a href="ui_media_object.html">Media Object</a></li>
							<li><a href="ui_buttons.html">Buttons</a></li>
							<li><a href="ui_icons.html">Icons</a></li>
							<li><a href="ui_simple_line_icons.html">Simple Line Icons</a></li>
							<li><a href="ui_ionicons.html">Ionicons</a></li>
							<li><a href="ui_tree.html">Tree View</a></li>
							<li><a href="ui_language_bar_icon.html">Language Bar & Icon</a></li>
							<li><a href="ui_social_buttons.html">Social Buttons</a></li>
							<li><a href="ui_tour.html">Intro JS</a></li>
						</ul>
					</li>
					<li>
						<a href="bootstrap_4.html">
							<div class="icon-img">
						    	<img src="../assets/img/logo/logo-bs4.png" alt="" />
						    </div>
						    <span>Bootstrap 4 <span class="label label-theme m-l-5">NEW</span></span> 
						</a>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-list-ol"></i>
						    <span>Form Stuff <span class="label label-theme m-l-5">NEW</span></span> 
						</a>
						<ul class="sub-menu">
							<li><a href="form_elements.html">Form Elements <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
							<li><a href="form_plugins.html">Form Plugins <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
							<li><a href="form_slider_switcher.html">Form Slider + Switcher</a></li>
							<li><a href="form_validation.html">Form Validation</a></li>
							<li><a href="form_wizards.html">Wizards</a></li>
							<li><a href="form_wizards_validation.html">Wizards + Validation</a></li>
							<li><a href="form_wysiwyg.html">WYSIWYG</a></li>
							<li><a href="form_editable.html">X-Editable</a></li>
							<li><a href="form_multiple_upload.html">Multiple File Upload</a></li>
							<li><a href="form_summernote.html">Summernote</a></li>
							<li><a href="form_dropzone.html">Dropzone</a></li>
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-table"></i>
						    <span>Tables</span>
						</a>
						<ul class="sub-menu">
							<li><a href="table_basic.html">Basic Tables</a></li>
							<li class="has-sub">
							    <a href="javascript:;"><b class="caret pull-right"></b> Managed Tables</a>
							    <ul class="sub-menu">
							        <li><a href="table_manage.html">Default</a></li>
							        <li><a href="table_manage_autofill.html">Autofill</a></li>
							        <li><a href="table_manage_buttons.html">Buttons</a></li>
							        <li><a href="table_manage_colreorder.html">ColReorder</a></li>
							        <li><a href="table_manage_fixed_columns.html">Fixed Column</a></li>
							        <li><a href="table_manage_fixed_header.html">Fixed Header</a></li>
							        <li><a href="table_manage_keytable.html">KeyTable</a></li>
							        <li><a href="table_manage_responsive.html">Responsive</a></li>
							        <li><a href="table_manage_rowreorder.html">RowReorder</a></li>
							        <li><a href="table_manage_scroller.html">Scroller</a></li>
							        <li><a href="table_manage_select.html">Select</a></li>
							        <li><a href="table_manage_combine.html">Extension Combination</a></li>
							    </ul>
							</li>
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
							<i class="fa fa-star"></i> 
							<span>Front End</span>
						</a>
						<ul class="sub-menu">
						    <li><a href="../../../frontend/template/template_one_page_parallax/index.html" target="_blank">One Page Parallax</a></li>
						    <li><a href="../../../frontend/template/template_blog/index.html" target="_blank">Blog</a></li>
						    <li><a href="../../../frontend/template/template_forum/index.html" target="_blank">Forum</a></li>
						    <li><a href="../../../frontend/template/template_e_commerce/index.html" target="_blank">E-Commerce</a></li>
						</ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-envelope"></i>
					        <span>Email Template</span>
					    </a>
						<ul class="sub-menu">
							<li><a href="email_system.html">System Template</a></li>
							<li><a href="email_newsletter.html">Newsletter Template</a></li>
						</ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-chart-pie"></i>
						    <span>Chart</span>
						</a>
						<ul class="sub-menu">
						    <li><a href="chart-flot.html">Flot Chart</a></li>
						    <li><a href="chart-morris.html">Morris Chart</a></li>
							<li><a href="chart-js.html">Chart JS</a></li>
						    <li><a href="chart-d3.html">d3 Chart</a></li>
						</ul>
					</li>
					<li><a href="calendar.html"><i class="fa fa-calendar"></i> <span>Calendar</span></a></li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-map"></i>
					        <span>Map</span>
					    </a>
						<ul class="sub-menu">
							<li><a href="map_vector.html">Vector Map</a></li>
							<li><a href="map_google.html">Google Map</a></li>
						</ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-image"></i>
						    <span>Gallery</span>
						</a>
					    <ul class="sub-menu">
					        <li><a href="gallery.html">Gallery v1</a></li>
					        <li><a href="gallery_v2.html">Gallery v2</a></li>
					    </ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-cogs"></i>
						    <span>Page Options</span>
						</a>
						<ul class="sub-menu">
							<li><a href="page_blank.html">Blank Page</a></li>
							<li><a href="page_with_footer.html">Page with Footer</a></li>
							<li><a href="page_without_sidebar.html">Page without Sidebar</a></li>
							<li><a href="page_with_right_sidebar.html">Page with Right Sidebar</a></li>
							<li><a href="page_with_minified_sidebar.html">Page with Minified Sidebar</a></li>
							<li><a href="page_with_two_sidebar.html">Page with Two Sidebar</a></li>
							<li><a href="page_with_line_icons.html">Page with Line Icons</a></li>
							<li><a href="page_with_ionicons.html">Page with Ionicons</a></li>
							<li><a href="page_full_height.html">Full Height Content</a></li>
							<li><a href="page_with_wide_sidebar.html">Page with Wide Sidebar</a></li>
							<li><a href="page_with_light_sidebar.html">Page with Light Sidebar</a></li>
							<li><a href="page_with_mega_menu.html">Page with Mega Menu</a></li>
                            <li><a href="page_with_top_menu.html">Page with Top Menu</a></li>
                            <li><a href="page_with_boxed_layout.html">Page with Boxed Layout</a></li>
                            <li><a href="page_with_mixed_menu.html">Page with Mixed Menu</a></li>
                            <li><a href="page_boxed_layout_with_mixed_menu.html">Boxed Layout with Mixed Menu</a></li>
                            <li><a href="page_with_transparent_sidebar.html">Page with Transparent Sidebar</a></li>
						</ul>
					</li>
					<li class="has-sub active">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-gift"></i>
						    <span>Extra</span>
						</a>
						<ul class="sub-menu">
						    <li><a href="extra_timeline.html">Timeline</a></li>
						    <li><a href="extra_coming_soon.html">Coming Soon Page</a></li>
							<li><a href="extra_search_results.html">Search Results</a></li>
							<li><a href="extra_invoice.html">Invoice</a></li>
							<li><a href="extra_404_error.html">404 Error Page</a></li>
							<li class="active"><a href="extra_profile.html">Profile Page</a></li>
						</ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-key"></i>
					        <span>Login & Register</span>
					    </a>
					    <ul class="sub-menu">
							<li><a href="login.html">Login</a></li>
					        <li><a href="login_v2.html">Login v2</a></li>
					        <li><a href="login_v3.html">Login v3</a></li>
					        <li><a href="register_v3.html">Register v3</a></li>
					    </ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-cubes"></i>
					        <span>Version <span class="label label-theme m-l-5">NEW</span></span>
					    </a>
					    <ul class="sub-menu">
							<li><a href="javascript:;">HTML</a></li>
					        <li><a href="../template_ajax/index.html">AJAX</a></li>
					        <li><a href="../template_angularjs/index.html">ANGULAR JS</a></li>
					        <li><a href="../template_angularjs5/index.html">ANGULAR JS 5 <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
					        <li><a href="../template_laravel/index.html">LARAVEL <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
					        <li><a href="../template_material/index.html">MATERIAL DESIGN</a></li>
					        <li><a href="../template_apple/index.html">APPLE DESIGN</a></li>
					        <li><a href="../template_transparent/index.html">TRANSPARENT DESIGN <i class="fa fa-paper-plane text-theme m-l-5"></i></a></li>
					    </ul>
					</li>
					<li class="has-sub">
					    <a href="javascript:;">
					        <b class="caret"></b>
					        <i class="fa fa-medkit"></i>
					        <span>Helper</span>
					    </a>
					    <ul class="sub-menu">
							<li><a href="helper_css.html">Predefined CSS Classes</a></li>
					    </ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-align-left"></i> 
						    <span>Menu Level</span>
						</a>
						<ul class="sub-menu">
							<li class="has-sub">
								<a href="javascript:;">
					        		<b class="caret"></b>
						            Menu 1.1
						        </a>
								<ul class="sub-menu">
									<li class="has-sub">
										<a href="javascript:;">
										    <b class="caret"></b>
										    Menu 2.1
										</a>
										<ul class="sub-menu">
											<li><a href="javascript:;">Menu 3.1</a></li>
											<li><a href="javascript:;">Menu 3.2</a></li>
										</ul>
									</li>
									<li><a href="javascript:;">Menu 2.2</a></li>
									<li><a href="javascript:;">Menu 2.3</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">Menu 1.2</a></li>
							<li><a href="javascript:;">Menu 1.3</a></li>
						</ul>
					</li>
			        <!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
			        <!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content content-full-width">
			<!-- begin profile -->
			<div class="profile">
				<div class="profile-header">
					<!-- BEGIN profile-header-cover -->
					<div class="profile-header-cover"></div>
					<!-- END profile-header-cover -->
					<!-- BEGIN profile-header-content -->
					<div class="profile-header-content">
						<!-- BEGIN profile-header-img -->
						<div class="profile-header-img">
							<img src="../assets/img/user/user-13.jpg" alt="">
						</div>
						<!-- END profile-header-img -->
						<!-- BEGIN profile-header-info -->
						<div class="profile-header-info">
							<h4 class="m-t-10 m-b-5">Sean Ngu</h4>
							<p class="m-b-10">UXUI + Frontend Developer</p>
							<a href="#" class="btn btn-xs btn-yellow">Edit Profile</a>
						</div>
						<!-- END profile-header-info -->
					</div>
					<!-- END profile-header-content -->
					<!-- BEGIN profile-header-tab -->
					<ul class="profile-header-tab nav nav-tabs">
						<li class="nav-item"><a href="#profile-post" class="nav-link active" data-toggle="tab">POSTS</a></li>
						<li class="nav-item"><a href="#profile-about" class="nav-link" data-toggle="tab">ABOUT</a></li>
						<li class="nav-item"><a href="#profile-photos" class="nav-link" data-toggle="tab">PHOTOS</a></li>
						<li class="nav-item"><a href="#profile-videos" class="nav-link" data-toggle="tab">VIDEOS</a></li>
						<li class="nav-item"><a href="#profile-friends" class="nav-link" data-toggle="tab">FRIENDS</a></li>
					</ul>
					<!-- END profile-header-tab -->
				</div>
			</div>
			<!-- end profile -->
			<!-- begin profile-content -->
            <div class="profile-content">
            	<!-- begin tab-content -->
            	<div class="tab-content p-0">
            		<!-- begin #profile-post tab -->
            		<div class="tab-pane fade show active" id="profile-post">
						<!-- begin timeline -->
						<ul class="timeline">
							<li>
								<!-- begin timeline-time -->
								<div class="timeline-time">
									<span class="date">today</span>
									<span class="time">04:20</span>
								</div>
								<!-- end timeline-time -->
								<!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div>
								<!-- end timeline-icon -->
								<!-- begin timeline-body -->
								<div class="timeline-body">
									<div class="timeline-header">
										<span class="userimage"><img src="../assets/img/user/user-12.jpg" alt="" /></span>
										<span class="username"><a href="javascript:;">Sean Ngu</a> <small></small></span>
										<span class="pull-right text-muted">18 Views</span>
									</div>
									<div class="timeline-content">
										<p>
											Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus turpis quis tincidunt luctus.
											Nam sagittis dui in nunc consequat, in imperdiet nunc sagittis.
										</p>
									</div>
									<div class="timeline-likes">
										<div class="stats-right">
											<span class="stats-text">259 Shares</span>
											<span class="stats-text">21 Comments</span>
										</div> 
										<div class="stats">
											<span class="fa-stack fa-fw stats-icon">
											  <i class="fa fa-circle fa-stack-2x text-danger"></i>
											  <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
											</span>
											<span class="fa-stack fa-fw stats-icon">
											  <i class="fa fa-circle fa-stack-2x text-primary"></i>
											  <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
											</span>
											<span class="stats-total">4.3k</span>
										</div>
									</div>
									<div class="timeline-footer">
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
									</div>
									<div class="timeline-comment-box">
										<div class="user"><img src="../assets/img/user/user-12.jpg" /></div>
										<div class="input">
											<form action="">
												<div class="input-group">
													<input type="text" class="form-control rounded-corner" placeholder="Write a comment..." />
													<span class="input-group-btn p-l-10">
														<button class="btn btn-primary f-s-12 rounded-corner" type="button">Comment</button>
													</span>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- end timeline-body -->
							</li>
							<li>
								<!-- begin timeline-time -->
								<div class="timeline-time">
									<span class="date">yesterday</span>
									<span class="time">20:17</span>
								</div>
								<!-- end timeline-time -->
								<!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div>
								<!-- end timeline-icon -->
								<!-- begin timeline-body -->
								<div class="timeline-body">
									<div class="timeline-header">
										<span class="userimage"><img src="../assets/img/user/user-12.jpg" alt="" /></span>
										<span class="username">Sean Ngu</span>
										<span class="pull-right text-muted">82 Views</span>
									</div>
									<div class="timeline-content">
										<p>Location: United States</p>
										<div id="google-map" class="height-sm m-b-10"></div>
									</div>
									<div class="timeline-footer">
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
									</div>
								</div>
								<!-- end timeline-body -->
							</li>
							<li>
								<!-- begin timeline-time -->
								<div class="timeline-time">
									<span class="date">24 February 2014</span>
									<span class="time">08:17</span>
								</div>
								<!-- end timeline-time -->
								<!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div>
								<!-- end timeline-icon -->
								<!-- begin timeline-body -->
								<div class="timeline-body">
									<div class="timeline-header">
										<span class="userimage"><img src="../assets/img/user/user-12.jpg" alt="" /></span>
										<span class="username">Sean Ngu</span>
										<span class="pull-right text-muted">1,282 Views</span>
									</div>
									<div class="timeline-content">
										<p class="lead">
											<i class="fa fa-quote-left fa-fw pull-left"></i>
											Quisque sed varius nisl. Nulla facilisi. Phasellus consequat sapien sit amet nibh molestie placerat. Donec nulla quam, ullamcorper ut velit vitae, lobortis condimentum magna. Suspendisse mollis in sem vel mollis.
											<i class="fa fa-quote-right fa-fw pull-right"></i>
										</p>
									</div>
									<div class="timeline-footer">
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
									</div>
								</div>
								<!-- end timeline-body -->
							</li>
							<li>
								<!-- begin timeline-time -->
								<div class="timeline-time">
									<span class="date">10 January 2014</span>
									<span class="time">20:43</span>
								</div>
								<!-- end timeline-time -->
								<!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div>
								<!-- end timeline-icon -->
								<!-- begin timeline-body -->
								<div class="timeline-body">
									<div class="timeline-header">
										<span class="userimage"><img src="../assets/img/user/user-12.jpg" alt="" /></span>
										<span class="username">Sean Ngu</span>
										<span class="pull-right text-muted">1,021,282 Views</span>
									</div>
									<div class="timeline-content">
										<h4 class="template-title">
											<i class="fa fa-map-marker-alt text-danger fa-fw"></i>
											795 Folsom Ave, Suite 600 San Francisco, CA 94107
										</h4>
										<p>In hac habitasse platea dictumst. Pellentesque bibendum id sem nec faucibus. Maecenas molestie, augue vel accumsan rutrum, massa mi rutrum odio, id luctus mauris nibh ut leo.</p>
										<p class="m-t-20">
											<img src="../assets/img/gallery/gallery-5.jpg" alt="" />
										</p>
									</div>
									<div class="timeline-footer">
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
									</div>
								</div>
								<!-- end timeline-body -->
							</li>
							<li>
								<!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div>
								<!-- end timeline-icon -->
								<!-- begin timeline-body -->
								<div class="timeline-body">
									Loading...
								</div>
								<!-- begin timeline-body -->
							</li>
						</ul>
						<!-- end timeline -->
            		</div>
            		<!-- end #profile-post tab -->
            		<!-- begin #profile-about tab -->
            		<div class="tab-pane fade in" id="profile-about">
						<!-- begin table -->
						<div class="table-responsive">
							<table class="table table-profile">
								<thead>
									<tr>
										<th></th>
										<th>
											<h4>Micheal	Meyer <small>Lorraine Stokes</small></h4>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr class="highlight">
										<td class="field">Mood</td>
										<td><a href="javascript:;">Add Mood Message</a></td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr>
										<td class="field">Mobile</td>
										<td><i class="fa fa-mobile fa-lg m-r-5"></i> +1-(847)- 367-8924 <a href="javascript:;" class="m-l-5">Edit</a></td>
									</tr>
									<tr>
										<td class="field">Home</td>
										<td><a href="javascript:;">Add Number</a></td>
									</tr>
									<tr>
										<td class="field">Office</td>
										<td><a href="javascript:;">Add Number</a></td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr class="highlight">
										<td class="field">About Me</td>
										<td><a href="javascript:;">Add Description</a></td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr>
										<td class="field">Country/Region</td>
										<td>
											<select class="form-control input-inline input-xs" name="region">
												<option value="US" selected>United State</option>
												<option value="AF">Afghanistan</option>
												<option value="AL">Albania</option>
												<option value="DZ">Algeria</option>
												<option value="AS">American Samoa</option>
												<option value="AD">Andorra</option>
												<option value="AO">Angola</option>
												<option value="AI">Anguilla</option>
												<option value="AQ">Antarctica</option>
												<option value="AG">Antigua and Barbuda</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="field">City</td>
										<td>Los Angeles</td>
									</tr>
									<tr>
										<td class="field">State</td>
										<td><a href="javascript:;">Add State</a></td>
									</tr>
									<tr>
										<td class="field">Website</td>
										<td><a href="javascript:;">Add Webpage</a></td>
									</tr>
									<tr>
										<td class="field">Gender</td>
										<td>
											<select class="form-control input-inline input-xs" name="gender">
												<option value="male">Male</option>
												<option value="female">Female</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="field">Birthdate</td>
										<td>
											<select class="form-control input-inline input-xs" name="day">
												<option value="04" selected>04</option>
											</select>
											-
											<select class="form-control input-inline input-xs" name="month">
												<option value="11" selected>11</option>
											</select>
											-
											<select class="form-control input-inline input-xs" name="year">
												<option value="1989" selected>1989</option>
											</select>
										</td>
									</tr>
									<tr>
										<td class="field">Language</td>
										<td>
											<select class="form-control input-inline input-xs" name="language">
												<option value="" selected>English</option>
											</select>
										</td>
									</tr>
									<tr class="divider">
										<td colspan="2"></td>
									</tr>
									<tr class="highlight">
										<td class="field">&nbsp;</td>
										<td class="p-t-10 p-b-10">
											<button type="submit" class="btn btn-primary width-150">Update</button>
											<button type="submit" class="btn btn-white btn-white-without-border width-150 m-l-5">Cancel</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- end table -->
					</div>
            		<!-- end #profile-about tab -->
            		<!-- begin #profile-photos tab -->
            		<div class="tab-pane fade in" id="profile-photos">
            			<h4 class="m-t-0 m-b-20">Photos (70)</h4>
						<!-- begin superbox -->
						<div class="superbox " data-offset="50">
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-1.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-1-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-2.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-2-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-3.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-3-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-4.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-4-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-5.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-5-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-6.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-6-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-7.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-7-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-8.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-8-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-9.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-9-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-10.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-10-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-11.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-11-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-12.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-12-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-13.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-13-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-14.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-14-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-15.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-15-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-16.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-16-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-17.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-17-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-18.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-18-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-19.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-19-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-20.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-20-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-21.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-21-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-22.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-22-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-23.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-23-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-24.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-24-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-25.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-25-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-26.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-26-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-27.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-27-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-28.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-28-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-29.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-29-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-30.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-30-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-31.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-31-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-32.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-32-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-33.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-33-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-34.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-34-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-35.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-35-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-36.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-36-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-37.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-37-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-38.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-38-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-39.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-39-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-40.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-40-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-41.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-41-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-42.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-42-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-43.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-43-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-44.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-44-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-45.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-45-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-46.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-46-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-47.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-47-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-48.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-48-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-49.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-49-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-50.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-50-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-51.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-51-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-52.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-52-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-53.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-53-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-54.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-54-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-55.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-55-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-56.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-56-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-57.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-57-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-58.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-58-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-59.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-59-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-60.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-60-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-61.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-61-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-62.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-62-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-63.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-63-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-64.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-64-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-65.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-65-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-66.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-66-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-67.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-67-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-68.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-68-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-69.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-69-thumb.jpg);"></span>
								</a>
							</div>
							<div class="superbox-list">
								<a href="javascript:;" class="superbox-img">
									<img data-img="../assets/img/gallery/gallery-70.jpg" />
									<span style="background: url(../assets/img/gallery/gallery-70-thumb.jpg);"></span>
								</a>
							</div>
						</div>
						<!-- end superbox -->
            		</div>
            		<!-- end #profile-photos tab -->
            		<!-- begin #profile-videos tab -->
            		<div class="tab-pane fade in" id="profile-videos">
            			<h4 class="m-t-0 m-b-20">Videos (16)</h4>
            			<!-- begin row -->
            			<div class="row row-space-2">
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=RQ5ljyGg-ig" data-lity>
            						<img src="https://img.youtube.com/vi/RQ5ljyGg-ig/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=5lWkZ-JaEOc" data-lity>
            						<img src="https://img.youtube.com/vi/5lWkZ-JaEOc/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=9ZfN87gSjvI" data-lity>
            						<img src="https://img.youtube.com/vi/9ZfN87gSjvI/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=w2H07DRv2_M" data-lity>
            						<img src="https://img.youtube.com/vi/w2H07DRv2_M/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=PntG8KEVjR8" data-lity>
            						<img src="https://img.youtube.com/vi/PntG8KEVjR8/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=q8kxKvSQ7MI" data-lity>
            						<img src="https://img.youtube.com/vi/q8kxKvSQ7MI/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=cutu3Bw4ep4" data-lity>
            						<img src="https://img.youtube.com/vi/cutu3Bw4ep4/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=gCspUXGrraM" data-lity>
            						<img src="https://img.youtube.com/vi/gCspUXGrraM/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=COtpTM1MpAA" data-lity>
            						<img src="https://img.youtube.com/vi/COtpTM1MpAA/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=8NVkGHVOazc" data-lity>
            						<img src="https://img.youtube.com/vi/8NVkGHVOazc/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=QgQ7MWLsw1w" data-lity>
            						<img src="https://img.youtube.com/vi/QgQ7MWLsw1w/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=Dmw0ucCv8aQ" data-lity>
            						<img src="https://img.youtube.com/vi/Dmw0ucCv8aQ/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=r1d7ST2TG2U" data-lity>
            						<img src="https://img.youtube.com/vi/r1d7ST2TG2U/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=WUR-XWBcHvs" data-lity>
            						<img src="https://img.youtube.com/vi/WUR-XWBcHvs/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=A7sQ8RWj0Cw" data-lity>
            						<img src="https://img.youtube.com/vi/A7sQ8RWj0Cw/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            				<!-- begin col-3 -->
            				<div class="col-md-3 col-sm-4 m-b-2">
            					<a href="https://www.youtube.com/watch?v=IMN2VfiXls4" data-lity>
            						<img src="https://img.youtube.com/vi/IMN2VfiXls4/mqdefault.jpg" class="width-full" />
            					</a>
            				</div>
            				<!-- end col-3 -->
            			</div>
            			<!-- end row -->
            		</div>
            		<!-- end #profile-videos tab -->
            		<!-- begin #profile-friends tab -->
            		<div class="tab-pane fade in" id="profile-friends">
            			<h4 class="m-t-0 m-b-20">Friend List (14)</h4>
            			<!-- begin row -->
            			<div class="row row-space-2">
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-1.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">James Pittman</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-2.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Mitchell Ashcroft</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-3.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Ella Cabena</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-4.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Declan Dyson</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-5.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">George Seyler</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-6.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Patrick Musgrove</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-7.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Taj Connal</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-8.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Laura Pollock</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-9.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Dakota Mannix</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-10.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Timothy Woolley</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-11.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Benjamin Congreve</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-12.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Mariam Maddock</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-13.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Blake Gerrald</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<!-- end col-6 -->
            				<!-- begin col-6 -->
            				<div class="col-md-6 m-b-2">
            					<div class="p-10 bg-white">
									<div class="media media-xs overflow-visible">
										<a class="media-left" href="javascript:;">
											<img src="../assets/img/user/user-14.jpg" alt="" class="media-object img-circle" />
										</a>
										<div class="media-body valign-middle">
											<b class="text-inverse">Gabrielle Bunton</b>
										</div>
										<div class="media-body valign-middle text-right overflow-visible">
											<div class="btn-group dropdown">
												<a href="javascript:;" class="btn btn-default">Friends</a>
												<a href="javascript:;" data-toggle="dropdown" class="btn btn-default dropdown-toggle"></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="javascript:;">Action 1</a></li>
													<li><a href="javascript:;">Action 2</a></li>
													<li><a href="javascript:;">Action 3</a></li>
													<li class="divider"></li>
													<li><a href="javascript:;">Action 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
            				</div>
            				<!-- end col-6 -->
            			</div>
            			<!-- end row -->
            		</div>
            		<!-- end #profile-friends tab -->
				</div>
            	<!-- end tab-content -->
            </div>
			<!-- end profile-content -->
		</div>
		<!-- end #content -->
		
        <!-- begin theme-panel -->
        <div class="theme-panel">
            <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
            <div class="theme-panel-content">
                <h5 class="m-t-0">Color Theme</h5>
                <ul class="theme-list clearfix">
                    <li class="active"><a href="javascript:;" class="bg-green" data-theme="default" data-theme-file="../assets/css/default/theme/default.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Default">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-red" data-theme="red" data-theme-file="../assets/css/default/theme/red.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Red">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-theme-file="../assets/css/default/theme/blue.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Blue">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-theme-file="../assets/css/default/theme/purple.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Purple">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-theme-file="../assets/css/default/theme/orange.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Orange">&nbsp;</a></li>
                    <li><a href="javascript:;" class="bg-black" data-theme="black" data-theme-file="../assets/css/default/theme/black.css" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Black">&nbsp;</a></li>
                </ul>
                <div class="divider"></div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Header Styling</div>
                    <div class="col-md-7">
                        <select name="header-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">inverse</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label">Header</div>
                    <div class="col-md-7">
                        <select name="header-fixed" class="form-control form-control-sm">
                            <option value="1">fixed</option>
                            <option value="2">default</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Sidebar Styling</div>
                    <div class="col-md-7">
                        <select name="sidebar-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">grid</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label">Sidebar</div>
                    <div class="col-md-7">
                        <select name="sidebar-fixed" class="form-control form-control-sm">
                            <option value="1">fixed</option>
                            <option value="2">default</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Sidebar Gradient</div>
                    <div class="col-md-7">
                        <select name="content-gradient" class="form-control form-control-sm">
                            <option value="1">disabled</option>
                            <option value="2">enabled</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-5 control-label double-line">Content Styling</div>
                    <div class="col-md-7">
                        <select name="content-styling" class="form-control form-control-sm">
                            <option value="1">default</option>
                            <option value="2">black</option>
                        </select>
                    </div>
                </div>
                <div class="row m-t-10">
                    <div class="col-md-12">
                        <a href="javascript:;" class="btn btn-inverse btn-block btn-sm" data-click="reset-local-storage">Reset Local Storage</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end theme-panel -->
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script src="../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<!--[if lt IE 9]>
		<script src="../assets/crossbrowserjs/html5shiv.js"></script>
		<script src="../assets/crossbrowserjs/respond.min.js"></script>
		<script src="../assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
	<script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/plugins/js-cookie/js.cookie.js"></script>
	<script src="../assets/js/theme/default.min.js"></script>
	<script src="../assets/js/apps.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script src="../assets/plugins/superbox/js/jquery.superbox.min.js"></script>
	<script src="../assets/plugins/lity/dist/lity.min.js"></script>
	<script src="../assets/js/demo/profile.demo.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			Profile.init();
		});
	</script>
</body>
</html>
