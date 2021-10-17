<?php
session_start();
include("../../inc/connection.php");
include('../../inc/gen_funcs.php');
if (isset($_POST['staff_id'])) {
  $staff_id = $_POST['staff_id']; 
  $next_name = strtoupper($_POST["next-name"]);
  $next_phone = $_POST['next-phone'];
  $next_address = strtoupper($_POST['next-address']);
  $next_residence = strtoupper($_POST['next-residence']);

  if (empty($next_name) or empty($next_phone)) {
    ?>
    <div class="alert alert-danger">
      <a href="#" class="close" data-dismiss="alert">&times;</a>
      <strong>Warning!</strong> FIll All The Fields.
    </div>
    <script type="text/javascript">
      window.setTimeout(function(){
        window.location.href = 'staff.php';
      }, 100);
    </script>
    <?php
  }else{
    
    $edit_customer = "UPDATE kp_staff SET  staff_kin_name='$next_name',staff_kin_phone='$next_phone',staff_kin_address='next-address',staff_kin_residence='$next_residence' WHERE staff_id='$staff_id' " or die("Error o 25");
      $edit_customer_r = mysqli_query($connection,$edit_customer) or die(mysqli_error($connection));
      if (!$edit_customer_r) { 
        ?>
        <div class="alert alert-danger">
          <a href="#" class="close" data-dismiss="alert">&times;</a>
          <strong>Warning!</strong> Error Editing Customer Details.
        </div>
        <script type="text/javascript">
          window.setTimeout(function(){
            window.location.href = 'staff.php';
          }, 100);
        </script>
        <?php
      }else{
        $action="EDITED|-|-|STAFF DETAILS FOR |".get_staff($staff_id);
        logs($action,"../../");
        ?>
        <div class="alert alert-success">
          <a href="#" class="close" data-dismiss="alert">&times;</a>
          <strong>Warning!</strong> Next of kin Details Successfully Edited.
        </div>
        <script type="text/javascript">
          window.setTimeout(function(){
            window.location.href = 'staff.php';
          }, 100);
        </script>
        <?php
      }
  }
}
?>