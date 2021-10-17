<table class="table"  style="width: 98%;">
      <thead>
        <tr>
          <th colspan="7"><?php echo $today; ?> CREDIT SALES REPORT</th>
        </tr>
        <tr> 
          <td><b>No</b></td> 
          <td><b>Sale id</b></td>
          <td><b>Customer</b></td>
          <td><b>Amount</b></td>
          <td><b>Amount Paid</b></td>
          <td><b>Balance</b></td>  
        </tr>
      </thead>
      <tbody>
        <?php 
      
          $sum=0; 
          $bal=0;
          $total=0; 
        $req_items = mysqli_query($connection ,"SELECT * FROM kp_sales WHERE type=2 AND day= '$today'") or die(mysqli_error($connection));
        if (mysqli_num_rows($req_items) < 1) {
          echo "<p>There are no recorded CREDIT sales</p>";
        }else{
          while ( $data = mysqli_fetch_assoc($req_items)) {
            $sale_id= $data['sale_id']; 
            $amount = $data['total_amount'];
            $balance = $data['sale_bal'];
            $paid_amount=$amount-$balance;
            $cust_id = $data['cust_id'];
            $no=$no+1;
            $sum=$sum+$amount;
            $bal=$bal+$balance;
            $total=$total+$paid_amount;
 
        ?>
        <tr class="row-item">
          <td><?php echo $no; ?></td>
          <td><?php echo $sale_id; ?></td>
          <td > <?php  echo strtoupper(get_cust($cust_id));   ?> </td>
          <td ><?php echo number_format($amount,2); ?></td>  
          <td ><?php echo number_format($paid_amount,2); ?></td>  
          <td ><?php echo number_format($balance,2); ?></td>    
        </tr>
        <?php 
      }
    }
    ?> 
    <tr>
      <th class="text-center" colspan="3">TOTAL</th>
      <th><?php echo $sum; ?></th>
      <th><b><?php echo $total; ?></b></th>
      <th><?php echo $bal; ?></th> 
    </tr>
  </tbody>

 
  </table>
  </br>