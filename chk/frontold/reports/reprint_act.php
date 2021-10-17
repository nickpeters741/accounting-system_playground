<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$pin = $_REQUEST['name'];
$sale_id = $_REQUEST['sale_id'];

$user_id=$_SESSION['user_id'];

$today=date("Y-m-d");

$type=sale_type($sale_id);

 if (empty($_REQUEST['name'])) {
?> 
<script type="text/javascript">
	$("#error-name").html("Password can't be empty!!!!!Trials are documented too");
	$("#error-name").show();
</script>
<?php
}else{  
	if (!front_perm($pin,2)) {
	?><div class="alert alert-danger">
            <h4><b>Wrong Passcode!! Trials are documented.</b></h4>
        </div>
        <?php
	}else{ 
		$appr_by=user_id($pin);
        //track delete
        $insert_reprint= mysqli_query($connection,"INSERT INTO kp_sale_reprint(sale_id,user_id,appr_by,day) VALUES('$sale_id','$user_id','$appr_by',CURRENT_DATE)") or die('Error creating delete history'.mysqli_error($connection));
 
 if ($type==1) {
 	?>
<script type="text/javascript"> 
window.location.href = "../print/print_credit.php?id="+'<?php echo $sale_id; ?>';
</script>
<?php
 }else{
 	?>
<script type="text/javascript"> 
window.location.href = "../print/print_credit.php?id="+'<?php echo $sale_id; ?>';
</script>
<?php
 }

 }
}
?>
