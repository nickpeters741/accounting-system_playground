<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar sidebar-transparent">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				 
				<!-- begin sidebar nav -->
				<ul class="nav">
					<li class="nav-header">NAVIGATION</li>
					<li>
						<a href="../dash/<?php echo $_SESSION['dash']; ?>">
							<i class="fa fa-th-large"></i>
						    <span>DASHBOARD</span> 
						</a>
					</li> 
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>STAFF MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../staff/staff.php">Active Staff List</a></li>
							<li><a href="../staff/arch_staff.php">Archived Staff List</a></li>
						</ul>
					</li> 
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>USER MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../users/user.php">Active User List</a></li>
							<li><a href="../users/sus_users.php">Suspended User List</a></li>
							<li><a href="../users/arch_users.php">Archived User List</a></li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>User Roles</a>
								<ul class="sub-menu">
									<li><a href="../roles/roles.php">User Roles List</a></li> 
								</ul>
							</li>
							<li><a href="back/staff/staff.php">User Permissions</a></li> 
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>INVENTORY MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../prods/prods.php">Active Product List</a></li>
							<li><a href="../prods/arch_prods.php">Archived Product List</a></li>
							<li><a href="../cat/cat.php">Product Categories</a></li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Inventory</a>
								<ul class="sub-menu">
									<li><a href="../inventory/stock.php">Stock Adjustments</a></li> 
									<!-- <li><a href="#">Price Adjustments</a></li>  -->
								</ul>
							</li> 
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>STORE MANAGER</span> 
						</a>
						<ul class="sub-menu"> 
							<li><a href="../thitoo/stores.php">Stores</a></li>
							<li><a href="../thitoo/assign_store.php">Assign Store Items</a></li>
							<li><a href="../thitoo/dispatch_stock.php">Dispatch Stock</a></li>
							<!-- <li class="has-sub"><a href="javascript:;"><b class="caret"></b>Stores</a>
								<ul class="sub-menu"> 
									<li><a href="../thitoo/stores.php">Store list</a></li> 
									<li><a href="../sections/select_store.php">Store Section</a></li> 
								</ul>
							</li> -->
							<li><a data-toggle="modal" data-target="#modal" id="store-stock" onclick="store(1);">Stores Stock</a></li>
							<!--<li><a data-toggle="modal" data-target="#modal" id="store-stock" onclick="store(2);">Stores Stock Take</a></li>
							 <li class="has-sub"><a href="javascript:;"><b class="caret"></b>Breakages</a>
								<ul class="sub-menu"> 
									<li><a href="#">Record Breakage</a></li> 
									<li><a href="#">List Breakages</a></li> 
								</ul>
							</li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Requistion</a>
								<ul class="sub-menu"> 
									<li><a href="back/thitoo/init_req.php?st=1">On Demand</a></li> 
									<li><a href="back/thitoo/init_req.php?st=2">Auto Requisition</a></li> 
								</ul>
							</li> -->
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>PURCHASE MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a data-toggle="modal" data-target="#modal" id="new-po" onclick="po();">Raise PO</a></li>
							<li><a href="../kugura/po_pending.php">Receive PO</a></li>
							<li><a href="../kugura/po_list.php">Purchase orders List</a></li>
							 s
						</ul>
					</li>
