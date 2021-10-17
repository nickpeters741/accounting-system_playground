<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$cust_id = mysqli_real_escape_string($connection,$_GET['cust']); 
$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);
$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);

$bal=0;
?>
<table class="table table-bordered">
<thead>
	<tr>
		<th colspan="11" class="text-center" ><h3><b style="color:purple;text-transform: uppercase"><?php echo get_cust($cust_id);?> STATEMENT FROM <?PHP echo $start_date;?> TO <?php echo $end_date;?></b></h3></th> </tr>
  <tr>
    <th style="width: 5%;" >No:</th>
    <th style="width: 10%;" >Date & Time</th>
     <th style="width: 10%;" >Date</th>
     <th style="width: 30%;">Transaction</th>   
  	 <th  style="width: 10%;">Transaction id</th> 
     <th  style="width: 10%;">Served By</th>
    <!--  <th style="width: 10%;">Debit Amount</th> -->
     <th style="width: 10%;">Amount</th> 
     <th style="width: 10%;">Balance</th>
     <!--  <th style="width: 20%;" class="hidden-print">Action</th>   -->    
  </tr>
</thead>
<tbody>
<?php  // Specify the start date. This date can be any English textual format  
$date_from = $start_date;   
$date_from = strtotime($date_from); // Convert date to a UNIX timestamp  
  
// Specify the end date. This date can be any English textual format  
$date_to = $end_date;  
$date_to = strtotime($date_to); // Convert date to a UNIX timestamp  
//echo "SELECT sale_id as id ,user_id,sale_amount,day,datime FROM kp_sales  WHERE cust_id='$cust_id'  AND day BETWEEN '$start_date' AND '$end_date'";
$sales = mysqli_query($connection,"SELECT sale_id as id ,user_id,sale_amount as amount,day,datime,cumulative_bal as cf_bal,1 AS type FROM kp_sales  WHERE cust_id='$cust_id'  AND day BETWEEN '$start_date' AND '$end_date'");
$multiarray = array();
while ($result = mysqli_fetch_assoc($sales)){
  $year = 'sales';
  $multiarray[] = $result;
}

$ret = mysqli_query($connection,"SELECT ret_id as id,ret_user as user_id,ret_amount as amount,ret_date as day,ret_datime as datime,cf_bal,2 AS type FROM kp_ret  WHERE cust_id='$cust_id'  AND ret_date BETWEEN '$start_date' AND '$end_date'") or die(mysqli_error($connection)); 
while ($ret_result = mysqli_fetch_assoc($ret)){
  $year = 'ret';
  $multiarray[] = $ret_result;
} 
$note = mysqli_query($connection,"SELECT note_id as id,kp_note.user_id,amount,date as day,kp_note.datime,0 as cf_bal,4 AS type FROM kp_note INNER JOIN kp_sales on kp_note.sale_id=kp_sales.sale_id  WHERE kp_sales.cust_id='$cust_id'  AND date BETWEEN '$start_date' AND '$end_date'"); 
while ($note_result = mysqli_fetch_assoc($note)){
  $year = 'note';
  $multiarray[] = $note_result;
}

$cred_pay = mysqli_query($connection,"SELECT pay_id as id,user_id,amount_paid as amount,day,datime,cumulative_bal as cf_bal,3 AS type FROM kp_sale_cred_pay_hist  WHERE cust_id='$cust_id'  AND day BETWEEN '$start_date' AND '$end_date'");
//$multiarray = array();
while ($ret_result = mysqli_fetch_assoc($cred_pay)){
  $year = 'cred_pay';
  $multiarray[] = $ret_result;
}

$get_kuot = mysqli_query($connection,"SELECT qt_id as id,user_id,amount,day,datime,cf_bal,5 AS type FROM kp_qt  WHERE cust_id='$cust_id'  AND day BETWEEN '$start_date' AND '$end_date'");
//$multiarray = array();
while ($quote_result = mysqli_fetch_assoc($get_kuot)){
  $year = 'QUOTE';
  $multiarray[] = $quote_result;
}

$get_sc = mysqli_query($connection,"SELECT sc_id as id,user_id,amount,day,datime,cf_bal,6 AS type FROM kp_sc_hist  WHERE cust_id='$cust_id'  AND day BETWEEN '$start_date' AND '$end_date'");
//$multiarray = array();
while ($sc_result = mysqli_fetch_assoc($get_sc)){
  $year = 'store_cred';
  $multiarray[] = $sc_result;
}

array_multisort( array_column($multiarray, "datime"), SORT_ASC, $multiarray);

//print_r($multiarray);
 $no=0;
