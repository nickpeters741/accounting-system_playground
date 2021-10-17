<?php

function today(){
	date_default_timezone_set("Africa/Nairobi");
	$today=date("Y-m-d");
	return $today;
}

function  page_restrict(){
	if (!isset($_SESSION['user_id']) OR empty($_SESSION['user_id'])) {
  		header("Location:../../log_out.php");
	}
} 

function sep($nos){
	for ($i=0; $i <$nos ; $i++) {
		echo "*"; 
	}
}

//ids///
function pay_id(){ 
	global $connection;
	$get_id=mysqli_query($connection,"SELECT pay_id FROM kp_pay_id");
	if (mysqli_num_rows($get_id) > 0) {
		$create_pay = mysqli_query($connection,"UPDATE kp_pay_id SET pay_id=pay_id+1") or die("Could not create a new pay id");
		$get_pay_id= mysqli_query($connection,"SELECT pay_id FROM kp_pay_id") or die("Could not get the last pay id");
		$pow = mysqli_fetch_array($get_pay_id);
		$pay_id = $pow['pay_id'];
	}else{
		$create_new_id = mysqli_query($connection,"INSERT INTO kp_pay_id(pay_id) VALUES(1)") or die("Could not create a new order status");
		$pay_id= 1;
	}
	return $pay_id;
}
///

function cust_trans($cust_id,$trans,$transcol,$trans_id,$amount){
	global $connection;
	$user_id = $_SESSION['user_id'];
	$get_cust = "SELECT * FROM kp_cust_hist WHERE cust_id='$cust_id' AND  trans_id='$trans_id' AND user_id='$user_id' AND amount='$amount' AND trans_date=CURRENT_DATE ";
	$get_cust_r = mysqli_query($connection,$get_cust) or die("Could not get customer history".mysqli_error($connection));
	$row = mysqli_fetch_array($get_cust_r);
	if (empty($row)) {  
		$create_hist = mysqli_query($connection,"INSERT INTO kp_cust_hist(cust_id,trans,trans_column,trans_id,user_id,amount,trans_date) VALUES('$cust_id','$trans','$transcol','$trans_id','$user_id','$amount',CURRENT_DATE)") or die("Could not create a new order status");
		if ($create_hist) {
			return true;
		}else{
			return false;
		}
	}else{
		return true;
	}
		
} 

////////////////////////////////////////////
/////////////////START NOTIFICATIONS////////
//////////////////////////////////////////// 

function days_total($table,$column,$filter){
	global $connection; 
    $total= mysqli_query($connection,"SELECT SUM($column) AS total FROM $table WHERE $filter") or die("Error".mysqli_error($connection));
    $row = mysqli_fetch_assoc($total);
    if (is_null($row['total'])) {
    	$total =0;
    }else{
    	$total = $row['total'];
    }
    return $total;
}

function days_count($table,$column,$filter){
	global $connection;
    $result = mysqli_query($connection,"SELECT $column FROM $table WHERE $filter");
	$rows = mysqli_num_rows($result);
	return $rows;
}

function column_count($table,$column,$filter){
	global $connection;
    $result = mysqli_query($connection,"SELECT $column FROM $table WHERE $filter");
	$rows = mysqli_num_rows($result);
	return $rows;
}

function column_total($table,$column,$filter){
	global $connection;  
    $sql= "SELECT SUM($column) AS total FROM $table WHERE $filter"; 
    //echo $sql;
    $result=mysqli_query($connection,$sql) or die("Error".mysqli_error($connection));
    $row = mysqli_fetch_assoc($result);
    if (is_null($row['total'])) {
    	$total =0;
    }else{
    	$total = $row['total'];
    }
    return $total;
}


function get_column($table,$column,$filter){ 	
	global $connection; 
	$sql="SELECT $column FROM $table WHERE $filter";
	//echo $sql;
	if ($result = mysqli_query($connection,$sql)) {
		 
		$rows = mysqli_fetch_assoc($result);
		$col=$rows[$column];
		return $col; 
	}else{
		return mysqli_error($connection);
	}
}

function Insertdata($table,$field,$data){
	global $connection;
	$field_values= implode(',',$field);
	$data_values=implode(',',$data);
	$sql="INSERT INTO ".$table." (".$field_values.") VALUES (".$data_values.")"; 
	//echo $sql;
	if ($connection->query($sql)) {
		return true;
	}else{
		return false;
	}
  	
}
function Updatedata($table,$string){
	global $connection; 
	$sql="UPDATE ".$table." SET ".$string; 
	//echo $sql;
	if ($connection->query($sql)) {
		return true;
	}else{
		return false;
	}
  	
}


