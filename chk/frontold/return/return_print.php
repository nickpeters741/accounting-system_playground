<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$user_id=$_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];
$ret_id = $row['ret_id'];

//$decision = $_SESSION['decision'];
$time=date("h:i:a");

//$clear_note_status = mysqli_query($connection,"DELETE FROM kp_note_status  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));  
$clear_ret_status = mysqli_query($connection,"DELETE FROM kp_ret_status  WHERE ret_id='$ret_id'") or die("Error".mysqli_error($connection));  

$get_sales = "SELECT * FROM kp_sales  WHERE sale_id='$sale_id'";
$get_sales_r = mysqli_query($connection,$get_sales) or die("Could not fetch the order");
$s = mysqli_fetch_assoc($get_sales_r);
$cust_id=$s['cust_id'];
$refno=$s['refno'];

$sale_date=$s['day'];
$time=date("h:i:a");

$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");

 $get_customer = mysqli_query($connection ,"SELECT * FROM kp_customers WHERE cust_id= '$cust_id'") or die(mysqli_error($connection));
 $cust = mysqli_fetch_assoc($get_customer);
 $name= $cust['name'];

$get_ret = "SELECT * FROM kp_ret  WHERE ret_id='$ret_id'";
$get_ret_r = mysqli_query($connection,$get_ret) or die("Could not fetch the order");
$s = mysqli_fetch_assoc($get_ret_r);
$order_t=$s['ret_amount']; 

$get_notes = "SELECT * FROM kp_note  WHERE ret_id='$ret_id'";
$get_notes_r = mysqli_query($connection,$get_notes) or die("Could not fetch the order");
 
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
<script>

function logout(){
  window.location = 'return.php';
}
</script>
 
<style>
p.page { page-break-after: always; }


</style>
<link href="../../assets/css/default/thermal_print.css" rel="stylesheet" />
<style type="text/css">
    
