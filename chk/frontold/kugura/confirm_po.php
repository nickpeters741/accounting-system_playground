<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php'); 

$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id']; 
$sup_id = $row['sup_id']; 
$day = $row['day']; 
$action="LOADED|-|-|-|CONFIRM PURCHAS MODAL FOR  PO NO |".$po_id;
logs($action,"../../"); 
$no=0; 

$taxby = $_POST['taxby'];
$vatable = $_POST['vatable']; 
$perc = $_POST['perc']; 
$vatt = $_POST['vatt']; 
$tt = $_POST['tt'];
$tax = $_POST['tax'];
$refno = $_POST['refno'];
?>
<div class="modal-content" style="width: 600px; margin-left: -200px;">
  <div class="modal-header">
    <h3 style=" color: purple;">CONFIRM PURCHASE NO: <?php echo $po_id; ?> DETAILS AND ITEMS</h3>
  </div>
  <div class="modal-body">
    <div id="po_results"></div>
    <div class="row">  
     <div class="col-md-4"><b style="font-size: 14px; color: blue;">CASHIER:  <?php echo get_user($user_id); ?></b></div>
     
     <div class="col-md-8"><b style="font-size: 14px; color: blue;">SUPPLIER:  <?php echo get_sup($sup_id); ?></b></div>
     <div class="col-md-4"><b style="font-size: 14px; color: blue;">REF NO:  <?php echo $refno; ?></b></div>
     <div class="col-md-4"><b style="font-size: 14px; color: blue;">PO DATE:  <?php echo $day; ?></b></div> 
     <div class="col-md-4"><b style="font-size: 14px; color: darkred;">BALANCE:  <?php echo get_column('kp_suppliers','sup_bal',"sup_id='$sup_id'"); ?></b></div>

    </div>
    <table class="table table-bordered" id="TheSo">
        <thead>
            <tr>
                <th>#</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Price</th> 
                <th>Discount</th> 
                <th>Total Amount</th>
                <?php 
                if ($taxby==1) {
                  ?>
                  <th>Tax</th>
                  <?php
                }
                ?>
            </tr>
        </thead>
        <tbody>
            <?php 
            $sum=0;
            $sumd=0;
            $get_orders = "SELECT * FROM kp_po_items WHERE po_id='$po_id' GROUP BY item_id";
            $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");
            while ($s = mysqli_fetch_assoc($get_orders_r)) {
                $item_id = $s['item_id'];
                $qty = $s['qty'];
                $price = $s['price'];
                $disc = $s['disc'];
                $total = $s['total']; 
                $no=$no+1;
                $sum=$sum+$total;
                $sumd=$sumd+$disc;
                $tax_id=get_column('kp_items','tax_id',"item_id='$item_id'");
                if ($tax_id==0) {
                  $tax_id=1;
                }
                ?>
                <tr>
                    <td><?php echo $no; ?></td>
                    <td> <?php  echo get_item($item_id); ?> </td>
                    <td><?php echo $qty; ?></td>
                    <td><?php echo $price; ?></td> 
                    <td><?php echo $disc; ?></td>
                    <td><?php echo $total; ?></td>
                    <?php 
                    if ($taxby==1) {
                    ?>
                        <td><?php echo get_column("kp_tax","code","tax_id=$tax_id") ?></td>
                    <?php
                    }
                    ?>
                </tr>
            <?php
            }
            ?>
            <tr>
                <th colspan="5" class="text-right">Sub Total:</th>
                <td><?php echo $vatable+$sumd; ?></td><?php 
                if ($taxby==1) {
                ?>
                <td> </td>
                <?php
                }
                ?>
            </tr>
            <tr>
                <th colspan="5" class="text-right">Discount:</th>
                <td><?php echo $sumd; ?></td>
                <?php 
                if ($taxby==1) {
                  ?>
                  <td> </td>
                  <?php
                }
                ?>
            </tr> 
            <tr>
                <th colspan="5" class="text-right">Total:</th>
                <td> <?php echo $tt; ?></td>
                <?php 
                if ($taxby==1) {
                ?>
                <th> </th>
                <?php
                }
                ?>
            </tr> 
        </tbody>
    </table>
    <?php 
    if ($taxby==1 ){ 
    ?> 
    <table class="table table-bordered">
        <tbody>
            <tr>
                <td colspan="2" style="font-size: 14px;"><b>NAME</b></td>
                <td colspan="2" style="font-size: 14px;"><b>CODE</b></td>
                <td colspan="2" style="font-size: 14px;"><b>RATE</b></td>
                <td style="font-size: 14px;"><b>VATABLE</b></td>
                <td style="font-size: 14px;"><b>VAT AMOUNT</b></td>
            </tr>
            <?php 
            $get_tax = "SELECT code,tax_id,percent,name FROM kp_tax";
            $get_tax_r = mysqli_query($connection,$get_tax) or die("Could not fetch tax" );
            while ($t = mysqli_fetch_assoc($get_tax_r)) {
                $tax_id = $t['tax_id'];  
                $code = $t['code'];$name = $t['name'];
                $percent = $t['percent']; 
                if ($code=="E") {
                    $percent="-";
                } 
                $sql=  "SELECT SUM(total) as tt FROM kp_po_items INNER JOIN kp_items on kp_po_items.item_id=kp_items.item_id  WHERE kp_items.tax_id='$tax_id' AND po_id='$po_id' GROUP BY kp_items.tax_id" ;
                $sql_query=mysqli_query($connection,$sql);
                $tt = mysqli_fetch_assoc($sql_query);
                $tt=$tt['tt'];

                $sql1=  "SELECT kp_items.tax_id FROM kp_po_items INNER JOIN kp_items on kp_po_items.item_id=kp_items.item_id  WHERE kp_items.tax_id='$tax_id' AND po_id='$po_id'" ;
                $sql1_query=mysqli_query($connection,$sql1); 
                $tax_count=mysqli_num_rows($sql1_query);
                if ($tax_count==0) { 
                }else{
                    if ($percent==0) {
                        $tax_amount=0;
                        $vatable=$tt;
                    }else{
                        if ($tax==1) {
                            $q=100+$percent;
                            $tax_amount=($percent/$q)*$tt;
                            $vatable=$tt-$tax_amount;
                        }else{
                            $vatable=$tt;
                            $tax_amount=($percent/100)*$tt;
                        }
                    }
                    ?>
                    <tr>
                        <td colspan="2"><?php echo $name; ?></td>
                        <td colspan="2"><?php echo $code; ?></td>
                        <td colspan="2" class="text-center"><?php echo $percent."%"; ?></td>
                        <td><?php  echo round($vatable,2); ?></td>
                        <td><?php echo round($tax_amount,2); ?></td>
                    </tr>
                    <?php
                    }
                }
                ?>
        </tbody>
    </table>
    <?php
    }
    ?>
