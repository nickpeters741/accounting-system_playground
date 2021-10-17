</br>
<?php
$no=0;
$sum=0; 
$req_items = mysqli_query($connection ,"SELECT * FROM kp_sale_payment WHERE pay_date= '$today' AND type=2") or die(mysqli_error($connection));
if (mysqli_num_rows($req_items) < 1) {
  // echo "There are no items on this order";
}else{
  ?>
  <table class="table"  style="width: 98%;">
    <thead>
      <tr>
        <th colspan="7"><?php echo $today; ?> CREDIT SALES PAYMENT REPORT</th>
      </tr>
      <tr> 
        <td><b>No</b></td> 
        <td style="word-wrap: break-word; width: 30%"><b> Sale id</b></td> 
        <td><b>Amount Paid</b></td> 
        <td><b>M.O.P</b></td>
        <td><b>Customer</b></td> 
      </tr>
    </thead>
      <tbody>
        <?php 
          while ( $data = mysqli_fetch_assoc($req_items)) {
            $sale_id= $data['sale_id'];
            $pay_id= $data['pay_id']; 
            $amount = $data['paid_total']; 
            $cust_id = $data['cust_id'];
            $no=$no+1;
            $sum=$sum+$amount
 
        ?>
        <tr class="row-item">
          <td><?php echo $no; ?></td>
          <td><?php echo $sale_id; ?></td>
          <td ><?php echo number_format($amount,2); ?></td>   
          <td ><?php echo rtrim(cred_mop($pay_id), ',');; ?> </td>

          <td > <?php  echo strtoupper(get_cust($cust_id));   ?> </td> 
        </tr>
        <?php 
      }
   ?>
    <tr>
      <td colspan="2">TOTAL</td>
      <td><?php echo $sum; ?></td>
      <td colspan="4"> </td>
    </tr>
 </tbody>
 </table>
<?php 
      }  ?>
