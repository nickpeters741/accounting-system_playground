<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$total=0;
$day=today();
$type = $_REQUEST['id']; 
$start_date = mysqli_real_escape_string($connection,$_REQUEST['start_date']);
$end_date = mysqli_real_escape_string($connection,$_REQUEST['end_date']);
$cat_id = $_REQUEST['cat_id']; 
$det = mysqli_real_escape_string($connection,$_REQUEST['det']);   
$sum=0;
?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table"> 
        <thead>
          <tr class="text-center ">
            <td colspan="8" style="border-top: 2px solid #000;">
              <h3>
                <b><U><?php echo  get_column('kp_category','name',"cat_id='$cat_id'"); ?> CATEGORY ITEMS SUMMARY FROM <?PHP echo $start_date;?> to <?php echo $end_date;?></U></b>
              </h3>
            </td>
          </tr>
          <tr>
            <th style="width: 20px;">No.</th>
            <th style="width: 250px;">Item Name:</th>
            <th style="width: 20px;">Total Qty</th>
            <th style="width: 50px;">Total Amount</th>  
            <th style="width: 50px;">Current Stock</th>    
          </tr>
        </thead>
      <tbody>
       <?php
       $no=0;
        $item_sum = mysqli_query($connection,"SELECT kp_sale_items.item_id,SUM(total) AS sum_total,SUM(kp_sale_items.qty) AS tqty,kp_items.qty as stock FROM kp_sale_items INNER JOIN kp_items ON kp_sale_items.item_id=kp_items.item_id INNER JOIN kp_sales ON kp_sales.sale_id=kp_sale_items.sale_id   WHERE cat_id='$cat_id'  AND  kp_sale_items.day BETWEEN '$start_date' AND '$end_date' GROUP BY item_id") or die("Error fetching the number of sales.:".mysqli_error($connection)); 
          while ($un = mysqli_fetch_assoc($item_sum)) {
            $item_t=0;
            $sum_total = $un['sum_total'];
            $item_id = $un['item_id']; 
            $total_sum=$total_sum+$sum_total;
          
            $no=$no+1;  ?>
          <tr>
            <td><?php echo $no; ?></td>
            <td><b><?php echo get_item($item_id); ?></b></td> 
            <td><b><?php echo $un['tqty']; ?></b></td>
            <td><b><?php echo $sum_total; ?></b></td> 
            <td style="color: red;"><b><?php echo $un['stock']; ?></b></td> 
          </tr>
            <?php
          } 

        // }
          ?>
       </tbody>
     </table>
      
    </div>
  </div>
</div> 
                        
      
                        
 








