<?php 
include("../../inc/connection.php");
include("../../inc/gen_funcs.php"); 
$amount = $_REQUEST['amount'];
$from = $_REQUEST['from'];
$to = $_REQUEST['to'];
$pin = $_REQUEST['pin'];
 if (empty($_REQUEST['amount'])) {
 	$action="TRIED EMPTY PASSWORD FOR|-|-|-|BANK TRANSFER".get_bank($from);
    logs($action,"../../");
?> 
	<script type="text/javascript">
		$("#error-name").html("Password can't be empty!!!!!Trials are documented too");
		$("#error-name").show();
	</script>
<?php
}else{  
	if (!front_perm($pin,8)) {
		$action="TRIED PASSWORD WITH|-|-|-|NO BANK TRANSFER RIGHTS"; 
	?><div class="alert alert-danger">
            <h4><b>Wrong Passcode!! Trials are documented.</b></h4>
        </div>
        <?php
	}else{

		$transfer = mysqli_query($connection,"UPDATE kp_banks SET bal=bal-'$amount' WHERE bank_id='$from'") or die("Could not create a new purchase order number");

		$transfer = mysqli_query($connection,"UPDATE kp_banks SET bal=bal+'$amount' WHERE bank_id='$to'") or die("Could not create a new purchase order number");
		
		$transa="TRANSFERED MONEY TO ".get_bank($to);
		$bal_from=bank_bal($from);
		$from_transfer_track= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$from','$transa','$amount','$user_id','$bal_from',CURRENT_DATE)") or die(mysqli_error($connection));

		$transa="RECEIVED MONEY FROM ".get_bank($from);
		$bal_to=bank_bal($to);
		$to_transfer_track= mysqli_query($connection,"INSERT INTO kp_bank_hist(bank_id,transaction,amount,user_id,bank_bal,day) VALUES('$to','$transa','-$amount','$user_id','$bal_to',CURRENT_DATE)") or die(mysqli_error($connection));
?> 
<script type="text/javascript">
	var from='<?php echo $from; ?>';
	var to='<?php echo $to; ?>';
	var bal_from='<?php echo $bal_from; ?>';
	var bal_to='<?php echo $bal_to; ?>';
	
	document.getElementById('<?php echo "bank".$from; ?>').innerHTML = '<?php echo $bal_from; ?>';
	document.getElementById('<?php echo "bank".$to; ?>').innerHTML = '<?php echo $bal_to; ?>';

	$('#modal2').modal('toggle');
	$('#modal').modal('toggle');
	// $('#bank'+from).html(bal_from); 
	// $('#bank'+to).modal(bal_to);   
    var hulla = new hullabaloo();
    hulla.send('TRANSFERE SUCCESSFULLY', "success");
</script>
<?php
}
}
?>