function uom_name($item_id,$uom_id){
	global $connection;
	$query = "SELECT * FROM kp_uom WHERE uom_id='$uom_id'";
  	$result = mysqli_query($connection,$query);
  	$row = mysqli_fetch_array($result);
  	$qty = $row['qty'];
  	if ($qty==1) {
  		$name=get_column('kp_items','uom',"item_id='$item_id'");
  		if (empty($name)) {
  			$name=$row['name'];
  		}
  	}else{
  		$name=$row['name'];
  	}
  	return $name;
}

function check_take(){
	global $connection;
	$last_take= get_column('kp_stock_take_set','last_take',"id=1");
	$take_interval= get_column('kp_stock_take_set','take_interval',"id=1");
	$today=today();  
	$earlier = new DateTime($last_take);
	$later = new DateTime($today);
	$days= $later->diff($earlier)->format("%a");
	if ($days>=$take_interval) {
		return true;
	}else{
		return false;	
	}
}

////////////////////////////////////////////
/////////////////END NOTIFICATIONS////////
////////////////////////////////////////////

////////////////////////////////////////////
/////////////////START SMS//////////////////
////////////////////////////////////////////

function create_sms($cust_id,$msg){
	global $connection; 
	$get_cust= mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$cust_id'");
	$row = mysqli_fetch_assoc($get_cust);
	$phone= strtoupper($row['phone']);
	//$msg="Thank You For choosing Diamond Lighting As Your Lighting and Interior  Patner";
	$create_sms= mysqli_query($connection,"INSERT INTO kp_sms(phone,msg) VALUES('$phone','$msg')") or die(mysqli_error($connection));
    return true;
}


////////////////////////////////////////////
/////////////////END SMS//////////////////
////////////////////////////////////////////

//     START THESION
////////////////////////////////////////////
function update_thesion($column,$value,$page){
	global $connection;
	$user_id=$_SESSION['user_id']; 
	$mac_address=get_mac();
	$create_thesion= mysqli_query($connection,"INSERT INTO kp_thesion(user_id,$column,datime,comp_address) VALUES('$user_id','$value',CURRENT_TIMESTAMP,'$mac_address') ON DUPLICATE KEY  UPDATE   $column='$value',current_page='$page',datime=CURRENT_TIMESTAMP,comp_address='$mac_address'  ") or die(mysqli_error($connection));

}	

function thesion_page($folder){
	global $connection; 
	$user_id = $_SESSION['user_id']; 
	$mac_address=get_mac();
	$page= $folder.basename($_SERVER['PHP_SELF']);
	$create_thesion= mysqli_query($connection,"INSERT INTO kp_thesion(user_id,current_page,datime,comp_address) VALUES('$user_id','$page',CURRENT_TIMESTAMP,'$mac_address') ON DUPLICATE KEY UPDATE current_page='$page',datime=CURRENT_TIMESTAMP,comp_address='$mac_address'") or die(mysqli_error($connection));
}

