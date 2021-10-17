<?php
session_start(); 
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$url = "../../assets";

if (!isset($_SESSION['user_id'])) {
   header("Location:../log_out.php");
}
$folder="front/po/"; 
thesion_page($folder);

$user_id = $_SESSION['user_id']; 
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
if (isset($_GET['id'])) {
  $po_id = $_GET['id'];
}else{
  $po_id = $row['po_id'];
}
$dash = $row['dash'];
$shop = $row['shop'];
$sum=0;

$sales_1 = mysqli_query($connection,"SELECT * FROM kp_po WHERE po_id='$po_id'") or die(mysqli_error($connection));
$sales = mysqli_fetch_assoc($sales_1); 
$sup_id = $sales['sup_id'];
$po_date = $sales['po_date']; 
$refno = $sales['refno']; 

$get_cust = mysqli_query($connection , "SELECT * FROM kp_suppliers WHERE sup_id='$sup_id'") or die(mysqli_error($connection));
$sup = mysqli_fetch_assoc($get_cust); 
$bname = $sup['sup_name'];
$mobile=$sup['sup_phone']; 
$address = $sup['sup_address'];
$location = $sup['sup_location']; 

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen WHERE id='$shop'") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

$action="PRINTED|-|-|-| PURCHASE NO|".$po_id;
logs($action,"../../");

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");

$taxby=get_column('kp_po','tax_by',"po_id='$po_id'");
?>
<!DOCTYPE html> 
<html lang="en"> 
<head>
<meta charset="utf-8" />
<title>KPOS</title> 
<link href="<?php echo $url; ?>/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" /> 
<link href="<?php echo $url; ?>/css/default/invoice-print.css" rel="stylesheet" />
<?php
if (isset($_GET['id'])) {
  ?>
<script type="text/javascript">
  function close(){
    window.location = location.href = document.referrer;
  } 
  </script>
  <?php
}else{
    ?>
    <script type="text/javascript">
      function close(){
        window.location = '../dash/'+'<?php echo $dash;?>';
      } 
    </script>
    <?php
  }
