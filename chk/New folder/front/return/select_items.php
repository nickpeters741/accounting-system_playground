<?php 
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');

$user_id=$_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$ret_id = $row['ret_id'];   
$stotal=0;
 ?> 
<table  class="table ">
  <thead> 
    <tr>  
    <!--   <th>Imei</th> -->
      <th>Name</th> 
      <th>Qty</th>
      <th>Price</th>
      <th>Total</th>   
      <th>Action</th>  
      <!-- <th>Approve</th> -->
    </tr>
  </thead>
  <tbody>
    <?php
    $get_items = mysqli_query($connection,"SELECT * FROM kp_ret_items WHERE ret_id='$ret_id'") or die(mysqli_error($connection));
    while ($row = mysqli_fetch_assoc($get_items)) { 
      $item_id = $row['item_id'];
      $qty=$row['qty'];
     // $imei=$row['imei'];
      $price=$row['price'];
      $total=$qty*$price;
      $stotal=$stotal+$total;
      $ret_status=$row['ret_status'];
    ?>
    <tr>
  <!--     <td><?php echo $imei; ?></td> -->
      <td><?php echo get_item($item_id); ?></td>
      <td><?php echo $qty; ?></td>
      <td><?php echo $price; ?></td>
      <td><?php echo $total; ?></td>  
      <td>
        <?php if ($ret_status==3) {
          ?>
          APPROVED
          <?php
        }else{
          ?>
        <a onclick="del_ret_this(<?php echo $item_id; ?>)" ><i class="fa fa-trash"></i></a>
         <?php
        }
        ?>
      </td>
      
    </tr>
    <?php
    }
    ?>
  </tbody> 
            <tfoot>
              <tr>
                <th colspan="3" class="text-center" style="color: black; font-size: 20px;">Total</th>
                <th style="color: black; font-size: 20px;"><?php echo $stotal; ?></th>
                <th></th>
              </tr>
            </tfoot>
          </table>
      
<script type="text/javascript">
  $(document).ready(function(){ 
    $(document).on('click','#app-ret', function(e){ 
        $.ajax({
            url: 'app_ret.php',
            typr: 'POST',
            data: '',
            dataType: 'html'
        })
        .done(function(data){
          $('#ret-load').html(''); // blank before load.
          $('#ret-load').html(data);
        })
        .fail(function(){
          $('#ret-load').html('<i class="fa  fa-info-sign"></i> Something went wrong.....');
          $('#modal-loader').hide();
        }); 
      }); 
    });
</script> 