function sales_thesion($folder,$sale_id,$mkt,$cust_id,$sale_type,$day){
	global $connection; 
	$user_id = $_SESSION['user_id']; 
	$mac_address=get_mac();
	$page= $folder.basename($_SERVER['PHP_SELF']);
	$create_thesion= mysqli_query($connection,"INSERT INTO kp_thesion(user_id,cust_id,mkt,sale_id,sale_type,current_page,day,datime,comp_address) VALUES('$user_id','$cust_id','$mkt','$sale_id','$sale_type','$page','$day',CURRENT_TIMESTAMP,'$mac_address') ON DUPLICATE KEY UPDATE cust_id='$cust_id',mkt='$mkt',sale_type='$sale_type',current_page='$page',day=' 
		$day',datime=CURRENT_TIMESTAMP,comp_address='$mac_address',sale_id='$sale_id'") or die(mysqli_error($connection));
}

function return_thesion($folder,$ret_id,$sale_id){
	global $connection; 
	$user_id = $_SESSION['user_id']; 
	$mac_address=get_mac();
	$page= $folder.basename($_SERVER['PHP_SELF']);
	$create_thesion= mysqli_query($connection,"INSERT INTO kp_thesion(user_id,ret_id,sale_id,current_page,day,datime,comp_address) VALUES('$user_id','$ret_id','$sale_id','$page',CURRENT_DATE,CURRENT_TIMESTAMP,'$mac_address') ON DUPLICATE KEY UPDATE sale_id='$sale_id',ret_id='$ret_id',current_page='$page',datime=CURRENT_TIMESTAMP,comp_address='$mac_address'") or die(mysqli_error($connection));
}


function thesion_init($user_id,$dash,$panel){
	global $connection; 
	$mac_address=get_mac();
	// echo "INSERT INTO kp_thesion(user_id,dashboard,panel,comp_address,day,shop) VALUES('$user_id','$dash','$panel','$mac_address',CURRENT_DATE,'$shop') ON DUPLICATE KEY  UPDATE   dashboard='$dash',panel='$panel',comp_address='$mac_address',shop='$shop'";
	
	$create_thesion= mysqli_query($connection,"INSERT INTO kp_thesion(user_id,dashboard,panel,comp_address,day) VALUES('$user_id','$dash','$panel','$mac_address',CURRENT_DATE) ON DUPLICATE KEY  UPDATE   dashboard='$dash',panel='$panel',comp_address='$mac_address'") or die(mysqli_error($connection));
    return true;
}


function clear_thesion_ids($user_id){
	global $connection; 
	$delete_thesion = mysqli_query($connection,"UPDATE kp_thesion SET sale_id=0,cust_id=0,po_id=0,staff_id=0,req_id=0,mkt=0,ret_id=0,sup_id=0,petty_id=0,sale_type=0,bill_id=0,store_id=0,trans_id=0  WHERE user_id='$user_id'") or die(mysqli_error($connection));
}

function clear_thesion($user_id){
	global $connection; 
	$delete_thesion = mysqli_query($connection,"DELETE FROM kp_thesion  WHERE user_id='$user_id'") or die(mysqli_error($connection));
}

///////////////////////////////////////////
////START GENERAL FUNTIONS //////////
///////////////////////////////////////////
function front_perm($pass,$action){
	global $connection;
	$verify = mysqli_query($connection,"SELECT user_id,kp_roles.front_perm FROM kp_users INNER JOIN kp_roles ON kp_users.role_id=kp_roles.role_id WHERE cabi='$pass'") or die("Could not verify the password".mysqli_error($connection));
	if (mysqli_num_rows($verify) < 1) {
		return false;
	}else{
		$row = mysqli_fetch_assoc($verify);
		$front_perm=$row['front_perm'];
		$arr = explode(',', $front_perm); 
		if (in_array($action, $arr)){
			return true;
		}else{
			return false;
	    }
	}
}

function check_duplicate($table,$column,$value){
	global $connection;
	//$sql="INSERT INTO ".$table." (".$field_values.") VALUES (".$data_values.")";
	$check_dup= mysqli_query($connection,"SELECT ".$column." FROM ".$table." WHERE ".$column."='$value'");
	$dup = mysqli_num_rows($check_dup);
	if ($dup>0) {
		return true;
	}else{
		return false;
	}

}

function menu($menu_id){
	global $connection;
	$user_id = $_SESSION['user_id'];
	$get_details = mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$user_id'") or die("Could not get the user permissions");
    $row = mysqli_fetch_assoc($get_details);
    $perm=$row['permissions']; 
    $arr = explode(',',$perm);
 
    if (in_array($menu_id, $arr) OR $perm=='*') { 
		 	return 1;
		 }else{ 
		 	return 0;
		 } 
}

function get_means($means){
	if ($means==1) {
		$name="By Hand";
	}elseif ($means==2) {
		$name="Trolley";
	}elseif ($means==3) {
		$name="Motorbike";
	}elseif ($means==4) {
		$name="Vihecle";
	}else{
		$name="-";
	}
	return $name;
}

function bank_bal($bank_id){ 
	global $connection; 
	$get_bank_id= mysqli_query($connection,"SELECT bal FROM kp_banks WHERE  bank_id='$bank_id'") or die("Could not get the last pay id");
	$pow = mysqli_fetch_array($get_bank_id);
	$bal = $pow['bal'];
	return $bal;
}
function cust_bal($cust_id){
	global $connection;
	$check_payments = mysqli_query($connection,"SELECT bal FROM kp_customers WHERE cust_id='$cust_id'") or die(mysqli_error($connection));
    $py = mysqli_fetch_assoc($check_payments);
    $bal = $py['bal'];
    return $bal;
}
function get_beba($beba_id){
	global $connection;
	$beba_details = mysqli_query($connection,"SELECT name FROM kp_beba WHERE beba_id='$beba_id'");
	$cet = mysqli_fetch_assoc($beba_details);
	$name = $cet['name'];
	return $name;
}

function get_bank_id($pay_id){ 
	global $connection; 
	$get_bank_id= mysqli_query($connection,"SELECT bank_id FROM kp_pay_mode WHERE  pay_id='$pay_id'") or die("Could not get the last pay id");
	$pow = mysqli_fetch_array($get_bank_id);
	$bank_id = $pow['bank_id'];
	return $bank_id;
}
function get_sup($sup_id){
	global $connection;
	$get_supplier= mysqli_query($connection,"SELECT * FROM kp_suppliers WHERE sup_id='$sup_id'");
	$row = mysqli_fetch_assoc($get_supplier);
	$name = strtoupper($row['sup_name']);
	return $name;
}

function get_sub($sub_id){
	global $connection;
	$get_sub= mysqli_query($connection,"SELECT * FROM kp_sub_cat WHERE sub_id='$sub_id'");
	$cow = mysqli_fetch_assoc($get_sub);
	$name = strtoupper($cow['name']);
	return $name;
}

function get_cust($cust_id){
	global $connection;
	$get_cust= mysqli_query($connection,"SELECT * FROM kp_customers WHERE cust_id='$cust_id'");
	$row = mysqli_fetch_assoc($get_cust);
	$name = strtoupper($row['name']);
	return $name;
}

function get_bank($bank_id){
	global $connection;
	$get_bank= mysqli_query($connection,"SELECT * FROM kp_banks WHERE bank_id='$bank_id'");
	$row = mysqli_fetch_assoc($get_bank);
	$name = strtoupper($row['acc_name']);
	return $name;
}

//// STAFF ////// 
function get_staff($staff_id){
	global $connection;
	$get_user= mysqli_query($connection,"SELECT * FROM kp_staff WHERE staff_id='$staff_id'");
	$row = mysqli_fetch_assoc($get_user);
	$name = strtoupper($row['staff_name']);
	return $name;
}
//// STAFF//////
//// USERS 
// ===============================////
function get_user($user_id){
	global $connection;
	$get_user= mysqli_query($connection,"SELECT * FROM kp_users WHERE user_id='$user_id'");
	$row = mysqli_fetch_assoc($get_user);
	$name = strtoupper($row['username']);
	return $name;
}
//// USERS 
// ===============================////
//// ITEMS//////

function get_cat($cat_id){
	global $connection;
	$get_cat= mysqli_query($connection,"SELECT * FROM kp_category WHERE cat_id='$cat_id'");
	$n = mysqli_fetch_assoc($get_cat);
	$name = $n['name']; 
	return $name;
}
function get_item($item_id){
	global $connection;
	$get_item= mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id='$item_id'");
	$rows=mysqli_num_rows($get_item);
	if ($rows<1) {
		$name=get_arch_item($item_id);
	}else{
		$row = mysqli_fetch_assoc($get_item);
		$name = strtoupper($row['stock_code']." ".$row['name']); 
	}
	return $name;
}
function get_arch_item($item_id){
	global $connection;
	$get_item= mysqli_query($connection,"SELECT * FROM kp_items_arch WHERE item_id='$item_id'");
	$rows=mysqli_num_rows($get_item); 
	$row = mysqli_fetch_assoc($get_item);
	$name = strtoupper($row['stock_code']." ".$row['name'])."- (DISCONTINUED)";
	return $name;
}
function total_items(){
	global $connection;
	$get_item= mysqli_query($connection,"SELECT COUNT(item_id) as total FROM kp_items ");
	$row = mysqli_fetch_assoc($get_item);
	$total = ucwords(strtolower($row['total']));
	return $total;
}

//// ITEMS//////

///////////////////////////////////////////
////END GENERAL FUNTIONS /////////////
///////////////////////////////////////////

////////////////////////////////////////////
//     START LOGS
////////////////////////////////////////////

function logs($action,$url){
	global $connection; 
	$day=date('Y-m-d'); 
	$user_id = $_SESSION['user_id'];
    $name = strtoupper(get_user($user_id));
    $mac_address=get_mac();
    //The name of the file that we want to create if it doesn't exist.
	$file = $url.'logs/'.$day.'.txt';
	date_default_timezone_set("Africa/Nairobi");
	$today=date('d-M-Y h:i:sa');
	//Use the function is_file to check if the file already exists or not.
	/* Creates the directory if it does not exist */
 
	if(!is_file($file)){
	    //Some simple example content.
	    $contents =$today." |".$mac_address."|".$name."|".$day."|".$action;
	    //Save our content to the file.
	    file_put_contents($file, $contents);
	}else{
	$text = PHP_EOL.date('d-M-Y h:i:sa')." |".$mac_address."|".$name."|".$day."|".$action; 
	file_put_contents($file, $text, FILE_APPEND);
	}
return true;
}
function get_mac(){
	ob_start();  
	system('ipconfig /all');  
	$mycomsys=ob_get_contents();
	ob_clean(); 
	$find_mac = "Physical";
	$pmac = strpos($mycomsys, $find_mac); 
	$macaddress=substr($mycomsys,($pmac+36),17); 
	return $macaddress;
}

////////////////////////////////////////////
//     END LOGS
////////////////////////////////////////////

////////////////////////////////////////////
//     END THESION
////////////////////////////////////////////
/* backup the db OR just a table */
function backup_tables(){
	$tables = '*';
	global $connection; 
	$backuptime = date('YMd_His');
	$backupdatabasefiletime = date('Y-m-d H:i:s');
	$username = $_SESSION['user_id'];
	$ipaddress = $_SERVER["REMOTE_ADDR"];
	
	$backupdatabasefilename = $backuptime.'.sql';
	$backupdatabasefiletime =  $backupdatabasefiletime;
	
	$query1db = "insert into kp_backdb (backupfilename, backupfiledate, username, ipaddress) 
	values ('$backupdatabasefilename', '$backupdatabasefiletime', '$username', '$ipaddress')";
	$exec1db = mysqli_query($connection,$query1db) or die ("Error in Query1db".mysqli_error($connection));

	$return = '';
	
	
	//get all of the tables
	if($tables == '*'){
		$tables = array();
		$result = mysqli_query($connection, 'SHOW TABLES');
		while($row = mysqli_fetch_row($result))
		{
			$tables[] = $row[0];
		}
	}
	else
	{
		$tables = is_array($tables) ? $tables : explode(',',$tables);
	}
	
	//cycle through
	foreach($tables as $table)
	{ 
		$result = mysqli_query($connection, "SELECT * FROM  $table");
		$num_fields = mysqli_num_fields($result);
		
		//$return.= 'DROP TABLE '.$table.';';
		$row2 = mysqli_fetch_row(mysqli_query($connection, 'SHOW CREATE TABLE '.$table));
		$return.= "\n\n".$row2[1].";\n\n";
		
		for ($i = 0; $i < $num_fields; $i++) 
		{
			while($row = mysqli_fetch_row($result))
			{
				$return.= 'INSERT INTO '.$table.' VALUES(';
				for($j=0; $j<$num_fields; $j++) 
				{
					$row[$j] = addslashes($row[$j]);
					
					//Slash after and before double quote is compulsory.
					$patterns = "/\n/";
					$replacements = "/\\n/";
					$string = $row[$j]; 
					
					//$row[$j] = preg_replace("\n","\\n",$row[$j]); 
					$row[$j] = preg_replace($patterns, $replacements, $string);
					
					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
					if ($j<($num_fields-1)) { $return.= ','; }
				}
				$return.= ");\n";
			}
		}
		$return.="\n\n\n";
	}
	$handle = fopen('../../assets/back/db/'.$backuptime.'.sql','w+'); //z given to list folders at the end.
	fwrite($handle,$return);
	fclose($handle);
} 


/////////////////////////////////////////////
///////DB BACK UP///////////////////////////
/////////////////////////////////////////////


/////////////////////////////////////////////
////////// REPORTING/////////////////////////
/////////////////////////////////////////////
function po_total($po_id){
    global $connection;
    $total_po = mysqli_query($connection,"SELECT SUM(total) AS gtotal FROM kp_po_items WHERE po_id='$po_id'") or die("Error");
    $row = mysqli_fetch_assoc($total_po);
    $total = $row['gtotal'];
    return $total;
}

function update_po($po_id){
	global $connection;
	$user_id=$_SESSION['user_id'];
	$po = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE rec_status=2 AND po_id='$po_id'") or die("Could not fetch the purchase orders");
	if ( mysqli_num_rows($po)==0) {
	     $update_po = mysqli_query($connection,"UPDATE kp_po SET rec_status=1,rec_staff='$user_id', rec_date=CURRENT_DATE WHERE po_id='$po_id' ");
	}
}

function pay_mode_total($pay_id,$start,$end){
	global $connection;
	$mode="mode".$pay_id;
	$total=mysqli_query($connection,"SELECT SUM($mode) AS total FROM kp_sale_payment WHERE  pay_date BETWEEN '$start' AND '$end'");
	$row = mysqli_fetch_assoc($total);
	return $row['total'];

} 
function paymode_total($pay_id,$day,$type){
	global $connection;
	$str="";
	$mode='mode'.$pay_id;  
	$get_items = mysqli_query($connection,"SELECT SUM($mode) AS sum FROM kp_sale_payment INNER JOIN kp_sales ON kp_sales.sale_id=kp_sale_payment.sale_id WHERE pay_date='$day' AND kp_sale_payment.type='$type' $str") or die("Could not get any mode payments");
	$row = mysqli_fetch_assoc($get_items);
 
	return $row['sum'];
}

function mop($sale_id){
	global $connection;
	$mop="";
	$get_mode = "SELECT * FROM kp_pay_mode"; 
  	$get_mode_r = mysqli_query($connection,$get_mode) or die("Could not fetch the payment mode");
  	while ($o = mysqli_fetch_assoc($get_mode_r)) {  
	    $pay_id=$o['pay_id'];
	    $name=$o['name'];
		$mode="mode".$pay_id;
		$total=mysqli_query($connection,"SELECT  $mode FROM kp_sale_payment WHERE sale_id='$sale_id'");
		$row = mysqli_fetch_assoc($total);
		if ($row[$mode]>0) {
			$mop=$mop.$name.",";	 
		}
	}
	$total=mysqli_query($connection,"SELECT modesc FROM kp_sale_payment WHERE sale_id='$sale_id'");
	$row = mysqli_fetch_assoc($total);
	if ($row[$mode]>0) {
		$mop=$mop."Store Credit"	; 
	}

	return $mop;
}

function cred_mop($payment_id){
	global $connection;
	$mop="";
	$get_mode = "SELECT * FROM kp_pay_mode"; 
  	$get_mode_r = mysqli_query($connection,$get_mode) or die("Could not fetch the payment mode");
  	while ($o = mysqli_fetch_assoc($get_mode_r)) {  
	    $pay_id=$o['pay_id'];
	    $name=$o['name'];
		$mode="mode".$pay_id;
		$total=mysqli_query($connection,"SELECT  $mode FROM kp_sale_payment WHERE pay_id='$payment_id'");
		$row = mysqli_fetch_assoc($total);
		if ($row[$mode]>0) {
			$mop=$mop.$name.",";	 
		}
	}
	$total=mysqli_query($connection,"SELECT modesc FROM kp_sale_payment WHERE pay_id='$payment_id'");
	$row = mysqli_fetch_assoc($total);
	if ($row[$mode]>0) {
		$mop=$mop."Store Credit"	; 
	}
	return $mop;
}

function mkt_summary($mktr,$today){
	global $connection;
	$mktorders = mysqli_query($connection,"SELECT SUM(sale_amount) as total,COUNT(mktr) as mktorders FROM kp_sales WHERE mktr='$mktr' AND  day='$today'");
	$to = mysqli_fetch_assoc($mktorders); 
	return array($to['mktorders'],$to['total']);
}


function sale_cust($sale_id){
	global $connection;
	$get_cust= mysqli_query($connection,"SELECT cust_id FROM kp_sales WHERE sale_id='$sale_id'");
	$row = mysqli_fetch_assoc($get_cust);
	$name = get_cust($row['cust_id']);
	return $name;
}

function sale_type($sale_id){
	global $connection;
	$check_type=mysqli_query($connection,"SELECT type FROM kp_sales WHERE  sale_id='$sale_id'"); 
	$on = mysqli_fetch_assoc($check_type);
	$type = $on['type'];
	return $type;
  }
/////////////////////////////////////////////
////////// REPORTING/////////////////////////
/////////////////////////////////////////////
?>