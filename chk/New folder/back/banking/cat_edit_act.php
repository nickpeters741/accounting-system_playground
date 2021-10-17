<?php
include('../../inc/connection.php');
if (isset($_REQUEST['name'])) {

	$name =$_REQUEST['name'];
	$cat_id = $_REQUEST['cat_id'];

	if ( empty($name) or empty($cat_id) ) {
		?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Please Fill All The Fields.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
	}else{

		$edit_item = "UPDATE category SET name='$name' WHERE cat_id='$cat_id' " or die("Error edition the file");
		$edit_item_r = mysqli_query($connection,$edit_item) or die("error on 18");
 
	if (!$edit_item_r) {
			?>

		<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Failed!</strong> Failed To Edited.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
		}else{
			?>

		<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Success Edited.</div>
		<script type="text/javascript">
			 window.setTimeout(function(){

                            window.location.href = 'cat.php';

                        }, 100);
		</script>

		<?php
		}
	}

}
?>