@media print {
  
</style>
   <!--  -->  
<body onload="logout();window.print()"> 
   <?php 
  if (isset($_GET['pet'])) {
    $petty_id=$_GET['pet'];
    $petty = mysqli_query($connection,"SELECT * FROM kp_petty WHERE petty_id='$petty_id'") or die("Could not fetch the petty Cash");
    $pet = mysqli_fetch_assoc($petty);
    ?>
    <div id="receipt"> 
        <div id="bord">
          <div id="receipt-header" class="text-center">
            <h1 class="title"><u><b>PETTY CASH VOUCHER</b></u></h1>
            <?php if ($row['show_logo']==1 ){ ?>
            <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>
            <?php } ?>
            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>
            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p> 

               <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>  
            <span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>DATE:&nbsp;<?php echo $today ; ?></b></span>
            <span class="pull-right"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>TIME:&nbsp;<?php echo $time ?></b></span>
             
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          </div>
          <div id="receipt-body">
             <table class="table table-bordered" id="deSo"> 
              <thead>
                <tr>
                  <th colspan="2" style="text-align: left;">RECIPIENT:&nbsp;<?PHP echo $pet['recipient']; ?></th>
                </tr>
              </thead>
              <tbody style=" font-family: Source Sans Pro;"> 
                <tr>
                  <td style="border-bottom: 0px #fff solid;">
                    <u style="text-align: right; font-weight: bolder;">Description</u>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" style="height: 50px;"><?PHP echo $pet['description']; ?></td>
                </tr>
                 
                <tr>
                  <td colspan="2"><h3>AMOUNT: <?php echo $pet['amount_given']; ?></h3></td>
                </tr>
                <tr> 
                  <td colspan="2"><b>Served By:&nbsp;<?php echo get_user($pet['raise_by']); ?></b></td>
                </tr>
                <tr> 
                  <td colspan="2"><b>Authorised By:&nbsp;<?php echo get_user($pet['app_by']); ?></b></td>
                </tr>
                <tr> 
                  <td colspan="2" style="height: 40px;">Recipient Sign:............................................</td>
                </tr>
              </tbody>
            </table>
                       
            </div>
            <div id="receipt-footer"> 
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
             
            </div> 
          </div>
        </div>

  <?php } ?>
  <P class="break"></P>
     <div id="receipt">
        <div id="results"></div>
        <?php
        $n=mysqli_fetch_assoc($get_notes_r);
            $note=$n['type'];
            $note_id=$n['note_id'];
          $cr_amount=$n['cr_amount'];
          $dr_amount=$n['dr_amount'];
        ?>
        <div id="bord">
          <div id="receipt-header" class="text-center">
            <h1 class="title"><u>
              <?php 
              if ( $note=='C') {
                echo "CREDIT NOTE";
              } elseif ($note=='D') {
                echo "DEBIT NOTE";
              }elseif ($note=='CD') {
                echo "CREDIT/DEBIT NOTE";
              }
              ?>
              
            </u></h1>
            <?php if ($row['show_logo']==1 ){ ?>
            <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>
            <?php } ?>
            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>
            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p>  
            <p style="margin: 0px 0px 0px 0px;">Email: <?php echo $gen['email']; ?></p> 
            <p style="margin: 0px 0px 0px 0px;">Website: <?php echo $gen['website']; ?></p>         
            <p style="margin: 0px 0px 0px 0px;">**********************************************************</p>
            <p style="margin: 0px 0px 0px 0px; "><?php echo $gen['address']; ?>,<BR> Cell: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR></P>
               <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>
            <?php if ($row['pin']==1 ){ ?>
             <span class="pull-left">PIN: <?php echo $gen['kra_pin']; ?></span> 
           <?php }?>
            <p style="margin: 0px 0px 0px 0px;">.</p>
            <span class="pull-left"> Served By: </strong><?php echo get_user($user_id); ?></span>
            <span class="pull-right"><b><?php echo $today; ?></b></span> <p style="margin: 0px 0px 0px 0px;">.</p>
             <span class="pull-left"> Customer: </strong><?php echo get_cust($cust_id); ?></span>
            <span class="pull-right"><b>NOTE No: <?php echo $note_id; ?></b></span>
            <span class="pull-left"> Sale ID: </strong><?php echo $sale_id; ?></span>
            <span class="pull-right"><b>Refno: <?php echo $refno; ?></b></span>
            <span class="pull-left"> Sale Date: </strong><?php echo $sale_date; ?></span>
            <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>
          </div>
          <div id="receipt-body">
         <table class="table table-bordered" id="deSo">
                 <div class="watermark">COPY</div>
            <thead>
              <tr style="font-size: 12px; font-weight: bold; text-align: center; ">
                <td>IMEI</td>
                <td>Item</td>
                <td>Qty</td>
                <td>price</td> 
                <td>Total</td>
                <td>Comments</td>
              </tr>
            </thead>
            <tbody style="text-align: justify;">
              <?php
              $order_t=0;
              $get_orders = "SELECT * FROM kp_ret_items  WHERE ret_id='$ret_id'";
              $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders ".mysqli_error($connection));
              while ($si = mysqli_fetch_assoc($get_orders_r)) {
                 $item_id = $si['item_id'];  
                 $imei = $si['imei'];  
                 $price = $si['price']; 
                 $qty=$si['qty'];
                 $total=$si['total']; 
                 $order_t=$order_t+$total;
                 ?>
                 <tr>
                  <td style="font-size: 11px;"><?php echo $imei; ?></td>
                  <td style="font-size: 11px;"><?php echo get_item($item_id); ?></td>
                  <td><?php echo number_format($qty,2); ?></td>
                  <td><?php echo number_format($price,2); ?></td> 
                  <td><?php echo number_format($total,2); ?></td>
                  <td><?php echo $si['ret_user_comment']; ?></td>
                </tr>
              <?php
               }
              ?>
            </tbody>
            <tfoot>
              <tr>
                <th colspan="4" class="text-center">TOTAL</th>
                <th><?php echo number_format($order_t,2); ?></th>
              </tr> 
            </tfoot>
          </table>
          <hr>
          <table>
            <tbody>
              <?php
              if ($cr_amount==0) {
              }else{
              ?>

              <tr>
                <td>CREDITED AMOUNT</td>
                <td><?php echo number_format($cr_amount,2); ?></td>
              </tr>
              <?php
              }
              if ($dr_amount==0) {
              }else{
                ?>
              <tr>
                <td>DEBITED AMOUNT</td>
                <td><?php echo number_format($dr_amount,2); ?></td>
              </tr>
              <?php
              }
              ?>
              <tr>
                <td colspan="2" class="text-center"><B>NOTE DECISION</B></td> 
              </tr>
               <tr> 
                <td colspan="2">
                <?php if ($decision=1) {
                  echo "STORE CREDIT RAISED";
                }elseif ($decision==2){
                  echo "PETTY CASH RAISED";
                }
                ?>
                </td>
              </tr>
              <tr>
                <td colspan="2" class="text-center"><B>SUPERVISOR COMMENTS</B></td> 
              </tr>
               <tr> 
                <td colspan="2">
                <?php 
                  echo $s['app_comment'];; 
                ?>
                </td>
              </tr>
            </tbody>
          </table>
        <hr>
            </div>
            <div id="receipt-footer">
              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"><b>THANK YOU</b></p>
              <p class="text-center" style="margin: 0px 0px 0px 0px;">
                <?php 
                if ( $note=='C') {
                  echo "CREDIT NOTE";
                } elseif ($note=='D') {
                  echo "DEBIT NOTE";
                } elseif ($note=='CD') {
                  echo "DEBIT/CREDIT NOTE";
                }
                ?>  RAISED</p>
              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>
              <p class="text-center" style="margin: 0px 0px 0px 0px; font-size: 11px;"> K-POS Designed & Distributed by K-SYSTEMS </BR> +254716100335 | +254735100335 .</p> 
            </div> 
          </div>
        </div>
        <?php
       // }
        ?>
      </div>
          
</body>  
