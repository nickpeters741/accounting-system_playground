<?php 
session_start();
include('../../inc/connection.php');  
include('funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$qt_id = $row['qt_id'];
if ($qt_id==0) {
    header("Location: init_page.php");
}else{   
    $action="LOADED CONFIRM MODAL FOR QUOTE NO | ".$qt_id;
    $url="../../";
    logs($action,$url);
    $disc = $_REQUEST['disc'];
    $tt = $_REQUEST['tt'];
    $vatable = $_REQUEST['vatable'];
    $vatt = $_REQUEST['vatt']; 
    $perc = $_REQUEST['perc'];  
    $cust = $_REQUEST['cust'];
    $no=0;
    $total=0; 
}
?>
<div class="modal-content">
    <div id="po-results"></div>
	<div class="modal-header"> 
        <h5 class="modal-title">CONFIRM RAISING QUOTE NO <?php echo $qt_id; ?></h5>
    </div>
    <div class="modal-body"> 
        <table class="table table-bordered" id="TheSo">
            <thead>
                <tr> 
                    <th colspan="2">Customer</th>
                    <th colspan="3"><?PHP echo get_cust($cust); ?></th>
                </tr>
                <tr>
                   <th>No:</th>
                    <th>Item Name</th>
                    <th>Quantity</th> 
                    <th>Price</th>  
                    <th>Amount</th>                
                </tr>
            </thead>
            <tbody>
                <?php 
                $requisitions = mysqli_query($connection,"SELECT * FROM kp_qt_items WHERE  qt_id='$qt_id'") or die(mysqli_error($connection));
                while ($row = mysqli_fetch_assoc($requisitions)) {
                    $item_id = $row['item_id']; 
                    $no=$no+1;
                    $amount=$row['total'];
                    $total=$total+$amount; 
                    ?>
                <tr>
                    <td><?php echo $no; ?></td>
                    <td><?php echo get_item($item_id); ?></td>
                    <td><?php echo $row['qty']; ?></td>  
                    <td><?php echo $row['price'];  ?></td> 
                    <td><?php echo $amount ?></td>
                     
                </tr>
                <?php
                 }
                ?>
            </tbody>
            <tfooter>
                <tr>
                    <th colspan="4" class="text-right">SUB-TOTAL</th>
                    <th id="ttt"><?php echo round($total,2) ?></th>
                     
                </tr>
                <!-- <tr>
                    <th colspan="4" class="text-right">DISCOUNT</th>
                    <th id="ttt"><?php echo round($disc,2) ?></th>
                </tr> -->
                <tr>
                    <th colspan="4" class="text-right">TAXABLE</th>
                    <th id="ttt"><?php echo $vatable ?></th>
                </tr>
                <tr>
                    <th colspan="4" class="text-right">VAT (<?php echo $perc ?>%)</th>
                    <th id="ttt"><?php echo $vatt ?></th>
                </tr>
                <tr style="font-size: 18px;">
                    <th colspan="4" class="text-right">TOTAL</th>
                    <th id="ttt"><?php echo $tt ?></th>
                </tr>
            </tfooter>
        </table>
            <?php 
            if ($_REQUEST['tax']!=0 ){ 
            ?> 
                <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td colspan="2" style="font-size: 14px;"><b>CODE</b></td>
                        <td colspan="2" style="font-size: 14px;"><b>RATE</b></td>
                        <td style="font-size: 14px;"><b>VATABLE</b></td>
                        <td style="font-size: 14px;"><b>VAT AMOUNT</b></td>
                    </tr>
                    <?php 
                    $get_tax = "SELECT code,tax_id,percent FROM kp_tax";
                    $get_tax_r = mysqli_query($connection,$get_tax) or die("Could not fetch tax" );
                    while ($t = mysqli_fetch_assoc($get_tax_r)) {
                        $tax_id = $t['tax_id'];  
                        $code = $t['code'];
                        $percent = $t['percent']."%"; 
                        if ($code=="E") {
                            $percent="-";
                        }
                        $tax=column_total("kp_sale_items","tax","tax_id=$tax_id AND sale_id=$sale_id");
                        if ($tax==0) {
                            # code...
                      }else{
                        ?>
                    <tr>
                        <td colspan="2"><?php echo $code; ?></td>
                        <td colspan="2" class="text-center"><?php echo $percent; ?></td>
                        <td><?php echo column_total("kp_sale_items","total","tax_id=$tax_id AND sale_id=$sale_id")-$tax; ?></td>
                        <td><?php echo $tax; ?></td>
                    </tr>
                    <?php
                    }}
                  ?>
                </tbody>
              </table>
          <?php } ?>
    </div>
    <div class="modal-footer" style="padding: 8px;">
        <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <a class="btn btn-lime btn-xs" onclick="place_po();"  >Confirm</a> 
    </div>
</div>
<script type="text/javascript">
    function place_po(){
        // var disc= $('#disc').val();
        var vatable= $('#vatable').html(); 
        var vatt= $('#vatt').html();
        var tt= $('#tt').html();
        var perc= $('#perc-input').val(); 
        var sup = <?php echo $cust; ?>;
        var vat_type=$('input[name="tax"]:checked').val(); 

        $.ajax({
            url: 'qt_place.php',
            type: 'POST',
            data: {vatable:vatable,vatt:vatt,tt:tt,perc:perc,sup:sup,vat_type:vat_type},
            dataType: 'html'
        })
        .done(function(data){
            console.log(data);
            $('#po-results').html(''); // blank before load.
            $('#po-results').html(data); // blank before load.
        })
        .fail(function(){
            $('#po-results').html(''); // blank before load.
            $('#po-results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        });
    }
</script>