<!-- 					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>STORE MANAGER</span> 
						</a>
						<ul class="sub-menu"> 
							<li><a href="../thitoo/assign_store.php">Assign Store Items</a></li>
							<li><a href="../thitoo/dispatch_stock.php">Dispatch Stock</a></li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Stores</a>
								<ul class="sub-menu"> 
									<li><a href="../thitoo/stores.php">Store list</a></li> 
									<li><a href="../sections/select_store.php">Store Section</a></li> 
								</ul>
							</li>
							<li><a href="../thitoo/stores.php">Stores</a></li>
							<li><a data-toggle="modal" data-target="#modal" id="store-stock" onclick="store();">Stores Stock</a></li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Breakages</a>
								<ul class="sub-menu"> 
									<li><a href="#">Record Breakage</a></li> 
									<li><a href="#">List Breakages</a></li> 
								</ul>
							</li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Requistion</a>
								<ul class="sub-menu"> 
									<li><a href="back/thitoo/init_req.php?st=1">On Demand</a></li> 
									<li><a href="back/thitoo/init_req.php?st=2">Auto Requisition</a></li> 
								</ul>
							</li>
						</ul>
					</li> 
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>INVENTORY MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../prods/prods.php">Active Product List</a></li>
							<li><a href="../prods/arch_prods.php">Archived Product List</a></li>
							<li><a href="../cat/cat.php">Product Categories</a></li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Inventory</a>
								<ul class="sub-menu">
									<li><a href="../inventory/stock.php">Stock Adjustments</a></li> 
									<li><a href="#">Price Adjustments</a></li> 
								</ul>
							</li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Inventory Settings</a>
								<ul class="sub-menu"> 
									<li><a href="back/prods/make.php">Set Phone Make</a></li> 
									<li><a href="back/prods/model.php">Set Phone Model</a></li> 

								</ul>
							</li> 
						</ul>
					</li> <li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>PURCHASE MANAGER</span> 
						</a>
						<ul class="sub-menu">
							<li><a data-toggle="modal" data-target="#modal" id="new-po" onclick="po();">Raise PO</a></li>
							<li><a href="../kugura/po_pending.php">Receive PO</a></li>
							<li><a href="../kugura/po_list.php">Purchase orders List</a></li>
							 s
						</ul>
					</li> -->
					 <li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-users"></i>
						    <span>REPORTS</span> 
						</a>
						<ul class="sub-menu">

							<li class="has-sub">
								<a href="javascript:;">
									<b class="caret"></b>
									<span>Sales</span>
								</a>
								<ul class="sub-menu">
									<li class="has-sub">
										<a href="javascript:;">
											<b class="caret"></b>Cash Sales
										</a>
										<ul class="sub-menu">
											<li> <a href="../reports/daily_cs_report.php">Daily Cash Sales</a> </li>
											<li> <a href="javascript:;">Filtered Cash Sales</a> </li>
											<li> <a href="javascript:;">Cash Sales By Customer</a> </li>
											<li> <a href="javascript:;">Cash Sales By Product</a> </li>

										</ul>
									</li>
									<li class="has-sub">
										<a href="javascript:;">
											<b class="caret"></b>Credit Sales
										</a>
										<ul class="sub-menu">
											<li> <a href="javascript:;">Daily Credit</a> </li>
											<li> <a href="javascript:;">Filtered Credit</a> </li>
											<li> <a href="javascript:;">Credit By Customer</a> </li>
											<li> <a href="javascript:;">Credit By Product</a> </li>
											<li> <a href="javascript:;">Credit Aging Report</a> </li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Products</a>
								<ul class="sub-menu">
									<li><a href="../reports/prods_list.php">Product Lists</a></li>
									<li><a href="../reports/item_sale_select.php">Product Sale Summary</a></li>  
									<li><a href="#">Product Movement</a></li> 
								</ul>
							</li> 
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Customers</a>
								<ul class="sub-menu">
									<li><a href="#">Customer Lists</a></li> 
									<li><a href="#">Customer Orders</a></li> 
								</ul>
							</li>
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Suppliers</a>
								<ul class="sub-menu">
									<li><a href="#">Suppliers Lists</a></li> 
									<li><a href="#">Suppliers Orders</a></li> 
								</ul>
							</li> 
							 
							<li class="has-sub">
								<a href="javascript:;">
									<b class="caret"></b>
									<span>Sales</span>
								</a>
								<ul class="sub-menu">
									<li class="has-sub">
										<a href="javascript:;">
											<b class="caret"></b>Cash Sales
										</a>
										<ul class="sub-menu">
											<li> <a href="../reports/daily_cs_report.php">Daily Cash Sales</a> </li>
											<li> <a href="javascript:;">Filtered Cash Sales</a> </li>
											<li> <a href="javascript:;">Cash Sales By Customer</a> </li>
											<li> <a href="javascript:;">Cash Sales By Product</a> </li>

										</ul>
									</li>
									<li class="has-sub">
										<a href="javascript:;">
											<b class="caret"></b>Credit Sales
										</a>
										<ul class="sub-menu">
											<li> <a href="javascript:;">Daily Credit</a> </li>
											<li> <a href="javascript:;">Filtered Credit</a> </li>
											<li> <a href="javascript:;">Credit By Customer</a> </li>
											<li> <a href="javascript:;">Credit By Product</a> </li>
											<li> <a href="javascript:;">Credit Aging Report</a> </li>
										</ul>
									</li>
								</ul>
							</li> 
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Purchases</a>
								<ul class="sub-menu">
									<li><a href="back/kubuy/po_list.php">Purchase Order Lists</a></li> 
									<li><a href="#">Received Orders</a></li> 
								</ul>
							</li> 
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>Users</a>
								<ul class="sub-menu">
									<li><a href="#">Active Users</a></li> 
									<li><a href="#">Logged In Users</a></li> 
								</ul>
							</li>
						</ul>
					</li>
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-cogs"></i>
						    <span>SETTINGS</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../settings/settings.php">General Details</a></li>
							<li><a href="../settings/new_menu.php">System Menus</a></li>
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
		<!-- end #sidebar -->
		<div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="modal-load"></div>
</div>
<script type="text/javascript">
	//$( document ).ready(function() {
	  // Handler for .ready() called.
    //$(document).on('click','#store-stock', function(e){
    function store(st){
      $('#modal-load').html(''); // leave this diff blank 
      $.ajax({
        url: '../../gen/store_stock.php',
        typr: 'POST',
        data: 'st='+st,
        dataType: 'html'
      })
      .done(function(data){
        $('#modal-load').html(''); // blank before load.
        $('#modal-load').html(data);
      })
      .fail(function(){
        $('#modal-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
  }

  function po(){
  	$('#modal-load').html(''); // leave this diff blank 
      $.ajax({
        url: '../kugura/po_modal.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){
        $('#modal-load').html(''); // blank before load.
        $('#modal-load').html(data);
      })
      .fail(function(){
        $('#modal-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
  } 
   // });
//});
</script>