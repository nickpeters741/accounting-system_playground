<!-- begin sidebar nav -->
<ul class="nav">
			<li  class="side-li">
				<a href="#modal" id="select_modal" data-toggle="modal"> 
					<i class="fa fa-cart-plus"></i>
				    <span>MAKE SALES</span> 
				</a>
			</li> 
			<li  class="side-li">
				<a href="../payment/cust_bal.php"> 
					 <i class="fa fa-credit-card" ></i>
				    <span>PAYMENTS</span> 
				</a>
			</li>
			<li  class="side-li">
				<a href="../return/return.php"> 
					 <i class="fas fa-reply fa-spin" data-fa-mask="fas fa-box" data-fa-transform="shrink-9 down-3.5 flip-v"></i>
				    <span>RETURN</span> 
				</a>
			</li> 
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fas fa-file-invoice-dollar"></i>
                    <span>QUOTE MANAGER</span> 
                </a>
                <ul class="sub-menu"> 
                    <li><a href="../kuot/init_page.php">Generate Quote</a></li>
                    <li><a href="../kuot/qt_pending.php">Quotation List</a></li>   
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fas fa-shopping-basket"></i>
                    <span>L.P.O MANAGER</span> 
                </a>
                <ul class="sub-menu"> 
                    <li><a href="../lpo/init_page.php">Raise L.P.O</a></li>
                    <li><a href="../lpo/lpos.php">L.P.O's List</a></li>   
                </ul>
            </li>
            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                        <i class="fa fa-truck"></i>
                    <span>STORE MANAGER</span> 
                </a>
                <ul class="sub-menu">
                    <li class="has-sub">
                        <a href="javascript:;">
                            <b class="caret"></b>
                            <span>Purchases</span> 
                        </a>
                        <ul class="sub-menu">
                            <li><a href="../kugura/init_page.php">Raise PO</a></li>
                            <li><a href="../kugura/po_pending.php">Receive PO</a></li>
                            <li><a href="../kugura/po_list.php">Purchase orders List</a></li> 
                        </ul>
                    </li> 
                </ul>
            </li>
			<li  class="has-sub">
				<a href="javascript:;">
			        <b class="caret"></b>
					<i class="fa fa-dollar-sign"></i>
				    <span>FINANCE</span> 
				</a>
				<ul class="sub-menu">
					
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