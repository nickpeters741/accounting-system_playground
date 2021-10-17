<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$total=0;
$day=$_REQUEST['day'];  


?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div id="modal-loader" style="display: none; text-align: center;"></div>
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
      <thead>
          <tr>
            <th colspan="3" style="font-size: 19px;"><b><?php echo $day;?> ITEMS RETuRNED REPORT</b></th>
          </tr>
          <tr>
            <th>ITEM:</th> 
              <th>QTY</th>   
              <th>Total Amount</th>             
          </tr>
      </thead>
      <tbody>
              <?php  
         $sales = mysqli_query($connection,"SELECT * FROM kp_ret_items  WHERE  app_date='$day' ");
         if (mysqli_num_rows($sales) < 1) {
          ?>
          <tr>
            <td colspan="3">
            
          <div class="alert alert-warning">
            <p>There are no Purchased Items</p>
          </div>  
            </td>
          </tr>
          <?php
         }else{
          while ($sa = mysqli_fetch_assoc($sales)) {
            $po_id = $sa['po_id'];  
            $item_id = $sa['item_id'];  
            $datime = date_create($sa['datime']);
            $amount=$sa['total'];
            $sum=$sum+$amount; 
          ?>
            <tr>
              <td><?php echo get_item($item_id); ?></td> 
              <td><?php echo $sa['qty']; ?></td>                  
              <td><?php echo $sa['total']; ?></td>
               
            </tr>
             

          <?php 
          }
          ?> 
            <tr>
              <th colspan="2" class="text-center">Total Amount</th> 
              
              <th><?php echo $sum; ?></th> 
            </tr> 
          <?php
         }
         ?>
      
        </tbody>
      

          </table>
      
    </div>
  </div>
</div> 
                        
      <script type="text/javascript">
        function po_items(id){
  $('#modal').modal('show');
  $.ajax({
    url: 'po_items.php',
    typr: 'POST',
    data: 'id='+id,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html('');
    $('#load').html(data);
})
.fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
}
      </script>
                        
 








