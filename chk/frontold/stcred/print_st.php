<?php
session_start();
  include('../../inc/connection.php'); 
  include('../clude/funcs.php');

$username = $_SESSION['username'];
$user_id = $_SESSION['user_id'];
 
$amount=$_GET['amount'];
$cust_id=$_GET['cust_id'];

$time=date("h:i:a");
$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");
$row = mysqli_fetch_assoc($get_thermal_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");
$gen = mysqli_fetch_assoc($get_gen_details);
$nos=59;
 
  ?><!DOCTYPE html>
<html lang="en">

<head>
  
   
</head>
<script>
     function redirect(){
  window.location = '../stcred/stc_list.php';
}
   </script>
<link href="../../assets/css/default/thermal_print.css" rel="stylesheet" />


   
<!-- Main section-->
 <!--     -->
  <body onload="redirect();window.print()">
   <div id="receipt">
        <div id="results"></div>
        <div id="bord">
          <div id="receipt-header" class="text-center">
            <h1 class="title"><u><b>STORE CREDIT PAYMENT RECEIPT</b></u></h1>
            <?php if ($row['show_logo']==1 ){ ?>
            <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>
            <?php } ?>
            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>
            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p> 

               <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>

            <p style="margin: 0px 0px 0px 0px;">Email: <?php echo $gen['email']; ?></p> 
            <p style="margin: 0px 0px 0px 0px;">Website: <?php echo $gen['website']; ?></p>    
            <p style="margin: 0px 0px 0px 0px; "><?php echo $gen['address']; ?>,<BR> Cell: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR></P>
                 
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p><span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>Customer:&nbsp;</b><?php echo get_cust($cust_id); ?></span>
            <span class="pull-right"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>Served By:&nbsp;</b><?php echo get_user($user_id); ?></span><br>
            <span class="pull-left"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>DATE:&nbsp;</b><?php echo $today ; ?></span>
            <span class="pull-right"  style="padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><b>TIME:&nbsp;</b><?php echo $time ?></span>
             
            <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
          </div>
          <div id="receipt-body">
             <table class="table table-bordered" id="deSo"> 
                                <tbody style=" font-family: Source Sans Pro; text-align: justify;"> 
                           <tr > 
                            <td><h2>AMOUNT</h2></td>
                            <td><h2>KShs. <?php echo $amount; ?></h2></td>
                             
                          </tr> 
                      </tbody>
                      </table>
                       
            </div>
            <div id="receipt-footer"> 
              <p style="margin: 0px 0px 0px 0px;"><?php sep($nos) ?></p>
             <?php //} ?>
              <p class="text-center" style="margin: 0px 0px 0px 0px;"><b>THANK YOU</b></p>
             <!--  <p class="text-center" style="margin: 0px 0px 0px 0px;"><?php echo $row['thankyou_note'];?></p> -->
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
