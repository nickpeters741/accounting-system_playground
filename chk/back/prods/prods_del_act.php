<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id=$_SESSION['user_id'];
$items = $_POST['items'];
check_table("kp_items","kp_items_arch");
$arr = explode(",", $items);
foreach( $arr  as $c) {
	$item_id=$c;
	
	$ids="row".$item_id;
	$item_name=get_column("kp_items","name","item_id='$item_id'");
	$transact="ITEM DISCONTINUED";
	$arch=mysqli_query($connection,"INSERT INTO kp_items_arch SELECT * FROM kp_items WHERE  item_id='$item_id'");
	if($arch) {
		echo $item_id;
		$track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item".mysqli_error($connection));
		if ($track) {
			$delete=mysqli_query($connection,"DELETE FROM  kp_items WHERE item_id='$item_id'") or die("Could not delete the item");
			if ($delete) {
				$action="DISCONTINUED|-|-|-|".$item_name;
				logs($action,"../../");
				?>
				<script type="text/javascript">
					var item_id='<?php echo $item_id; ?>';
					$('.row'+item_id).remove();  
		            var hulla = new hullabaloo();
		            hulla.send('<?php echo $item_name; ?> Archived Successfully', "success");
		            $('#modal').modal('toggle');
				</script>
				<?php	 
			}else{


			}
		}else{

		}
	}else{
		$error=mysqli_error($connection);
		?>
		<script type="text/javascript"> 
			var err='<?php echo $error; ?>';   
            var hulla = new hullabaloo();
            hulla.send('<?php echo $item_name; ?> COULD NOT BE ARCHIVED <br> '+err, "danger");
		</script>
		<?php	 

	}
} 
function check_table($table1,$table2){
	global $connection;
	$get_column=mysqli_query($connection,"SHOW COLUMNS FROM $table1") or die("Could not load the table ".mysqli_error($connection));
	$get_columns2=mysqli_query($connection,"SHOW COLUMNS FROM $table2") or die("Could not load the table ".mysqli_error($connection));
	$array1=array();
	$array2=array();
	while ($res = mysqli_fetch_assoc($get_column)) {
	   $array1[]=$res['Field'];
	}
	while ($row = mysqli_fetch_assoc($get_columns2)) {        
       $array2[]=$row['Field'];
    }
    $result=array_diff($array1,$array2);
    $list=explode(', ', implode(', ', $result)); 
    if (count($list)>0) { 
	    for ($i=0; $i < count($list); $i++) { 
	    	$col=$list[$i]; 
	    	$get_col=mysqli_query($connection,"SHOW COLUMNS FROM $table1 WHERE Field='$col'") or die("Could not load the table ".mysqli_error($connection));
	    	$cow=mysqli_fetch_assoc($get_col); 
	    	$field=$cow['Field'];
	    	$type=$cow['Type']; 
	    	mysqli_query($connection,"ALTER TABLE $table2 ADD $field $type   NOT NULL"); 
	    }  
    }
}
?>