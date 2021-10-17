<?php
include('../../inc/connection.php');
include('funcs.php');
$sup_name =$_REQUEST['name'];
$sup_phone = $_REQUEST['sup_phone'];
$sup_id = $_REQUEST['sup_id'];
$sup_email = $_REQUEST['sup_email'];
$sup_address = $_REQUEST['sup_address'];
$sup_pin = $_REQUEST['sup_pin'];
$sup_vat = $_REQUEST['sup_vat'];
$st = $_REQUEST['st'];
if (empty($sup_name)) {
	?>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert">&times;</a>
		<strong>Warning!</strong> Please Fill All The Fields.
	</div>
	<?php
	}else{ 
		$new_sup = "INSERT INTO kp_suppliers(sup_id,sup_name,sup_address,sup_email,sup_phone,sup_location,sup_pin,sup_vat) VALUES('$sup_id','$sup_name','$sup_address','$sup_email','$sup_phone','$sup_location','$sup_pin','$sup_vat')";
		$new_sup_r = mysqli_query($connection,$new_sup) or die(mysqli_error($connection));
		if (!$new_sup_r) {
			$action="FAILED TO CREATE NEW SUPPLIER| ";
			$url="../../";
			logs($action,$url); 
			?>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<strong>Failed!</strong> Adding Added.
			</div>
			<?php
		}else{  
			$action="NEW SUPPLIER ADDED SUCCSESSFULLY| ".$sup_name;
			$url="../../";
			logs($action,$url); 
			if ($st==1) {
				?>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a><strong>Success!</strong> Successfully Added.</div>
				<script type="text/javascript">
				window.setTimeout(function(){
				window.location.href = '../sup/sup.php';
			}, 100);
		</script>
		<?php
			}else{
				?>
				<script type="text/javascript">
					$('#modal2').modal('toggle');
					$.fn.get_sup();
					var hulla = new hullabaloo();
				    hulla.send('Supplier Added Successfully', "success");
				</script>
				<?php
			}
			
	}
}

?>
