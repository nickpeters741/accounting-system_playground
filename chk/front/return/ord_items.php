<?php
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php'); 
$sum=0;
$ord = $_REQUEST['ord'];
$check_sale = mysqli_query($connection , "SELECT * FROM kp_sales WHERE sale_id='$ord' ") or die(mysqli_error($connection));
$row = mysqli_fetch_assoc($check_sale); 
$type = $row['type'];
$sale_id = $row['sale_id'];

if ($type==1) {
   $type="CASH";
}elseif($type==2){
    $type="CREDIT";
}

 ?> 
  <div class="panel  col-md-12">   
        <?php 
            if (empty($row)) {
               echo "No such Order";
            }else{ 
            ?> 
            <table class="table table-bordered" id="TheSo"  style="font-size: 18px;">
         <!--  <thead>
                <tr>
                    <th colspan="2">ORDER <?php echo $sale_id; ?> DETAILS(<?PHP echo $type; ?>)</th> 
                </tr>
            </thead>  -->
            <tbody>

                <?php
                    $refno=$row['refno'];
                    $cust_id = $row['cust_id'];
                    $user_id=$row['user_id'];
                    $day=$row['day'];
                    $amount=$row['sale_amount'];
                      
                ?>
                <input type="hidden" id="sale_id" value="<?php echo $sale_id; ?>">
                <input type="hidden" id="cust_id"  value="<?php echo $cust_id; ?>"> 
                 <tr>
                    <td><b>Customer:</b></td>
                    <td><b><?php echo get_cust($cust_id); ?></b></td> 
                </tr>
                 <tr>
                    <td><b>Order By:</b></td>
                    <td><b><?php echo get_user($user_id); ?></b></td> 
                </tr>
                <tr>
                    <td><b>Date:</b></td>
                    <td><b><?php echo $day; ?></b></td> 
                </tr>
                <tr>
                    <td><b>Order Amount:</b></td>
                    <td><b><?php echo $amount; ?></b></td> 
                </tr>
            </tbody>
        </table> 
        <div class="footer"> 
           <a   data-toggle="modal" data-target="#ret-modal" onclick="confirm_ord();"   name="filter" class="btn btn-lime btn-xs">CONFIRM &nbsp;<i class="far fa-check-circle fa-1x"></i></a> 
        </div>
              <?php
              }
            ?> 
    </div>

    <script>
        function confirm_ord() {
            var ord = $("#sale_id").val();  
            var cust_id = $("#cust_id").val();
            console.log(cust_id); 
            $.post("confirm_sale.php", {id: ord,cust_id:cust_id},
                function (data) {
                $('#ret-load').html(data);   
                });
        }
 
    </script>    