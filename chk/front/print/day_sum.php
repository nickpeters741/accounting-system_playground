<table class="table"  style="width: 100%;">
				<tbody>
					<tr>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL SALES</h4>
								<p>
									<?php 
									$total_sale=days_total("kp_sales","total_amount","day="."'".$today."'");
									echo $total_sale; ?>
								</p>	
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL CASH SALES</h4>
								<p>
									<?php
									$cash_sale=days_total("kp_sales","total_amount","type=1 AND day="."'".$today."'");
									echo $cash_sale; 
									?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL CREDIT SALES</h4>
								<p>
									<?php
									$credit_sale=days_total("kp_sales","total_amount","type=2 AND day="."'".$today."'");
									echo $credit_sale; 
									 ?></p>
							</div>
						</td>
						<td>
							<h4>CORRECTION</h4>
							<?php 
								$tt=$cash_sale+$credit_sale;

								if ($tt==$total_sale) {
									?>
									NO VARIANCE(<?php echo $total_sale-$tt; ?>)
									<?php 
								}else{
									?>
									CHECK
									<?php
								}
							?>
						</td>
						<td>
							<?php 
								$item_sale=days_total("kp_sale_items","total","day="."'".$today."'");
							?>
							<h4>ITEM AND SALE COMPARISON</h4>
							<p><B>ITEM SALE: <?php echo $item_sale; ?></B></p>
							<?php 
							if ($item_sale==$total_sale) {
									?>
									NO VARIANCE(<?php echo $total_sale-$item_sale; ?>)
									<?php 
								}else{
									?>
									CHECK
									<?php
								}
							?>
						</td>
					</tr>
					<tr>
						<td>
							<div class="stats-info" style=""> 
								<h4><u>CASH DRAWER TOTALS</u></h4> 
								 <?php
						          $sum=0;
						            $get_mode = "SELECT * FROM kp_pay_mode"; 
						            $get_mode_r = mysqli_query($connection,$get_mode) or die("Could not fetch the payment mode");
						            while ($o = mysqli_fetch_assoc($get_mode_r)) {  
						              $mode_id=$o['pay_id']; 
						              $name = $o['name']; 
						              $mode_total=pay_mode_total($mode_id,$today,$today,$shop);
						              ?>
						              <p style="margin: 3px;" > <?php echo $name."-".$mode_total; ?> </p>
						              <?php  
						                $sum=$sum+$mode_total;
						              }  
						              ?>
						              <p style="margin: 3px;">STORE CREDIT 
						              	<b style="text-align: right;">
						              		<?php 
						              		$sc_total=pay_mode_total('sc',$today,$today,$shop);
						              		echo  $sc_total; ?>
						              			
						              		</b>
						              	</p>

						              <p style="margin: 3px;"> <b>TOTAL <?php echo $sum+$sc_total; ?></b></p>
						         
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>CASH SALES PAYMENT</h4>
								<p>
									<?php
									$pay_sale=days_total("kp_sale_payment","paid_total","type=1 AND pay_date="."'".$today."'");
									echo $pay_sale; 
									 ?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>CREDIIT SALES PAYMENT</h4>
								<p>
									<?php
									$prev=days_total("kp_sale_payment","paid_total","type=2 AND pay_date="."'".$today."'");
									echo $prev; 
									 ?></p>
							</div>
						</td>
						<td class="text-center">
							<b>TOTAL UPFRONT PAYMENTS(STORE CREDIT) <BR> 5</b>
						</td>
						<td class="text-center">
							<b>CORRECTIONS<BR> 5</b>
						</td>
					</tr>

					<tr>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL PURCHASES</h4>
								<p>
									<?php 
									$total_po=days_total("kp_po","amount","ord_date="."'".$today."'");
									echo $total_po; ?>
								</p>	
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL ITEMS PURCHASED</h4>
								<p>
									<?php
									$total_items=days_count("kp_po_items","qty","day="."'".$today."'");
									echo $total_items; 
									?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL PURCHASED ITEM AMOUNT</h4>
								<p>
									<?php
									$po_item_total=days_total("kp_po_items","total","day="."'".$today."'");
									echo $po_item_total; 
									 ?></p>
							</div>
						</td>
						<td>
							<h4>CORRECTION</h4>
							<?php  

								if ($total_po==$po_item_total) {
									?>
									NO VARIANCE(<?php echo $total_sale-$tt; ?>)
									<?php 
								}else{
									?>
									VARIANCE(<?php echo $total_po-$po_item_total; ?>)
									<?php
								}
							?>
						</td> 
					</tr> 
					<tr>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL REQUISITIONS</h4>
								<p>
									<?php 
									$total_po=days_count("kp_req","req_id","req_date="."'".$today."'");
									echo $total_po; ?>
								</p>	
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL ITEMS REQUISITONED</h4>
								<p>
									<?php
									$total_items=days_total("kp_req_items","req_qty","req_date="."'".$today."'");
									echo $total_items; 
									?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>PENDING REQUISITIONS</h4>
								<p>
									<?php
									$pending=days_count("kp_req","req_id"," rec_status!=1 AND req_date="."'".$today."'");
									echo $pending; 
									 ?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>RECEIVED REQUISITIONS</h4>
								<p>
									<?php
									$pending=days_count("kp_req","req_id"," rec_status=1 AND req_date="."'".$today."'");
									echo $pending; 
									 ?></p>
							</div>
						</td>
						<td>
							<h4>CORRECTION</h4>
							 
						</td> 
					</tr> 

					<tr>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL RETURNS</h4>
								<p>
									<?php 
									$total_po=days_count("kp_ret","ret_id","ret_date="."'".$today."'");
									echo $total_po; ?>
								</p>	
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>TOTAL ITEMS RETURNED</h4>
								<p>
									<?php
									$total_items=days_count("kp_ret_items","item_id","app_date="."'".$today."'");
									echo $total_items; 
									?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>ONGOING RETURNS</h4>
								<p>
									<?php
									$pending=days_count("kp_ret_status","ret_id","status!=0");
									echo $pending; 
									 ?></p>
							</div>
						</td>
						<td class="text-center">
							<div class="stats-info" style=""> 
								<h4>RECEIVED REQUISITIONS</h4>
								<p>
									<?php
									$pending=days_count("kp_req","req_id"," rec_status=1 AND req_date="."'".$today."'");
									echo $pending; 
									 ?></p>
							</div>
						</td>
						<td>
							<h4>CORRECTION</h4>
							 
						</td> 
					</tr> 
				</tbody>
			</table>