<?php include("../includes/head.php"); ?>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade show"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #menu -->
		<?php include("../includes/menu.php") ?>
		<!-- end #menu -->

<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Form Stuff</a></li>
				<li class="breadcrumb-item active">Wizards + Validation</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Wizards + Validation <small>header small text goes here...</small></h1>
			<!-- end page-header -->
			
			<!-- begin wizard-form -->
			<form action="/" method="POST" name="form-wizard" class="form-control-with-bg">
				<!-- begin wizard -->
				<div id="wizard">
					<!-- begin wizard-step -->
					<ul>
						<li class="col-md-2 col-sm-2 col-2">
							<a href="#step-1">
								<span class="number">1</span> 
								<span class="info text-ellipsis"> Personal Detais</span>
							</a>
						</li>
						<li class="col-md-2 col-sm-2 col-2">
							<a href="#step-2">
								<span class="number">2</span> 
								<span class="info text-ellipsis">Contact Details</span>
							</a>
						</li>
						<li class="col-md-2 col-sm-2 col-2">
							<a href="#step-3">
								<span class="number">3</span>
								<span class="info text-ellipsis"> Statutory Info</span>
							</a>
						</li>
						<li class="col-md-2 col-sm-2 col-2">
							<a href="#step-4">
								<span class="number">4</span> 
								<span class="info text-ellipsis">Complete
								</span>
							</a>
						</li>
					</ul>
					<!-- end wizard-step -->
					<!-- begin wizard-content -->
					<div>
						<!-- begin step-1 -->
						<div id="step-1">
							<!-- begin fieldset -->
							<fieldset>
								<!-- begin row -->
								<div class="row">
									<!-- begin col-8 -->
									<div class="col-md-6 offset-md-2">
										<legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Personal info about yourself</legend>
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">First Name <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="text" name="firstname" placeholder="John" data-parsley-group="step-1" data-parsley-required="true" class="form-control" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Last Name <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="text" name="lastname" placeholder="Smith" data-parsley-group="step-1" data-parsley-required="true" class="form-control" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Date of Birth <span class="text-danger">&nbsp;</span></label>
											<div class="col-md-6">
												<div class="row row-space-6">
													<div class="col-4">
														<select class="form-control" name="year">
															<option>-- Year --</option>
														</select>
													</div>
													<div class="col-4">
														<select class="form-control" name="month">
															<option>-- Month --</option>
														</select>
													</div>
													<div class="col-4">
														<select class="form-control" name="day">
															<option>-- Day --</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">IC No <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="text" name="ic" placeholder="" class="form-control" data-parsley-group="step-1" data-parsley-required="true" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Address</label>
											<div class="col-md-9">
												<input type="text" name="address1" placeholder="Address 1" class="form-control m-b-10" />
												<input type="text" name="address2" placeholder="Address 2" class="form-control" />
											</div>
										</div>
										<!-- end form-group -->
									</div>
									<!-- end col-8 -->
								</div>
								<!-- end row -->
							</fieldset>
							<!-- end fieldset -->
						</div>
						<!-- end step-1 -->
						<!-- begin step-2 -->
						<div id="step-2">
							<!-- begin fieldset -->
							<fieldset>
								<!-- begin row -->
								<div class="row">
									<!-- begin col-8 -->
									<div class="col-md-4 md-offset-2">
										<legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">You contact info, so that we can easily reach you</legend>
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Phone Number <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="number" name="phone" placeholder="123-456-7890" data-parsley-group="step-2" data-parsley-required="true" data-parsley-type="number" class="form-control" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Email Address <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="email" name="email" placeholder="someone@example.com" class="form-control" data-parsley-group="step-2" data-parsley-required="true" data-parsley-type="email" />
											</div>
										</div>
										<!-- end form-group -->
									</div>
									<!-- end col-8 -->
								</div>
								<!-- end row -->
							</fieldset>
							<!-- end fieldset -->
						</div>
						<!-- end step-2 -->
						<!-- begin step-3 -->
						<div id="step-3">
							<!-- begin fieldset -->
							<fieldset>
								<!-- begin row -->
								<div class="row">
									<!-- begin col-8 -->
									<div class="col-md-8 offset-md-2">
										<legend class="no-border f-w-700 p-b-0 m-t-0 m-b-20 f-s-16 text-inverse">Select your login username and password</legend>
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Username <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="text" name="username" placeholder="johnsmithy" class="form-control" data-parsley-group="step-3" data-parsley-required="true" data-parsley-type="alphanum" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Pasword <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="password" name="password" placeholder="Your password" class="form-control" data-parsley-group="step-3" data-parsley-required="true" />
											</div>
										</div>
										<!-- end form-group -->
										<!-- begin form-group -->
										<div class="form-group row m-b-10">
											<label class="col-md-3 col-form-label text-md-right">Confirm Pasword <span class="text-danger">*</span></label>
											<div class="col-md-6">
												<input type="password" name="password2" placeholder="Confirmed password" class="form-control" data-parsley-group="step-3" data-parsley-required="true" />
											</div>
										</div>
										<!-- end form-group -->
									</div>
									<!-- end col-8 -->
								</div>
								<!-- end row -->
							</fieldset>
							<!-- end fieldset -->
						</div>
						<!-- end step-3 -->
						<!-- begin step-4 -->
						<div id="step-4">
							<div class="jumbotron m-b-0 text-center">
								<h2 class="text-inverse">Register Successfully</h2>
								<p class="m-b-30 f-s-16">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat commodo porttitor. <br />Vivamus eleifend, arcu in tincidunt semper, lorem odio molestie lacus, sed malesuada est lacus ac ligula. Aliquam bibendum felis id purus ullamcorper, quis luctus leo sollicitudin. </p>
								<p><a href="#" class="btn btn-primary btn-lg">Proceed to User Profile</a></p>
							</div>
						</div>
						<!-- end step-4 -->
					</div>
					<!-- end wizard-content -->
				</div>
				<!-- end wizard -->
			</form>
			<!-- end wizard-form -->
		</div>
		<!-- end #content -->
	
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	<?php include("../includes/foot.php") ?>