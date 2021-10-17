<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php'); 
$user_id = $_SESSION['user_id']; 
$po_id = $_REQUEST['id']; 
$no=0;
$total=0;
?>
<style type="text/css">
  .qty{  
    border: 0;
    min-width: 15%;
    width: auto;
    border: 1px solid #efefef;
    text-align: center;
    border: 1px solid #d3d8de;
    box-shadow: none;
    font-size: 12px;
    line-height: 1.42857143;
    height: 25px;
    padding: 6px 12px;
  }
</style>
<div class="modal-content">
  <div class="modal-header"> 
    <h4 class="modal-title"> <i class="glyphicon glyphicon-user"></i>ITEM IN PURCHASE NO: <?php echo $po_id; ?></h4> 
  </div> 
  <div class="modal-body">  
    <table class="table table-bordered" id="TheSo">
      <thead>
        <tr>
          <th>No:</th>
          <th>Item Name</th>
          <th>Quantity</th> 
          <th>Price</th> 
          <th>Discount</th> 
          <th>Amount</th>           
        </tr>
      </thead>
      <tbody>
        <?php 
        $requisitions = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE  po_id='$po_id'") or die(mysqli_error($connection));
        while ($row = mysqli_fetch_assoc($requisitions)) {
          $item_id = $row['item_id']; 
          $no=$no+1;
          $amount=$row['total'];
          $total=$total+$amount;
        ?>
        <tr>
          <td><?php echo $no; ?></td>
          <td><?php echo get_item($item_id); ?></td>
          <td><?php echo $row['qty']; ?></td> 
          <td><?php echo $row['price'];  ?></td>
          <td><?php echo $row['disc']; ?></td>
          <td><?php echo $amount ?></td>  
        </tr>
      </tbody>
      <?php
    }
    ?>
    <tfooter>
      <tr style="font-size: 18px;">
        <th colspan="5" class="text-center">TOTAL</th>
        <th id="ttt"><?php echo $total ?></th> 
      </tr>
    </tfooter>
  </table>
</div>
</div>
