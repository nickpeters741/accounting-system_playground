<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id = $_SESSION['user_id'];
$day = $_REQUEST['day']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];

 if (empty($day) OR $day==0 ) {
?> 
<script type="text/javascript">
	$.gritter.add({
        title: 'EMPTY DATE!',
        text: 'The Date Cannot be Empty. ',
        sticky: false, 
        class_name: 'gritter-light',
        before_open: function() {
          if($('.gritter-item-wrapper').length === 4) {
            $.gritter.removeAll(); //return false;
          }
        }
      });   
</script>
<?php
}else{   
	$update = mysqli_query($connection,"UPDATE kp_po_status SET day='$day' WHERE po_id='$po_id'") or die("Could not update po status");
	$update = mysqli_query($connection,"UPDATE kp_thesion SET day='$day' WHERE user_id='$user_id'") or die("Could not update thesion");
	if (!$update) {
	?>
	<script type="text/javascript">
		$.gritter.add({
        title: 'UPDATE ERROR!!!',
        text: 'Contact Administrator or receiving this error. ',
        sticky: false, 
        class_name: 'gritter-light',
        before_open: function() {
          if($('.gritter-item-wrapper').length === 4) {
            $.gritter.removeAll(); //return false;
          }
        }
      }); 
	</script>
    <?php
	}else{
		$_SESSION['cust_id']=$cust_id;
		$action="CHANGED|-|-|-|PURCHASE DATE TO |". $day;
		logs($action,"../../"); 
	}
	?>
	<script type="text/javascript">
		$("#po-date").text('<?php echo $day; ?>');
		$.gritter.add({
      title: 'Successful',
      text: 'Date Successfully Changed . ',
      sticky: false, 
      class_name: 'gritter-success',
      before_open: function() {
        if($('.gritter-item-wrapper').length === 4) {
          $.gritter.removeAll(); //return false;
        }
      }
    }); 
		// var hulla = new hullabaloo();
	 //    hulla.send('Success!!! Customer updated successfully', "success");  
	    $('#modal').modal('toggle');
	</script>
  <?php
	}
	?>