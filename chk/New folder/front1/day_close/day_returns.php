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
          <th colspan="10"><h1><b><?php echo $day;?>  RETURNS REPORT</b></h1></th> 
        </tr>
        <tr>
          <th><b>Return Id</b></th>
          <th><b>Sale Id</b></th>
          <th><b>Customer</b></th>
          <th><b>Return User</b></th>
          <th><b>Return Amount</b></th> 
          <th><b>Approving User</b></th>
          <th><b>Decision</b></th>
          <th><b>Approving Comment</b></th>
          <th><b>Action</b></th> 
        </tr>   
      </thead>
      <tbody> 
      <?php
        $delete = mysqli_query($connection,"SELECT * FROM kp_ret WHERE ret_date='$day'") or die('Error fetching the staff data.:'.mysqli_error($connection));
        if (mysqli_num_rows($delete) < 1) {
         echo "<tr><td colspan='10'><b>No orders have been deleted</b></td</tr>";
        }else{ 
          while ($row = mysqli_fetch_assoc( $delete )) {
            $ret_id = $row['ret_id'];
            $ret_user = $row['ret_user'];
            $appr_by  = $row['app_user'];
            $sale_id = $row['sale_id'];
            $amount = $row['ret_amount']; 
            $decision = $row['app_decision'];
            if ($decision==1) {
                $dec="Store Credit";
            }elseif ($decision==2) {
              $dec="Petty Cash";
            }else{
               $dec="Not Selected";
            } 
            $comment = $row['app_comment']; 
            $cust_id= $row['cust_id'];
            $status= $row['app_status'];
            ?>
          <tr>
            <td><?php echo $ret_id; ?></td>
            <td><?php echo $sale_id; ?></td>
            <td><?php echo get_cust($cust_id); ?></td>
            <td><?php echo get_user($ret_user); ?></td>
            <td><?php echo $amount; ?></td> 
            <td><?php echo get_user($appr_by); ?></td>
            <td><?php echo $dec; ?></td>
            <td><?php echo $comment; ?></td>
            <td class="hidden-print"> 
              <button onclick="ret_items(<?php echo $ret_id; ?>)"  ><i class='fa fa-eye' ></i></button> 
            </td>
          </tr>
          <?php
              }
            }
          ?>
              <!--END DELETED BILLS -->
               </tbody> 
      

          </table>
      
    </div>
  </div>
</div> 
                        
          <script type="text/javascript">
        function ret_items(id){
  $('#modal').modal('show');
  $.ajax({
    url: 'ret_items.php',
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
                  
 








