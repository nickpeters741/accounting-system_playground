<?php 
include('../inc/connection.php'); 
//include('../clude/funcs.php');
//if(isset($_GET['id'])){
    $item_id = $_REQUEST['id'];
    //GET ALL UOM
    $response='';
    $query = "SELECT * FROM kp_uom";
    $result = mysqli_query($connection,$query);
    $response .= "<option value = '0'>--SELECT UOM--</option>";//
    while($row = mysqli_fetch_array($result)){ 
        $uom_id=$row['uom_id'];
        $column='uom'.$uom_id;
        $item_query = "SELECT $column FROM kp_items WHERE item_id='$item_id'";
	    $item_result = mysqli_query($connection,$item_query);
	    $tow = mysqli_fetch_array($item_result);
	    if ($tow[$column]==1) {
	    	if($row['qty']==1){
	    		$select="selected";
	    	}else{
	    		$select="";
	    	}
    		$response .= "<option value = '".$row['uom_id']."'". $select." >".$row['name']."</option>";
            //array("value"=>$row['uom_id'],"label"=>$row['name']); 
	    }
    }
    echo $response;
//}
 
?> 