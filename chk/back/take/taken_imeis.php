<?php 
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
$item_id = $_GET['id'];  
$no=0;
?>
<table class="table table-bordered" id="TheSo">
  <thead>     <tr>

      <td>No</td>
      <td>IMEI</td>
      <td>STATUS</td>

    </tr>
  </thead>
    <tbody>
        <?php   
            $imeis = mysqli_query($connection,"SELECT * FROM kp_items_imei WHERE  item_id='$item_id' AND take=1") or die(mysqli_error($connection));
            $num=mysqli_num_rows($imeis);

            if ($num<1) {
              ?>
        <tr> 
              <td colspan="3">
              NO IMEIS SCANES
            </td> 
        </tr>  <?php
            }else{
            while ($row = mysqli_fetch_assoc($imeis)) {
              $no=$no+1;
              ?>
        <tr>
           <td><?php echo $no; ?></td> 
          <td><?php echo $row['imei']; ?></td> 
          <td class="text-center">
            <i class="fa fa-check" aria-hidden="true" style="color: lime;"></i>
            <i class="fa fa-check" aria-hidden="true" style="color: lime;"></i>
          </td>
        </tr>  
        <?php
     }
     }
    ?> 
    </tbody>
  
</table>
<script type="text/javascript">
  var qty=<?php echo $num; ?>;
  var item_id=<?php echo $item_id; ?>; 
</script> 