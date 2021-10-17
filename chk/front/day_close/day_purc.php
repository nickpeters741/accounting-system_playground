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
            <th colspan="<?php echo 6; ?>" style="font-size: 19px;"><b><?php echo $day;?>  PURCHASES REPORT</b></th>
          </tr>
          <tr>
            <th>Receipt No:</th> 
              <th>Customer</th>
              <th>Served By</th>
              <th>Time</th>  
              <th>Total</th>                     
              <th class="hidden-print">Action</th>
          </tr>
      </thead>
      <tbody>
              <?php 
 
         $sales = mysqli_query($connection,"SELECT * FROM kp_po  WHERE  po_date='$day'");
         if (mysqli_num_rows($sales) < 1) {
          ?>
          <tr>
            <td colspan="9">
            
          <div class="alert alert-warning">
            <p>There are no recorded sales</p>
          </div>  
            </td>
          </tr>
          <?php
         }else{
          while ($sa = mysqli_fetch_assoc($sales)) {
            $po_id = $sa['po_id'];
            $sup_id = $sa['sup_id'];
            $user_id = $sa['user_id'];  
            
            $datime = date_create($sa['datime']);
            $amount=$sa['amount'];
            $sum=$sum+$amount; 
          ?>
            <tr ondblclick="view(<?php echo $po_id; ?>)">
              <td><?php echo $po_id; ?></td> 
              <td><?php echo get_sup($sup_id); ?></td>                  
              <td><?php echo get_user($user_id); ?></td>
              <td><?php echo date_format($datime, "H:i:s"); ?></td> 
              <td><?php echo $amount; ?></td>
              <td class="hidden-print"> 
                <button onclick="po_items(<?php echo $po_id; ?>)"  ><i class='fa fa-edit' ></i></button>
              </td>

            </tr>
             

          <?php 
          }
          ?> 
            <tr>
              <th colspan="4" class="text-center">Total Amount</th> 
              
              <th><?php echo $sum; ?></th>
              <th class="hidden-print"></th>
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
                        
 








