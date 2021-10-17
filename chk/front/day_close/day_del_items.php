<?php 
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
$total=0;
$day=$_REQUEST['day'];  


?>
<div class="modal-content"> 
  <div class="modal-body">      
    <div class="table-responsive">
      <table class="table table-bordered table-striped">
       <thead>
        <tr>
          <th colspan="5"><h1><b><?php echo $day;?> VOIDED SALES REPORT</b></h1></th> 
        </tr>
        <tr>
          <th>Receipt No:</th> 
          <th>Served By</th> 
          <th>Total</th>                  
          <th class="hidden-print">Action</th>
        </tr>
      </thead>
      <tbody>
        <?php 
        $sales = mysqli_query($connection,"SELECT amount,user_id,sale_id FROM kp_del_orders WHERE del_day='$day' GROUP BY sale_id ORDER BY sale_id DESC");
        if (mysqli_num_rows($sales) < 1) {
          ?>
          <div class="alert alert-warning">
            <p>There are no recorded sales</p>
          </div>
          <?php
        }else{
          while ($sa = mysqli_fetch_assoc($sales)) {
            $sale_id = $sa['sale_id']; 
            $user_id = $sa['user_id'];
            $amount=$sa['amount'];
            $sum=$sum+$amount; 
            ?>
            <tr>
              <td><?php echo $sale_id; ?></td>                  
              <td><?php echo get_user($user_id); ?></td> 
              <td><?php echo $amount; ?></td>
              <td class="hidden-print"> 
                <button data-toggle="modal" data-target="#edit_item" data-id="<?php echo $sale_id; ?>" id="getItem" ><i class='fa  fa-edit' ></i></button>
              </td>
            </tr>
            <?php 
          }
          ?>
          <tfoot>
            <tr>
              <th colspan="2" class="text-center">Total Amount</th> 
              <th><?php echo $sum; ?></th>
            </tr>
          </tfoot>
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
                        
 








