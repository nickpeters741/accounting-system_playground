<?php
include('../../inc/connection.php');
$name = strtoupper($_REQUEST['name']);
$desc = strtoupper($_REQUEST['desc']);
$code = strtoupper($_REQUEST['code']);
$st =  $_REQUEST['st'];
if (empty($name)) {
	?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a>
		<strong>Warning!</strong> Please Fill All The Fields.
	</div> 
	<?php
}else{
	$new_cat = "INSERT INTO kp_category(name,cat_description,code) VALUES('$name','$desc','$code')";
	$new_cat_r = mysqli_query($connection,$new_cat) or die(mysqli_error($connection));
	if (!$new_cat_r) {}else{ 
		?>
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Success!</strong> Successfully Added.
		</div>
		<?php
		if ($st==1) {
			?>
		<script type="text/javascript">
			window.setTimeout(function(){
				window.location.href = '../cat/cat.php';
			}, 100);
		</script>
		<?php
		}else{
			?>
			<script type="text/javascript">
				$('#modal2').modal('toggle');
				var hulla = new hullabaloo();
			    hulla.send('Category Added Successfully', "success");
			</script>
			<?php
		}
	}
}

?>
