<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
$user_id = $_SESSION['user_id']; 
$name = $_REQUEST['name'];
$phone = $_REQUEST['phone'];
$loc = $_REQUEST['loc'];
$nid = $_REQUEST['nid'];
	 
	if (empty($name) &&empty($phone)) {
		?>
		<script type="text/javascript">
		$.gritter.add({
	        title: 'EMPTY FIELDS!',
	        text: 'Fields Cannot be Empty. ',
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
		$get_beba = mysqli_query($connection,"SELECT * FROM kp_beba WHERE nid=".$nid) or die(mysqli_error($connection)); 
		if (mysqli_num_rows($get_beba)>1) {
			?>
			<script type="text/javascript">
				$.gritter.add({
			        title: 'ALREADY IN OUR DATABASE!!!',
			        text: 'You Cant add an existing Logistics Personel. ',
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

			$create_beba = mysqli_query($connection,"INSERT INTO kp_beba(name,phone,nid,location) VALUES('$name','$phone','$nid','$loc')") or die("Error creating beba");
	  
		if (!$create_beba) {
			?>
			<script type="text/javascript">
				$.gritter.add({
		        title: 'ADDING ERROR!!!',
		        text: 'Contact Administrator. ',
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
			?>
			<script type="text/javascript">
		$("#sale-day").text('<?php echo $day; ?>');
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
	    $('#modal').modal('toggle');
	</script>
		<?php
		
		}
	 }
}
?>