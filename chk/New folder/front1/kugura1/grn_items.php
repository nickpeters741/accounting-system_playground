<?php 
session_start();

include('../../inc/connection.php');  

include('../../inc/gen_funcs.php'); 



$grn_id = $_REQUEST['id'];

$no=0;

$total=0;

?><style type="text/css">

 

.qty{  

  border: 0;

  min-width: 15%;

  width: auto;

  border: 1px solid #efefef;

  text-align: center;

  border: 1px solid #d3d8de;

  box-shadow: none;

  font-size: 12px;

  line-height: 1.42857143;

  height: 25px;

  padding: 6px 12px;

}

 

    

 </style>

 <div class="modal-content">

   <div class="modal-body">

<table class="table table-invoice">

        <thead>

          <tr>

            <th colspan="5">GRN NO: <?php echo $grn_id; ?></th>

          </tr>

          <tr>

            <th>No:</th>

            <th>Item Name</th> 

            <th>Quantity</th> 

          </tr>

        </thead>

        <tbody>

        <?php   

          $get_orders = "SELECT * FROM kp_grn_items  WHERE grn_id='$grn_id' ";

          $get_orders_r = mysqli_query($connection,$get_orders) or die("Could not fetch the orders");

            while ($s = mysqli_fetch_assoc($get_orders_r)) {

             $no=$no+1;

             $item_id = $s['item_id'];

             $qty = $s['qty'];  

        ?>

          <tr>

            <td><?php echo $no; ?></td>

            <td><?php echo get_item($item_id); ?></td> 

            <td><?php echo $qty; ?></td> 

          </tr>

        <?php

         }

        ?>

        </tbody> 

      </table>

</div>

 </div>