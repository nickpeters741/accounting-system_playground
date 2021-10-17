<?php
session_start();
include('../../inc/connection.php'); 

include('../clude/funcs.php');

$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);

$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);

 

?>

 <div>

<table id="data-table-combine" class="table table-striped table-bordered">

						  

<thead>

	<tr class="text-center ">

		<td colspan="8" style="border-top: 2px solid #000;">

      <h3>

        <b><U>ITEMS SUMMARY FROM <?PHP echo $start_date;?> to <?php echo $end_date;?></U></b>

      </h3>

    </td>

	</tr>

  <tr>

    <th style="width: 15px;">No.</th>

  	 <th style="width: 250px;">Item Name:</th>

     <th style="width: 20px;">Cash Qty</th>

  	 <th style="width: 20px;">Credit Qty</th> 

     <th style="width: 20px;">Total Qty</th>

  	 <th style="width: 50px;">Cash Amount:</th>

     <th style="width: 50px;">Credit Amount:</th>

     <th style="width: 50px;">Total Amount</th>   

  </tr>

</thead>

<tbody>

<?php



$get_id = mysqli_query($connection,"SELECT item_id FROM kp_items") or die("Error fetching items.".mysqli_error($connection));

if (mysqli_num_rows($get_id) < 1) {

	?>

	<div class="alert alert-warning">

		<p>There are no ite sales</p>

	</div>

	<?php

}else{

  $totalcr=0;

  $totalcs=0;

  $total=0;

  $no=0;

while ($sa = mysqli_fetch_assoc($get_id)) {

		$item_id = $sa['item_id'];



$item_sum = mysqli_query($connection,"SELECT SUM(total) AS sum_cash,SUM(qty) AS cs_qty FROM kp_sale_items

WHERE item_id = '$item_id' AND type=1 AND   day BETWEEN '$start_date' AND '$end_date' ") or die("Error fetching the number of sales.:".mysqli_error($connection));

$un = mysqli_fetch_assoc($item_sum);

$sumc = $un['sum_cash'];

$sumcqty = $un['cs_qty'];  



$item_cred = mysqli_query($connection," SELECT SUM(total) AS sum_cred,SUM(qty) AS cr_qty FROM kp_sale_items

WHERE item_id = '$item_id' AND type=2 AND day BETWEEN '$start_date' AND '$end_date'") or die("Error fetching the number of sales.:".mysqli_error($connection));

$cr = mysqli_fetch_assoc($item_cred);

$sumcr = $cr['sum_cred'];

$sumcrqty = $cr['cr_qty']; 



$totalcs=$totalcs+$sumc;

$totalcr=$totalcr+$sumcr;

$total=$total+$sumc+$sumcr;

$no=$no+1;

 



if ($sumcrqty==0 && $sumcqty==0) {

   

}else{

    ?>

		<tr ondblclick="item_hist(<?php echo $item_id; ?>,'<?php echo $start_date; ?>','<?php echo $end_date; ?>')">

      <td><?php echo $no; ?></td>

			<td><?php echo get_item($item_id); ?></td>

			<td><?php echo $sumcqty; ?></td>

			<td><?php echo $sumcrqty; ?></td>

      <td><?php echo $sumcqty+$sumcrqty; ?></td>

      <td><?php echo $sumc; ?></td>

      <td><?php echo $sumcr; ?></td>

			<td><?php echo $sumc+$sumcr; ?></td> 

    </tr>

		<?php

  }	

	}

}

?>



<tr>

  <td>TOTAL</td>

  <td colspan="4"></td>

  <td><?php echo $totalcs; ?></td>

  <td><?php echo $totalcr; ?></td>

  <td><?php echo $total; ?></td>

</tr>



</tbody>

</table>

</div>

