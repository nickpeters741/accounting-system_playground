<?php       

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$shop = $row['shop'];
?>
<!-- begin sidebar nav -->
<ul class="nav">
	<li class="nav-header text-center">  
							<img src="<?php echo get_column('kp_settings_gen','image_path',"id='$shop'");?>" alt=""  style="width: 100px;height: 100px; border-radius:50%;"/> 
					</li> 
			<li class="nav-header text-center"><b><?php echo get_column('kp_settings_gen','company_name',"id='$shop'"); ?></b></li>
			<li  class="side-li">
				<a href="#modal" id="select_modal" data-toggle="modal"> 
					<i class="fa fa-cart-plus"></i>
				    <span>MAKE SALE</span> 
				</a>
			</li>
			 <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fa fa-cart-plus"></i>
                    <span>SALES MANAGER</span> 
                </a>
                <ul class="sub-menu"> 
                	
                    <!--<li><a href="../sales/on_order.php">Online Orders</a></li>-->
                    <li><a href="../reports/my_orders.php">Sales</a></li>
                    <!--<li><a href="../kuot/qt_pending.php">Invoices</a></li>--> 
                    <li><a href="../sales/index.php">Inventory</a></li>
                    <li><a href="../payment/cust_bal.php"> Payments</a></li>  
                </ul>
            </li> 
			<!--<li  class="side-li">
				<a href="../payment/cust_bal.php"> 
					 <i class="fa fa-credit-card" ></i>
				    <span>PAYMENTS</span> 
				</a>
			</li>-->
			 <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fa fa-truck"></i>
                    <span>INPUTS MANAGER</span> 
                </a>
                <ul class="sub-menu">
                    <li class="has-sub">
                        <a href="javascript:;">
                            <b class="caret"></b>
                            <span>Purchases</span> 
                        </a>
                        <ul class="sub-menu">
                            <li><a href="../kugura/init_page.php">Raise PO</a></li>
                            <li><a href="../kugura/po_list.php">Input Inventory</a></li> 
                            <!--<li><a href="../kugura/po_pending.php">Receive PO</a></li>-->
                            <li><a href="../kugura/po_list.php">Purchase orders List</a></li> 
                            <!--<li><a href="../grn/grn_list.php">G.R.N List</a></li> -->
                            <li><a href="../kugura/po_list.php">Returns</a></li> 
                        </ul>
                    </li> 
                </ul>
            </li>
			<!--<li  class="side-li">
				<a href="../return/return.php"> 
					 <i class="fas fa-reply fa-spin" data-fa-mask="fas fa-box" data-fa-transform="shrink-9 down-3.5 flip-v"></i>
				    <span>EXPENSES MANAGER</span> 
				</a>
			</li> -->
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fas fa-file-invoice-dollar"></i>
                    <span>OUTPUT MANAGER</span> 
                </a>
                <ul class="sub-menu"> 
                   <!-- <li><a href="../prod/expenses.php">Current Outputs</a></li>-->
                    <li><a href="../prod/output.php">Output Inventory</a></li>   
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fas fa-file-invoice-dollar"></i>
                    <span>EXPENSES MANAGER</span> 
                </a>
                <ul class="sub-menu"> 
                    <li><a href="../expenses/expenses.php">Current Expenses</a></li>
                    <li><a href="../expenses/pexpenses.php">Paid Expenses</a></li>   
                </ul>
            </li>
           
			<li  class="has-sub">
				<a href="javascript:;">
			        <b class="caret"></b>
					<i class="fa fa-dollar-sign"></i>
				    <span>FINANCE</span> 
				</a>
				<ul class="sub-menu">
					<li><a href="">Total Expenses</a></li>
					<li><a href="">Total Sales</a></li>
					<li><a href="">Total Credit</a></li>
					<li><a href="">P/L Statement</a></li>

					<li class="has-sub">
						<a href="javascript:;">
							<b class="caret"></b>
							<span>Store Credit</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../stcred/init_pg.php">Add Store Credit</a></li>
							<li><a href="../stcred/stc_list.php">Store Credit List</a></li>  
						</ul>
					</li>
				</ul>
			</li> 
			<li class="has-sub">
				<a href="javascript:;">
			        <b class="caret"></b>
				    <i class="fa fa-chart-pie"></i>
				    <span>REPORTS</span> 
				</a>
				<ul class="sub-menu"> 
					<li><a id="zreport" onclick="zreport();">Z Report</a></li>
					 <!--<li><a href="../reports/close_day.php">Z Report</a></li> -->
					<!-- <li><a href="../../print/close_day.php">New Z Report</a></li> -->
					<li><a href="../reports/my_orders.php">View Orders</a></li> 
					<li><a href="../reports/cust_select.php">Customer Statement</a></li> 
					 
				</ul>
			</li>
			<!-- begin sidebar minify button -->
			<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
			<!-- end sidebar minify button -->
		</ul>
		<!-- end sidebar nav -->