?> 
</head>
<!--  -->
<body onload="setTimeout(function () { close(); }, 1000); window.print()">  
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #content -->
    <div id="contents" class="contents">
      <div class="p-order">
        <!-- begin invoice-header--> 
        <div class="inv-header" style="border-top:  2px solid #753f91; ">
          <div style=" border-right: green; width: 50%; float: left;">
            <a href="../dash/admin_dash.php" >
              <img src="<?php echo $gen['image_path']; ?>" style="width: 100px; margin-left: 5px; margin-top: 5px;" />
              </a> 
          </div>
          <div style=" border: green; width: 50%; float: right;">  
            <h1 style=" text-align: left; margin: 0px 0px 10px 0px;"><u>PURCHASE ORDER</u> </h1>
            <h3 style=" text-align: right; margin: 0px 0px 0px 0px;"><?php echo $gen['company_name']; ?> </h3>
            <address class="m-b-5" style="margin-top: 2px; text-align: right;">
              <?php echo $gen['address']."<br> <b>Mobile. </b>".$gen['phone1']; ?> 
              <?php echo "<b>Tel.</b> ".$gen['phone2']; ?><br/> 
              <?php echo "<b>Email.</b> ".$gen['email']; ?><br/> 
              <?php echo "<b>Website.</b> ".$gen['website']; ?> 
            </address>
          </div> 
        </div>
        <div class="inv-contact">
          <div style=" border-right: green; width: 60%; float: left;">
            <strong style="color: #753f91;">REF NO: <?php echo $refno;?></strong><br>
            <strong style="color: #753f91;">PO TO:</strong><br>
              <strong class="text-inverse"><?php echo $bname;?></strong><br />
              <?php echo $address; ?><br/> 
              <?php echo $mobile; ?><br/> 
              <?php echo $email; ?> 
            </div>
            <div class="col-md-4" style=" width: 30%; float: right; padding:5px 1px">
              <table class="table">
                <tbody >
                  <tr>
                    <td>PO No: </td>
                    <td ><?php echo $po_id; ?> </td>
                  </tr>
                  <tr>
                    <td>PO Date: </td>
                    <td ><?php echo $po_date; ?> </td>
                  </tr>
                  <!-- <tr>
                    <td class="pull-left">Due Date: </td>
                    <td class="pull-right"><?php 
                      $next_due_date = date('d-m-Y', strtotime($ord_date. ' +30 days'));
                      echo $next_due_date; ?>
                     
                    </td>
                  </tr> -->
                </tbody>
              </table>       
            </div> 
        </div>  
    <!-- end invoice-header -->

    <!-- begin invoice-Details--> 
        <div class="inv-content" >
          <table class="table">
            <thead>
              <tr> 
                <th>No</th>
                <th style="text-align: left;">Item Description</th>
                <th style="text-align: right;">Qty</th>
                <th style="text-align: right;">Unit Price</th>
                <th style="text-align: right;">Disc</th>
                <th style="text-align: right;">Total</th>  
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
              $po_items = mysqli_query($connection ,"SELECT * FROM kp_po_items WHERE po_id= '$po_id'") or die(mysqli_error($connection));
              if (mysqli_num_rows($po_items) < 1) {
                echo "There are no items on this order";
              }else{
                while ( $data = mysqli_fetch_assoc($po_items)) {
                  $item_id= $data['item_id'];
                  $price = $data['price'];
                  $quantity = $data['qty'];
                  $disc = $data['disc'];
                  $total = $data['total'];
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
                <td><?php echo get_item($item_id); ?></td>
                <td style="text-align: right;"><?php echo $quantity; ?></td>
                <td style="text-align: right;"><?php echo number_format($price,2); ?></td>
                <td style="text-align: right;"><?php echo number_format($disc,2); ?></td>
                <td style="text-align: right;"><?php echo number_format($total,2); ?></td> 
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
              }
              ?> 
            </tbody>
            <tfoot>
              <tr> 
                <td colspan="4" rowspan="4" class="text-right m-b-5"></td>
                <td  style="text-align: center;" ><strong>Sub Total:</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo number_format($sum,2); ?></strong></td><?php 
                if ($taxby==1) {
                  ?>
                  <td  rowspan="4"> </td>
                  <?php
                }
                ?>
              </tr>
              <tr> 
                <td  style="text-align: center;" ><strong>Discount:</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sumd; ?></strong></td> 
              </tr>
              <tr> 
                <td  style="text-align: center;" ><strong>V.A.T(<?php echo $sales['tax_perc'];?>%):</strong></td>
                <td style="text-align: right;"><strong> Ksh. &nbsp;<?php echo $sales['vat']; ?></strong></td> 
              </tr>
              <!-- <tr> 
                <td colspan="4" class="text-right m-b-5"><h6><strong>VAT(<?php echo $sales['tax_perc'];?>%) KSH:</strong></h6></td>
                <td><h6><strong> <?php echo $sales['vat']; ?></strong></h6></td>
              </tr> -->
               <tr style="font-size: 18px;">  
                <td style="text-align: center;" > <strong>TOTAL</strong> </td>
                <td style="text-align: right;"> 
                  <strong> 
                    Ksh. &nbsp;<?php 
                    $tt=$sum-$sales['vat'];
                    echo number_format($tt,2); ?></strong> </td>
              </tr>
            </tfoot>
          </table>
          <br>
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
         <div id="inv-footer"> 
                <p class="text-center">
                  THANK YOU FOR YOUR BUSINESS<br/>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i><?php echo $gen['website']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i><?php echo $gen['phone1']; ?></span>
                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> <?php echo $gen['email']; ?></span>
                </p> 
            </div>
      </div> 
      <p class="break"></p>  
    </div>  
  </div>
  <script type="text/javascript">
        $(document).ready(function () {
    function disableBack() {window.history.forward()}

    window.onload = disableBack();
    window.onpageshow = function (evt) {if (evt.persisted) disableBack()}
});
      </script> 
</body>
</html> 
 