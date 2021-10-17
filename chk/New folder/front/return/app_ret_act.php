<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id=$_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];
$cust_id = $row['cust_id'];

$comment= $_REQUEST['comment'];
$decision= $_REQUEST['decision']; 
$bank_id= $_REQUEST['bank_id'];      
$cabi= $_REQUEST['cabi']; 
$ret_amount=ret_total($ret_id); 

if ($decision==2 && $bank_id==0) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Danger!!! You Must Select a bank', "danger");  
	</script>
	<?php
}elseif (empty($cabi)) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Danger!!! Password Cannot be Empty', "danger");  
	</script>
	<?php
}elseif ($ret_amount==0) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Danger!!! Return cant b empty!!!! A reminder please, every trial is documented so TAKE CARE!!', "danger");  
	</script>
	<?php
}elseif (empty($comment)) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Warning!!! Your Comments Matters at this stage', "warning");  
	</script>
	<?php
}elseif ($decision!=1 &&  $decision!=2) {
	?>
	<script type="text/javascript">
		var hulla = new hullabaloo();
		hulla.send('Warning!!! Your Decision Matters at this stage', "warning");  
	</script>
	<?php
}else{
	if (front_perm($cabi,3)){
		$app_user=user_id($cabi);
		$get_sale_Det=mysqli_query($connection , "SELECT * FROM kp_sales WHERE sale_id='$sale_id'") or die(mysqli_error($connection));
		$pr = mysqli_fetch_assoc($get_sale_Det);
		$cust_id = $pr['cust_id'];  
		$sale_bal=$pr['sale_bal']; 
		$sale_type=$pr['type'];

		$get_cust=mysqli_query($connection , "SELECT * FROM kp_customers WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
		$cr = mysqli_fetch_assoc($get_cust);
		$cust_name=$cr['name'];
		$cust_phone=$cr['phone'];
		$cust_bal=cust_bal($cust_id)-$sale_bal;
		if ($sale_bal>=$ret_amount) {
			///////////////////////////////////////////////////////////////////////////////////////////////
			//===============STORE CREDIT ON ALL UNPAID RAISE DEBIT NOTE========================================//
			///////////////////////////////////////////////////////////////////////////////////////////////
			if(credit_note($sale_id,"D",$app_user,0,$ret_amount,$ret_id)) {
				$deduct_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal-'$ret_amount' WHERE cust_id='$cust_id'") or die("Could not update bank balance");
				if ($deduct_bal) {
					if(sale_note_payment($cust_id,$ret_amount,$sale_id)){
						$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=1,app_by='$app_user',app_date=CURRENT_DATE,app_comments='$comment',app_decision='$decision' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
						if ($update_ret_hist) {
							$return = "INSERT INTO kp_ret(ret_id,sale_id,cust_id,ret_user,ret_date,ret_amount,app_user,app_decision,app_comment,cf_bal) VALUES('$ret_id','$sale_id','$cust_id','$user_id',CURRENT_DATE,'$ret_amount','$app_user','$decision','$comment','$cust_bal')";
							$create_ret = mysqli_query($connection,$return) or die("Error creating return".mysqli_error($connection));
							if ($create_ret) {
								$clear_ret_status = mysqli_query($connection,"DELETE FROM kp_ret_status  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));
								if ($clear_ret_status) {
								 ?>
								 <script type="text/javascript"> 
									window.location.href = "return_print.php";
								</script>
								<?php
								}else{
									$remove_ret = mysqli_query($connection,"DELETE FROM kp_ret WHERE ret_id='$ret_id'") or die("Could not update bank balance");
								 	undo_note_payment($ret_id);
								 	$add_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$ret_amount' WHERE cust_id='$cust_id'") or die("Could not update bank balance"); 
									$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
									$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
									?>
									<script type="text/javascript">
										var hulla = new hullabaloo();
										hulla.send('Danger!!! Could not create an unapproved 1 return', "danger");  
									</script>
									<?php
								 } 
							}else{
								undo_note_payment($ret_id);
								$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
								$add_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$ret_amount' WHERE cust_id='$cust_id'") or die("Could not update bank balance");
								undo_note_payment($ret_id);
								$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
								?>
								<script type="text/javascript">
									var hulla = new hullabaloo();
									hulla.send('Danger!!! Could not create an unapproved 2 return', "danger");  
								</script>
								<?php
							}
						}else{
							$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
							$add_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$ret_amount' WHERE cust_id='$cust_id'") or die("Could not update bank balance");
							undo_note_payment($ret_id);
							$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
							?>
							<script type="text/javascript">
								var hulla = new hullabaloo();
								hulla.send('Danger!!! Could not raise debit note', "danger");  
							</script>
							<?php
						}
					}else{
						$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
						$add_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$ret_amount' WHERE cust_id='$cust_id'") or die("Could not update bank balance");
						?>
						<script type="text/javascript">
							var hulla = new hullabaloo();
							hulla.send('Danger!!! Could not raise debit note', "danger");  
						</script>
						<?php
					}
				}else{
					$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
					?>
					<script type="text/javascript">
						var hulla = new hullabaloo();
						hulla.send('Danger!!! Could not raise debit note', "danger");  
					</script>
					<?php
				}
			}else{
				?>
				<script type="text/javascript">
					var hulla = new hullabaloo();
					hulla.send('Danger!!! Could not raise debit note', "danger");  
				</script>
				<?php
			}
			///////////////////////////////////////////////////////////////////////////////////////////////
			//===============APPROVE ON ALL UNPAID RAISE DEBIT NOTE=================================//
			///////////////////////////////////////////////////////////////////////////////////////////////
		}elseif ($sale_bal<$ret_amount) {
			///////////////////////////////////////////////////////////////////////////////////////////////
			//===============STORE CREDIT ON ALL PAID RAISE DEBIT NOTE OR CREDIT NOTE=================================//
			///////////////////////////////////////////////////////////////////////////////////////////////
				$excess_amount=$ret_amount-$sale_bal;

				$cr_amount=$excess_amount;

				$dr_amount=$sale_bal;
				if ($dr_amount==0) {
					$type="C";
				}else{
					$type="CD";
				}
				if(credit_note($sale_id,$type,$app_user,$cr_amount,$dr_amount,$ret_id)) {
					$deduct_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal-'$dr_amount' WHERE cust_id='$cust_id'") or die("Could not update cust balance");
					if ($deduct_bal) {
						if(sale_note_payment($cust_id,$dr_amount,$sale_id)){
							$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=1,app_by='$app_user',app_date=CURRENT_DATE,app_comments='$comment',app_decision='$decision' WHERE ret_id='$ret_id'");
							if ($update_ret_hist) {
									$return = "INSERT INTO kp_ret(ret_id,sale_id,ret_user,ret_date,ret_amount,app_user,app_decision,app_comment,cf_bal,cust_id) VALUES('$ret_id','$sale_id','$user_id',CURRENT_DATE,'$ret_amount','$app_user','$decision','$comment','$cust_bal','$cust_id')";
									$create_ret = mysqli_query($connection,$return) or die(mysqli_error($connection)) ;
									if ($create_ret) { 
										///////////////////////////////////////////////////////////////////////////////////////////////
										//===============HANDLE PETTY OR CREDIT DEPPENDING ON DECISION===============================//
										///////////////////////////////////////////////////////////////////////////////////////////////
										if ($decision==1) { 
											$trans="SALE RETURN"; 
											$update_wallet=mysqli_query($connection,"INSERT INTO kp_sc (cust_id,amount) VALUES ('$cust_id', '$cr_amount') ON DUPLICATE KEY UPDATE amount=amount+'$cr_amount'") ;
											if ($update_wallet) {
												$create_history = mysqli_query($connection,"INSERT INTO kp_sc_hist(cust_id,amount,trans,user_id,trans_id,ret_id,trans_type,day)  
												VALUES('$cust_id','$cr_amount','$trans','$user_id','$ret_id','$ret_id','$sale_type',CURRENT_DATE)")  or die(mysqli_error($connection));
												if ($create_history) {
													$clear_ret_status = mysqli_query($connection,"DELETE FROM kp_ret_status  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));
													if ($clear_ret_status) {
													 ?>
													 <script type="text/javascript"> 
														window.location.href = "return_print.php";
													</script>
													<?php
													}else{
														error_logs("CLEAR STATUS","COULDN'T CLEAR RETURN STATUS OF RET ID $ret_id  ON APPROVAL");
														$clear_store_hist = mysqli_query($connection,"DELETE FROM kp_sc_hist  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));
														$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET  amount=amount-'$cr_amount' WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
														undo_note_payment($ret_id);
														$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
														$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
													} 
												}else{
													error_logs("STORE CREDIT HISTORY","COULDN'T UPDATE WALLET HISTORY FOR SALE ID $sale_id  ON APPROVAL");
													$update_wallet=mysqli_query($connection,"UPDATE kp_sc SET  amount=amount-'$cr_amount' WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
													undo_note_payment($ret_id);
													$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
													$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
													?>
													<script type="text/javascript">
														var hulla = new hullabaloo();
														hulla.send('Danger!!! Could not create an unapproved 3 return', "danger");  
													</script>
													<?php
												}
											}else{
										 		error_logs("PAY CREDIT ORDER","COULDN'T UPDATE WALLET FOR SALE ID $sale_id ON APPROVAL");
										 		undo_note_payment($ret_id);
													$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
													$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
													?>
													<script type="text/javascript">
														var hulla = new hullabaloo();
														hulla.send('Danger!!! Could not create an unapproved 4 return', "danger");  
													</script>
													<?php
											}
										}elseif ($decision==2){ 
											$petty_id = petty_id();
											$desc="CREDIT NOTE RAISED DURING RETURN";
											//$bank_id=1;
											$balance=round(bank_bal($bank_id));
											$bal=$balance-$ret_amount; 
											$type=2;
											$nid=0;
											$create = mysqli_query($connection,"INSERT INTO kp_petty(petty_id, description, recipient, recipient_id, recipient_phone, amount_given ,amount_used, raise_by, app_by,date,bank_bal,bank_id,type) VALUES('$petty_id','$desc','$cust_name','$nid','$cust_phone','$cr_amount','$cr_amount','$user_id','$app_user',CURRENT_DATE,'$balance','$bank_id','$type')") or die("Error creating petty".mysqli_error($connection));
												if ($create) {
													$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal-'$cr_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance");
													if ($update_bank) {
													 	$bank_history= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$bank_id','PETTY CASH RAISED','$cr_amount','$user_id','$bal',CURRENT_DATE)") or die(mysqli_error($connection));
													 	if ($bank_history) {
													 		$clear_ret_status = mysqli_query($connection,"DELETE FROM kp_ret_status  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));
																if ($clear_ret_status) {
																 ?>
																 <script type="text/javascript"> 
																	window.location.href = "return_print.php?pet="+<?php echo $petty_id; ?>;
																</script>
																<?php
																}else{
														 		error_logs("UPDATING BANK BALANCE","COULDN'T UPDATE BANK BALANCE FOR PETTY ID $petty_id ON APPROVAL");
													 			undo_note_payment($ret_id);
													 			$remove_credit = mysqli_query($connection,"DELETE FROM kp_bank_hist WHERE bank_id='$bank_id' AND user_id='$user_id' AND bank_bal='$bank_bal' AND  day=CURRENT_DATE AND amount='$cr_amount'") or die("Could not update bank balance");
															 	$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$cr_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance");
																$remove_credit = mysqli_query($connection,"DELETE FROM kp_petty WHERE petty_id='$petty_id'") or die("Could not update bank balance");
															 	undo_note_payment($ret_id); 
																$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
																$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
																?>
																<script type="text/javascript">
																	var hulla = new hullabaloo();
																	hulla.send('Danger!!! Could not create an unapproved 5 return', "danger");  
																</script>
																<?php
														 	}
													 	}else{
													 		error_logs("UPDATING BANK BALANCE","COULDN'T UPDATE BANK BALANCE FOR PETTY ID $petty_id ON APPROVAL");
												 			undo_note_payment($ret_id);
														 	$update_bank = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$cr_amount' WHERE bank_id='$bank_id'") or die("Could not update bank balance");
															$remove_credit = mysqli_query($connection,"DELETE FROM kp_petty WHERE petty_id='$petty_id'") or die("Could not update bank balance");
														 	undo_note_payment($ret_id); 
															$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
															$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
															?>
															<script type="text/javascript">
																var hulla = new hullabaloo();
																hulla.send('Danger!!! Could not create an unapproved 6 return', "danger");  
															</script>
															<?php
													 	}
													}else{
													 	error_logs("UPDATING BANK BALANCE","COULDN'T UPDATE BANK BALANCE FOR PETTY ID $petty_id ON APPROVAL");
											 			undo_note_payment($ret_id);
													 	$remove_credit = mysqli_query($connection,"DELETE FROM kp_petty WHERE petty_id='$petty_id'") or die("Could not update bank balance");
													 	undo_note_payment($ret_id);
														$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
														$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));

														$return_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$dr_amount' WHERE cust_id='$cust_id'") or die("Could not update cust balance");
														?>
														<script type="text/javascript">
															var hulla = new hullabaloo();
															hulla.send('Danger!!! Could not create an unapproved 7 return', "danger");  
														</script>
														<?php
													} 
												}else{
													error_logs("creating ret","COULDN'T create return ON APPROVAL");
													undo_note_payment($ret_id);
													$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
													$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection)); 
													?>
													<script type="text/javascript">
														var hulla = new hullabaloo();
														hulla.send('Danger!!! Could not create an unapproved 8 return', "danger");  
													</script>
													<?php
												} 
										}
										///////////////////////////////////////////////////////////////////////////////////////////////
										//===============HANDLE PETTY OR CREDIT DEPPENDING ON DECISION===============================//
										///////////////////////////////////////////////////////////////////////////////////////////////
									}else{
										undo_note_payment($ret_id);
										$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
										$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
										$return_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$dr_amount' WHERE cust_id='$cust_id'") or die("Could not update cust balance");
										?>
										<script type="text/javascript"> 
											var hulla = new hullabaloo();
											hulla.send('Danger!!! Could not create an unapproved 9 return', "danger");  
										</script>
										<?php
									}
							}else{
								$return_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$dr_amount' WHERE cust_id='$cust_id'") or die("Could not update cust balance");
								undo_note_payment($ret_id);
								$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
								$update_ret_hist=mysqli_query($connection,"UPDATE kp_ret_items SET ret_status=2,app_by='',app_comments='',app_decision='' WHERE ret_id='$ret_id'") or die(mysqli_error($connection));

								?>
								<script type="text/javascript">
									var hulla = new hullabaloo();
									hulla.send('Danger!!! Could not raise debit note', "danger");  
								</script>
								<?php
							}
						}else{
							$return_bal = mysqli_query($connection,"UPDATE kp_customers SET bal=bal+'$dr_amount' WHERE cust_id='$cust_id'") or die("Could not update cust balance");
							$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
							?>
							<script type="text/javascript">
								var hulla = new hullabaloo();
								hulla.send('Danger!!! Could not raise debit note', "danger");  
							</script>
							<?php
						}
					}else{
						$remove_credit = mysqli_query($connection,"DELETE FROM kp_note WHERE ret_id='$ret_id'") or die("Could not update bank balance");
						?>
						<script type="text/javascript">
							var hulla = new hullabaloo();
							hulla.send('Danger!!! Could not raise debit note', "danger");  
						</script>
						<?php
					}
				}else{
					?>
					<script type="text/javascript">
						var hulla = new hullabaloo();
						hulla.send('Danger!!! Could not raise debit note', "danger");  
					</script>
					<?php
				} 
			///////////////////////////////////////////////////////////////////////////////////////////////
			//===============STORE CREDIT ON ALL UNPAID RAISE DEBIT NOTE=================================//
			///////////////////////////////////////////////////////////////////////////////////////////////
		}else{
			?>
			<script type="text/javascript">
				var hulla = new hullabaloo();
				hulla.send('Danger!!! Contact Administrator with balance error', "danger");  
			</script>
			<?php
		}
	}else{
		?>
		<script type="text/javascript">
			var hulla = new hullabaloo();
			hulla.send('Danger!!! Remember Every trial is documeted', "danger");  
		</script>
		<?php
	}

}