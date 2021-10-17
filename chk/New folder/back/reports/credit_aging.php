<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$today = mysqli_real_escape_string($connection,$_REQUEST['start_date']); 
$det = mysqli_real_escape_string($connection,$_REQUEST['det']);
?>
<div class="modal-content"> 
  <div class="modal-body"> 
    <table  class="table">
     	<thead>
     		<tr>
		   		<td colspan="7">
		   			<h2 style="text-decoration: underline;" class="text-center"><b>CREDIT AGING ANALYSIS AS PER <?PHP echo $today; ?></b></h2>
		   		</td>
		   	</tr>
		   	<tr> 
		   		<th colspan="2">CUSTOMER</th> 
		      <th><15 DAYS</th>
		      <th><30 DAYS</th>
		      <th><60 DAYS</th>
		      <th>>60 DAYS</th>
		      <th>TOTAL</th> 
		    </tr>
		</thead>
		<tbody>
			<?php
			$sales = mysqli_query($connection,"SELECT cust_id FROM kp_sales WHERE type=2 GROUP BY cust_id");
			if (mysqli_num_rows($sales) < 1) {
				?>
				<div class="alert alert-warning">
					<p>There are no recorded sales</p>
				</div>
				<?php
			}else{
				$t15=0;
				$t30=0;
				$t60=0;
				$tmore=0;
				//$today=date('Y-m-d');
		   	$day15=date('Y-m-d', strtotime('-15 days', strtotime($today)));
		   	$day16=date('Y-m-d', strtotime('-16 days', strtotime($today)));
		   	$day30=date('Y-m-d', strtotime('-30 days', strtotime($today)));
		   	$day31=date('Y-m-d', strtotime('-31 days', strtotime($today)));
		   	$day60=date('Y-m-d', strtotime('-60 days', strtotime($today)));
		   	$day61=date('Y-m-d', strtotime('-61 days', strtotime($today)));
		   	while ($sa = mysqli_fetch_assoc($sales)) {
		   		$cust_id= $sa['cust_id']; 
		   		$less_15 = mysqli_query($connection,"SELECT SUM(sale_bal) as tbal FROM kp_sales WHERE cust_id='$cust_id' AND day BETWEEN '$day15' AND  '$today'")  or die("Erros fetching the number of sales.:".mysqli_error($connection));
		   		$l15 = mysqli_fetch_assoc($less_15);
		   		$less15 = $l15['tbal'];	
		   		$btn15_30 = mysqli_query($connection,"SELECT SUM(sale_bal) as tbal FROM kp_sales WHERE cust_id='$cust_id' AND day BETWEEN '$day30' AND  '$day16'") or die("Erros fetching the number of sales.:".mysqli_error($connection));
		   		$btn15 = mysqli_fetch_assoc($btn15_30);
		   		$btn15 = $btn15['tbal'];
		   		$btn30_60 = mysqli_query($connection,"SELECT SUM(sale_bal) as tbal FROM kp_sales WHERE cust_id='$cust_id' AND day BETWEEN '$day60' AND  '$day31'") or die("Erros fetching the number of sales.:".mysqli_error($connection));
		   		$btn60 = mysqli_fetch_assoc($btn30_60);
		   		$btn60 = $btn60['tbal'];
		   		$more = mysqli_query($connection,"SELECT SUM(sale_bal) as tbal FROM kp_sales WHERE cust_id='$cust_id' AND day<= '$day61'") or die("Erros fetching the number of sales.:".mysqli_error($connection));
					$mr = mysqli_fetch_assoc($more);
					$mr60 = $mr['tbal'];

					$t15=$t15+$less15;
	   			$t30= $t30+$btn15;
	   			$t60=$t60+$btn60;
	   			$tmore=$tmore+$mr60;
	   			$total=$less15+$btn15+$btn60+$mr60;
	   			if ($total==0) {
	   				# code...
	   			}else{
	   			?>
		   		<tr style="background-color: grey;"> 
		   			<td colspan="2"><?php echo get_cust($cust_id); ?></td>						   		
		   			<td> 
		   				<?php
			   			if ( $less15>0) {
			   				echo $less15;
			   			}else echo "-"; 
			   			?>
		   			</td>
		   			<td>
		   				<?php
			   			if ( $btn15>0) {
			   			 	echo $btn15;
			   			 }else echo "-"; ?>
		   			</td>
		   			<td>
		   				<?php
			   			if ( $btn60>0) {
			   			 	echo $btn60;
			   			 }else echo "-"; ?>
		   			</td>
		   			<td>
		   				<?php
			   			if ( $mr60>0) {
			   			 	echo $mr60;
			   			 }else echo "-"; ?>
		   			</td>
		   			<td><?php echo $total;  ?></td> 
		   		</tr>
		   		<?php	
		   		if ($det==1) {
              $get_sale = "SELECT * FROM kp_sales WHERE cust_id='$cust_id' AND sale_bal>0  ORDER BY day";
              $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
              while ($o = mysqli_fetch_assoc($get_sale_r)) {
                $sale_id = $o['sale_id'];
                $amount=$o['total_amount']; 
                $day = $o['day'];
                $amount=$o['total_amount'];  
                $user_id=$o['user_id'];
                $datime=$o['datime'];
                ?>
                <tr>
                  <td></td>
                  <td><?php echo $sale_id; ?></td>        
              		<td><?php echo get_user($user_id); ?></td>
                  <td><?php echo $day; ?></td>
              		<td><?php echo $datime; ?></td>        
                  <td><?php echo $amount; ?></td> 
                  <td></td>
                </tr>
                      <?php  }  
            } 
		   		}
		   	}
		   	?>
		   	<tfoot>
		   		<tr>
		   			<th colspan="2" class="text-center">Total Amount</th>
		   			<th><?php echo $t15; ?></th>
		   			<th><?php echo $t30; ?></th>
		   			<th><?php echo $t60; ?></th>
		   			<th><?php echo $tmore; ?></th>
		   			<th><?php echo $t15+$t30+$t60+$tmore; ?></th>
		   		</tr>
		   	</tfoot>
		   	<?php
		   }
		   ?>
		 	</tbody>
		 </table>
		</div>
	</div>                  
