<?php
session_start();
include('../../inc/connection.php');
include('funcs.php'); 
$folder="front/po/"; 
thesion_page($folder);
$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 
$sup_id = $row['sup_id'];
$shop = $row['shop']; 
$day = $row['day'];  
$total=column_total('kp_po_items','total',"po_id='$po_id'");//grand_total($sale_id);

 
$taxby = $_REQUEST['taxby'];
$tax = $_REQUEST['tax'];
$refno = $_REQUEST['refno'];
$update = $_REQUEST['update'];
$st = $_REQUEST['st'];
$bal=get_column('kp_suppliers','sup_bal',"sup_id='$sup_id'");//cust_bal($cust_id);
echo $bal."<br>";
echo $taxby;
if ($taxby==1 ){  
    $get_item = "SELECT item_id,total FROM kp_po_items WHERE po_id='$po_id'";
    $get_item_r = mysqli_query($connection,$get_item) or die("Could not fetch item_id" );
    while ($t = mysqli_fetch_assoc($get_item_r)) {
        $item_id=$t['item_id'];
        $itemtotal=$t['total'];
        $tax_id=get_column('kp_items','tax_id',"item_id='$item_id'");
        $perc=get_column('kp_tax','percent',"tax_id='$tax_id'");
        if ($tax==1) {
          $q=100+$perc;
          $vatt=($perc/$q)*$itemtotal;
          $vatable=$itemtotal-$vatt;
        }else{
            $vatable=$itemtotal;
            $vatt=($perc/100)*$itemtotal;
        }
        $update_lpo_item = mysqli_query($connection,"UPDATE kp_po_items SET tax_id='$tax_id',tax_type='$tax',vat='$vatt',vatable='$vatable' WHERE po_id='$po_id' AND item_id='$item_id'");
    }
    $vatable = column_total('kp_po_items','vatable',"po_id='$po_id'"); 
    $perc = 0; 
    $vatt =column_total('kp_po_items','vat',"po_id='$po_id'");   
}else{
    $vatable = $_REQUEST['vatable']; 
    $perc = $_REQUEST['perc']; 
    $vatt = $_REQUEST['vatt']; 
    $tt = $_REQUEST['tt'];
}
$create_sale = mysqli_query($connection,"INSERT INTO kp_po(po_id,sup_id,user_id,amount,po_date,cf_bal,tax_by,tax_type,vatable,vat,tax_perc,refno,shop)  VALUES('$po_id','$sup_id','$user_id','$total','$day','$bal','$tax','$tax','$vatable','$vatt','$perc','$refno','$shop')");
if (!$create_sale) {
    $action="PLACED ALREADY PLACED|-|-|-PO|".$po_id;
    echo mysqli_error($connection);
	logs($action,"../../");
  	?>
     <script type="text/javascript">
        //window.location = "print_po.php";  
      </script>
      <?php
}else{
    if ($update==1) {
        $get_item = "SELECT price,item_id FROM kp_po_items WHERE po_id='$po_id'";
        $get_item_r = mysqli_query($connection,$get_item) or die("Could not fetch item_id" );
        while ($t = mysqli_fetch_assoc($get_item_r)) {
            $item_id=$t['item_id'];
            $price=$t['price']; 
            $update_lpo_item = mysqli_query($connection,"UPDATE kp_items SET bprice='$price'WHERE item_id='$item_id'");
        }
    }
    $action="PLACED|-|-|-|PURCHASE NO |".$po_id;
	logs($action,"../../");
    $clear_sale_status = mysqli_query($connection,"DELETE FROM kp_po_status  WHERE po_id='$po_id'") or die("Error"); 
    if ($st==2) {
        ?>
     <script type="text/javascript">
         window.location = "po_rec_all.php?id="+<?php echo $po_id; ?> ;
      </script>
      <?php
    }else{
        ?>
     <script type="text/javascript">
         window.location = "print_po.php";
      </script>
      <?php
    }
      
 }
?>