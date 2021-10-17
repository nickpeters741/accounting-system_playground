<?php
$pur_sum=0;
$purchase = mysqli_query($connection,"SELECT * FROM kp_po WHERE ord_date='$today'") or die('Error fetching the purchases.:'.mysqli_error($connection));
if (mysqli_num_rows($purchase) < 1) {}else{
      ?>       
 <table class="table">
  <thead>
    <tr>
      <td colspan="5"><B><?php echo $today; ?> END OF DAY PURCHASES SUMMARY</B></td>
    </tr>
    <tr>
      <th>Supplier</th>
      <th>PO. No</th>
      <th>PO By</th>
      <th>Status</th>
      <th>Amount</th>
    </tr>
  </thead>
  <tbody> 
    <?php
    while ($pow = mysqli_fetch_assoc($purchase)){
          $po_by = $pow['ord_user'];
          $sup_id = $pow['sup_id'];
          $po_id  = $pow['po_id'];
          $r_status = $pow['rec_status'];
          $amount = $pow['amount']; 
          $pur_sum=$pur_sum+$amount;
        ?>
      <tr>
        <td><?php echo get_sup($sup_id); ?></td>
        <td><?php echo $po_id; ?></td>
        <td><?php echo get_user($po_by); ?></td>
        <td><?php if ($r_status==1) { echo "RECEIVED"; } else{ echo "PENDING"; } ?></td>
        <td><?php echo $amount; ?></td>
      </tr>
      <?php
          } 
       
      ?> 
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4">TOTAL</td>
        <td><?php echo $pur_sum;?></td>
      </tr>
    </tfoot>
    
  </table> 
<?php
}
?>