foreach ($multiarray as $mark){
  if ($mark['type']==1) {
          $color="#faf98a";
        }elseif ($mark['type']==2) {
          $color="#c3dfc3";
        }elseif ($mark['type']==3) {
          $color="#1ae4f8";
        } elseif ($mark['type']==3) {
          $color="GRAY";
        }elseif ($mark['type']==4) {
          $color="silver";
        }elseif ($mark['type']==5) {
          $color="gold";
        }elseif ($mark['type']==6) {
          $color="#b3f81a";
        } 

        $no=$no+1; 
    ?>
    <tr style="background-color: <?php echo $color; ?>;font-weight: bolder;" ondblclick="<?php 
              if ($mark['type']==1) {
                echo "sale(".$mark['id'].")";
              }elseif ($mark['type']==2) {
                echo "ret(".$mark['id'].")";
              }elseif ($mark['type']==3) {
                echo "credit_pay()";
              }elseif ($mark['type']==4) {
                echo "note()";
              }elseif ($mark['type']==5) {
                echo "quote(".$mark['id'].")";
              } elseif ($mark['type']==6) {
                echo "sc(".$mark['id'].")";
              }  
        ?> " >
      <td><?php echo $no; ?></td>
      <td><?php echo $mark['datime']; ?></td>
      <td><?php echo $mark['day']; ?></td>
      <td>
        <?php 
        if ($mark['type']==1) {
          $type=sale_type($mark['id']);
          if ($type==2) {
            echo "INVOICE";
          }else{
            echo "RECEIPT";
          }
        }elseif ($mark['type']==2) {
          echo "RETURN";
        }elseif ($mark['type']==3) {
          echo "CREDIT PAY";
        }elseif ($mark['type']==4) {
          echo "NOTE";
        }elseif ($mark['type']==5) {
          echo "QUOTATION";
        } elseif ($mark['type']==6) {
          echo "STORE CREDIT";
        }  
        ?>
      </td>
      <td><?php echo $mark['id']; ?></td>
      <td><?php echo get_user($mark['user_id']); ?></td>
      <td><?php echo $mark['amount']; ?></td>
    <!--   <td><?php echo $mark['amount']; ?></td> -->
      <td><?php echo $mark['cf_bal']; ?></td>
    </tr>
    <?php 
    if ($mark['type']==1) { 
      ?>
      <tr>
        <td colspan="2"></td>
        <td colspan="2">Name</td>
        <td>Quantity</td>
        <td>Price</td>
        <td>Discount</td>
        <td>Total</td>
      </tr>
      <?php
      $sale_id=$mark['id'];
          $get_sale = "SELECT SUM(qty) AS tq,disc,item_id,price FROM kp_sale_items WHERE sale_id='$sale_id' GROUP BY item_id";
          $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
          while ($o = mysqli_fetch_assoc($get_sale_r)) {
            $item_id = $o['item_id'];
            $quantity=$o['tq'];
            $disc=$o['disc']; 
            $price = $o['price']-$disc;
            $amount=$quantity*$price; 

            $get_item_name = "SELECT name,stock_code FROM kp_items WHERE item_id='$item_id'";
            $get_item_name_r = mysqli_query($connection,$get_item_name) or die("Could not get the item id");
            $i = mysqli_fetch_assoc($get_item_name_r);
            $name = $i['name']; 
          ?>
          <tr>
            <td colspan="2"></td>
            <td colspan="2"><?php echo get_item($item_id); ?></td>
            <td><?php echo $quantity; ?></td>
            <td><?php echo $price; ?></td>
            <td><?php echo $disc; ?></td>
            <td><?php echo $amount; ?></td>
          </tr>
          <?php  
          }  
    }elseif ($mark['type']==2) {
      ?>

          <tr>
            <td></td>
            <td>Sale id</td>
            <td colspan="2">Name</td>
            <td>Quantity</td>
            <td>Price</td> 
            <td>Discount</td>
            <td>Total</td> 
          </tr>
      <?php

      $ret_id=$mark['id'];
      $get_sale = "SELECT sale_id,qty,item_id,price,total FROM kp_ret_items WHERE ret_id='$ret_id' GROUP BY item_id";
            $get_sale_r = mysqli_query($connection,$get_sale) or die("Could not fetch the order");
            
            while ($o = mysqli_fetch_assoc($get_sale_r)) {
               $item_id = $o['item_id'];
               
              $quantity=$o['qty']; 
              $price = $o['price'];
              $amount=$o['total']; 
              ?>
              <tr>
                <td></td>
                <td><?php echo $o['sale_id']; ?></td>
                 <td colspan="2"><?php echo get_item($item_id); ?></td>
                 <td><?php echo $quantity; ?></td>
                 <td><?php echo $price; ?></td> 
                 <td> </td> 
                 <td><?php echo $amount; ?></td>
              </tr>
              <?php  }  
    } 
}
 
 // 
   		?>
    
   
</tbody>
</table>
 
 
 
 