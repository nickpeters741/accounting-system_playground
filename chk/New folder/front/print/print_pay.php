<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];
$pay_id=$_GET['id']; 
$time=date("h:i:a");
$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);
$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);
$nos=59;
$cust_id=  get_column('kp_sale_payment','cust_id',"pay_id='$pay_id'");
                            
?>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="../../assets/css/default/thermal_print.css" rel="stylesheet" />
<script>
function redirect(){
    window.location = '../payment/cust_bal.php';
  }
</script>  
</head>
<!-- Main section-->
<!--  onload="redirect(); window.print()"   -->
<body>
  <div id="receipt">
    <div id="results"></div>
    <div id="bord">
      <div id="receipt-header" class="text-center">
        <h1 class="title"><u><b>CREDIT PAYMENT RECEIPT</b></u></h1>
        <?php if ($row['show_logo']==1 ){ 
          ?>
          <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>
        <?php } ?>
        <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>
        <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p>  
        <p style="margin: 0px 0px 0px 0px;">Email: <?php echo $gen['email']; ?></p> 
        <p style="margin: 0px 0px 0px 0px;">Website: <?php echo $gen['website']; ?></p> 
        <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
        <p style="margin: 0px 0px 0px 0px; ">
          <?php echo $gen['address']; ?>,<BR> Cell: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR>
        </P>
        <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
        <span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>Customer:&nbsp;</b><?php echo get_cust($cust_id); ?></span><br>
        <span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>Payment No.:&nbsp;</b><?php echo $pay_id; ?></span>
        <span class="pull-right"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>Served By:&nbsp;</b><?php echo get_user($user_id); ?></span><br>
        <span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>DATE:&nbsp;</b><?php echo  get_column('kp_sale_payment','pay_date',"pay_id='$pay_id'"); ?></span>
        <span class="pull-right"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>TIME:&nbsp;</b><?php echo $time ?></span>
        <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
      </div>
      <div id="receipt-body">
        <table class="table table-bordered" id="deSo">
          <thead>
            <tr style="font-size: 16px; font-weight: bold;">
              <td>Invoice No:</td>
              <td colspan="2">Amount</td>
            </tr>
          </thead>
          <tbody style=" font-family: Source Sans Pro; text-align: justify;">
            <?php
            $get_paid = mysqli_query($connection ,"SELECT sale_id,amount FROM kp_sale_cred_pay_hist WHERE pay_id= '$pay_id'") or die(mysqli_error($connection));
            while ($cust=mysqli_fetch_assoc($get_paid)) {
              $amount = $cust['amount']; 
              $sale_id=$cust['sale_id'];
              ?>
              <tr>
                <td><?php echo $sale_id; ?></td>
                <td colspan="2"><?php echo $amount; ?></td>

                             

                          </tr>

                        <?php

                         }

                        ?>

                      </tbody>

                      </table>

                      <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>

                      <table>

                        <thead>

                          <tr>

                            <th colspan="3">AMOUNT BREAK DOWN</th>

                          </tr>

                          <tr>

                            <th>MODE</th> 

                            <th>AMOUNT</th> 

                            <th>CODE</th> 

                          </tr>

                        </thead>

                        <tbody>  

                        <?php

                        $get_pay = mysqli_query($connection ,"SELECT * FROM kp_sale_payment WHERE pay_id= '$pay_id'");

                        $pow=mysqli_fetch_assoc($get_pay);



                        $get_sc = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE del_status=2") or die("Could not get the payment modes");



                        while ($row=mysqli_fetch_assoc($get_sc)) {

                          $has_ref=$row['has_ref']; 

                            if ($pow['mode'.$row['pay_id']]==0) {}else{

                          ?>

                        <tr>

                          <td><?php echo $row['name']; ?></td>
                          <td><?php echo $pow['mode'.$row['pay_id']]; ?></td>
                          <td><?php if ($has_ref==1) {

                            echo $pow['moderef'.$row['pay_id']];

                          }else{echo "-"; }  ?></td>

                        </tr>

                        <?php

                 } }

                  ?>       

                        <tr>

                          <th class="text-right">Balance</th>

                          <th colspan="2"> KShs: 
                            <?php echo  get_column('kp_customers','bal',"cust_id='$cust_id'"); ?>/=  </th>



                        </tr> 

                      </tbody>

          </table> 

            </div>

            <div id="receipt-footer"> 

              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>

             <?php //} ?>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"><b>THANK YOU</b></p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"><?php echo $row['thankyou_note'];?></p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"> This is not an ETR. Request one</p> 

              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>

              <p class="text-center" style="margin: 0px 0px 0px 0px; font-size: 11px;"> K-POS Designed & Distributed by K-SYSTEMS </BR> +254716100335 | +254735100335 .</p> 

            </div> 

          </div>

        </div>

      </div>                      

 </div>

</body>

</html>

