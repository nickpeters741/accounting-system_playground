
<?php
include('../clude/head.php'); 
$no=0; 
$folder="back/take/"; 
thesion_page($folder);
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
 
?>
 
<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
    
  ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
  <?php 
    require("../clude/menu.php");
  ?>
  <!-- end #sidebar -->
        <!-- begin #content -->
        <div id="content" class="content">
            <!-- begin row -->
            <div class="row" >
         
                <!-- begin col-8 -->
                <div class="col-md-8">
                    <div class="panel panel-success" data-sortable-id="index-1" style="margin-top: 10px;">
                        <div class="panel-heading">
                            <div class="pull-right"> 
                            <a href="init_page.php?st=1" class="btn btn-lime btn-xs" >START TAKE</a>
              </div>
                            <h4 class="panel-title">HELD/CONTINUING STOCK TAKE</h4> 
                        </div>                       
                        <div class="panel-body">
                            <table class="table table-bordered" style="text-align: left; padding: 2px;">
      <thead>
          <tr>
              <th>Day</th>
              <th>Take User</th> 
              <th>Action</th>
              
          </tr>
      </thead>
      <tbody>
      <?php
      
      $get_items = mysqli_query($connection,"SELECT * FROM kp_stock_take_status") or die("Error fetching items count.:".mysqli_error($connection));
      while ($row = mysqli_fetch_assoc($get_items)) {
        $day = $row['day'];
        $id = $row['stat_id'];
        $take_status=$row['take_status'];
        $user_id=$row['user_id'];
          if ($take_status==3) {
          $take="UNHOLD";
         }elseif($take_status==2){
            $take="CONTINUE";
         }

        ?>
        <tr>
              <td><?php echo $day; ?></td>
              <td><?php echo get_user($user_id); ?></td> 
              <td>
                <a href="init_take.php?id=<?php echo $id; ?>&day=<?php echo $day; ?>&st=2" class="btn btn-warning btn-xs" ><?php echo $take; ?></a>
              </td>
          </tr>
        <?php
      } 

       ?>                                 
      </tbody>
  </table>
 
                         

                        </div>
                    </div>
                </div>
                <!-- end col-8 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end #content -->
      

    </div> 
    <!-- end #page-container -->
<?php include('../clude/foot.php') ?>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>   
<script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript">

$(document).ready(function() { 
  App.init();   
}); 
</script>  
</body>
</html>
