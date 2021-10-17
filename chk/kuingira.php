<?php
session_start();
include('inc/connection.php');
include('inc/gen_funcs.php');
if (isset($_REQUEST['cabi'])) {
	if (empty($_REQUEST['cabi'])) { 
		?>
		<script type="text/javascript">
			// var hulla = new hullabaloo();
		 //    hulla.send('EMPTY PASSWORD', "danger"); 
		    $.gritter.add({
				title: 'EMPTY PASSWORD!',
				text: 'The password Cannot be Empty. ',
				sticky: false, 
				class_name: 'gritter-light',
				before_open: function() {
					if($('.gritter-item-wrapper').length === 4) {
						$.gritter.removeAll(); //return false;
					}
				}
			});
		</script>
		<?php
	}else{
		$kihingo = mysqli_real_escape_string($connection,$_REQUEST['cabi']);
		$shop = 1;
		$verify = mysqli_query($connection,"SELECT * FROM kp_users WHERE cabi='$kihingo'") or die("Could not verify the password");
		if (mysqli_num_rows($verify) < 1) { 
			?>
			<script type="text/javascript">
				// 	var hulla = new hullabaloo();
			 	//	hulla.send('WRONG PASSWORD', "danger");
			 	$.gritter.add({
					title: 'WRONG PASSWORD!',
					text: 'The password you entered is wrong. ',
					sticky: false, 
					class_name: 'gritter-light',
					before_open: function() {
						if($('.gritter-item-wrapper').length === 4) {
							$.gritter.removeAll(); //return false;
						}
					}
				});
			</script>
			<?php
		}else{
			$row = mysqli_fetch_assoc($verify);
			$work_status=$row['work_status'];
			$login_status=$row['log_status'];

			if ($login_status!=2) {
				?>
				<script type="text/javascript">
					var hulla = new hullabaloo();
				    hulla.send('YOU ARE LOGGED IN ANOTHER COMPUTER!!!!!CONTACT ADMIN', "danger"); 
				</script>
				<?php
			}else{
				if ($work_status!=2) {
					?>
					<script type="text/javascript">
						var hulla = new hullabaloo();
					    hulla.send('YOU ACCESS TO SYSTEM REVOKED!!!!!CONTACT ADMIN', "danger"); 
					</script>
					<?php
				}else{
					$role_id = $row['role_id'];
					$get_role= mysqli_query($connection,"SELECT * FROM kp_roles WHERE role_id='$role_id'");
					if (mysqli_num_rows($verify) < 1) {
						?>
						<script type="text/javascript">
							var hulla = new hullabaloo();
						    hulla.send('YOU ARE NOT ASSIGNED ANY ROLE!!!!!CONTACT ADMIN TO ASSIGN YOU A ROLE', "danger"); 
						</script>
						<?php
					}else{
						$rol = mysqli_fetch_assoc($get_role);
						$panel = $rol['access_panel'];
						$dash = $rol['access_dash'];
						$user_id=$row['user_id'];
						$create_logger_details = mysqli_query($connection,"INSERT INTO kp_users_logger(user_id,datime) VALUES('$user_id',CURRENT_DATE )") or die(mysqli_error($connection));
						if (!$create_logger_details) {
							?>
							<script type="text/javascript">
								var hulla = new hullabaloo();
							    hulla.send('REPORT LOGGER ERROR!!!!!CONTACT ADMIN ', "danger"); 
							</script>
							<?php
						}else{
							$update_login_status = mysqli_query($connection,"UPDATE kp_users SET log_status=1 WHERE user_id='$user_id'") or die(mysqli_error($connection));
							if (!$update_login_status) {
								?>
								<script type="text/javascript">
									var hulla = new hullabaloo();
								    hulla.send('REPORT LOG STATUS ERROR!!!!!CONTACT ADMIN ', "danger"); 
								</script>
								<?php
							}else{
								$user_id=$row['user_id'];
								$_SESSION['user_id'] = $row['user_id'];  
								$get_thesion = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id' AND shop='$shop'") or die("Could not get the user permissions");
							    $num = mysqli_num_rows($get_thesion);
							    if ($num<1) { 
							    	thesion_init($user_id,$dash,$panel,$shop);
							    }
							    if ($num>=1) { 
									$tow=mysqli_fetch_assoc($get_thesion);
							    	$last_page=$tow['current_page'];
							    	if (empty($last_page)) {
							    		$delete_thesion = mysqli_query($connection,"DELETE FROM kp_thesion  WHERE user_id='$user_id'") or die(mysqli_error($connection));
							    		?>
										<script type="text/javascript">
											var hulla = new hullabaloo();
										    hulla.send('TRY LOGGING IN AGAIN!!!!!IF YOU SEE THIS TWICE CONTACT ADMIN ', "warning"); 
										</script>
										<?php
							    	}elseif (file_exists($last_page)){
							    		$delete_thesion = mysqli_query($connection,"DELETE FROM kp_thesion  WHERE user_id='$user_id'") or die(mysqli_error($connection));
							    		?>
										<script type="text/javascript">
											var hulla = new hullabaloo();
										    hulla.send('TRY LOGGING IN AGAIN LAST PAGE HAD A PROBLEM!!!!!IF YOU SEE THIS TWICE CONTACT ADMIN ', "warning"); 
										</script>
										<?php
							    	}else{
										?>
										<script type="text/javascript">
											window.location.href = '<?php echo $last_page; ?>';
										</script>
										<?php
									}
								}elseif ($panel==1) {
									thesion_init($user_id,$dash,1,$shop);
									?>
									<script type="text/javascript">
										window.location.href = "back/dash/"+'<?php echo $dash; ?>';
									</script>
									<?php
								}elseif ($panel == 2) {
									thesion_init($user_id,$dash,2,$shop);
									?>
									<script type="text/javascript">
										window.location.href = "front/dash/"+'<?php echo $dash; ?>';
									</script>
									<?php 
								}elseif ($panel == 3) {
									thesion_init($user_id,$dash,3,$shop);
									?>
									<script type="text/javascript">
										$('#login-modal').modal('show');
										load_dash();
										 
									</script>
									<?php
								}else{
									?>
									<script type="text/javascript">
									// var hulla = new hullabaloo();
								 	// 	hulla.send('WRONG PASSWORD', "danger");
								 	$.gritter.add({
										title: 'Role Not Asssigned to An Access Panel!',
										text: 'Ask Administrator To assign your Role to a Panel. ',
										sticky: false, 
										class_name: 'gritter-light',
										before_open: function() {
											if($('.gritter-item-wrapper').length === 4) {
												$.gritter.removeAll(); //return false;
											}
										}
									});
									</script>
									<?php
								}
								
							}
						}
					}
					
				}
			}
	}
}
}else{

	echo  "You should know people and get a life" ; 
	 
}
?>