</div>
<div class="modal-footer">
    <div class="row " style="border: 1px solid #d9e0e7; padding: 5px;"> 
        <label class="col-md-6" ><p style=" color: blue; font-size: 14px;">Update Items Buying Price:</p></label>
        <!-- <div class="radio col-md-8"></div>  -->
        <div class="radio col-md-2">
          <label><input type="radio" name="update" value="1" checked>YES</label>
        </div>
        <div class="radio col-md-2">
          <label><input type="radio" name="update" value="2">NO</label>
        </div>
        <div class="radio col-md-12"> 
            <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal" >Close</button> 
            <button name="complete" class="btn btn-purple btn-xs" id="complete m-l-10" onclick="complete(2);">Purchase & Recieve</button>
            <!-- <button name="complete" class="btn btn-purple btn-xs" id="complete m-r-10" onclick="complete(1);">Purchase Only</button> -->
        </div> 
    </div>
 
</div>
</div>
<script type="text/javascript"> 
function complete(st) { 
    console.log(st); 
    var update= $('input[name="update"]:checked').val();
    var taxby='<?php echo $taxby; ?>';
    var tax='<?php echo $tax; ?>';
    var vatable='<?php echo $vatable ?>';
    var vatt='<?php echo $vatt ?>';
    var perc='<?php echo $perc ?>';
    var tt= '<?php echo $tt ?>';
    var refno= '<?php echo $refno ?>';
    $.post("po_act.php", {vatable:vatable,vatt:vatt,tt:tt,perc:perc,taxby:taxby,tax:tax,refno:refno,st:st,update:update},
    function(data){ 
        $('#po_results').html(''); // blank before load.
        $('#po_results').html(data);
    }) 
}
 
</script>