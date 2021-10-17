<?php
include('../../inc/connection.php');
$name = strtoupper($_REQUEST['name']);
$desc = strtoupper($_REQUEST['desc']);
$cat_id = $_REQUEST['cat'];
$code = strtoupper($_REQUEST['code']);
$st = $_REQUEST['st'];

echo "code=".$code;
	if (empty($name)) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Warning!</strong> Name cannot be empty.
		</div>
		<?php
	}elseif (empty($code)) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Warning!</strong> Code is required.
		</div>
		<?php
	}elseif (empty($cat_id) OR $cat_id==0) {
		?>
		<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Warning!</strong>Make Sure you select the Main Category.
		</div>
		<?php
	}else{
		$new_cat = "INSERT INTO kp_sub_cat(name,sub_desc,code,cat_id) VALUES('$name','$desc','$code','$cat_id')";
		$new_cat_r = mysqli_query($connection,$new_cat) or die(mysqli_error($connection));
		if (!$new_cat_r) {
			$error=mysqli_error($connection);
			if ($st==1) {
				?>
				<div class="alert alert-danger">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Warning!</strong> Sub Category Could not be added!!!!!<?php echo $error; ?>.
		</div>
		<?php
			}else{
				?>
				<script type="text/javascript"> 
					var hulla = new hullabaloo();
				    hulla.send('Sub Category Could not be Added Successfully'+<?php echo $error;?>, "Danger");
				</script>
				<?php
			}
		}else{  
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
				    hulla.send('Sub Category Added Successfully', "success");
				</script>
				<?php
			}
		}
	}

?>
