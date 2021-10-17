<?php
session_start();
include('../../inc/connection.php');
include('sale_funcs.php'); 
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$sale_id = $row['sale_id']; 
?> 
<style type="text/css">
 
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
      <table class="table" id="users" >
        <thead>
          <tr>
            <th>No.</th>
            <th>Item Name</th>
            <th>Qty</th>
            <th>Price</th> 
            <th>Disc</th> 
            <th>Amount</th>
            <div  id="hidetd"><th>Action</th></div>
          </tr>
        </thead>
        <tbody>
          <?php
          $no=0;
            $get_order = "SELECT * FROM kp_sale_items WHERE  sale_id='$sale_id' ORDER BY id DESC";
            $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the orders");
            $order_no = mysqli_num_rows($get_order_r);
            while ($o = mysqli_fetch_assoc($get_order_r)) {
              $item_id = $o['item_id'];
              $id = $o['id'];
              $price = $o['price'];
              $qty = $o['qty']; 
              $uom_id = $o['uom']; 
              $disc = $o['disc']; $no=$no+1; 
            ?>
            <tr style="color: #373a3c;" id="row<?php echo $item_id; ?>">
              <td> <?php  echo $no; ?> </td>
              <td><?php echo get_item($item_id); ?></td>  
              <td>
                <div class="input-group"> 
                  <input type="number" step="1" min="1" max="" name="quantity" value="<?php echo $qty; ?>" title="Qty" id="<?php echo "btn".$id; ?>" class="input-text qty text" size="6" pattern="" inputmode="" onfocus="showbtn();">&nbsp;
                  <div class="input-group-prepend <?php echo "btn".$id; ?> btn-div" style="display: none;"  id="">
                    <a  class="btn btn-success" onclick="updateqty(<?php echo $id; ?>);"  style="height: 25px;"><i style="font-size: 18px;  margin: -2px -2px -2px -2px ;" class='fa fa-sm fa-check' ></i> </a>   
                  </div>
                </div>
              </td> 
              <!-- <td>
                <div class="input-group"> 
                  <input type="text" name="price" value="<?php echo $price; ?>" title="price" id="<?php echo "btnprice".$item_id; ?>" class="input-text price text" onfocus="price_btn();">&nbsp;
                  <div class="input-group-prepend <?php echo "btnprice".$item_id; ?> btn-price" style="display: none;"  id="">
                    <a  class="btn btn-success" onclick="updateprice(<?php echo $item_id; ?>);"  style="height: 25px;"><i style="font-size: 18px;  margin: -2px -2px -2px -2px ;" class='fa fa-sm fa-check' ></i> </a>   
                  </div>
                </div>
              </td> -->
              <td> <?php  echo $price; ?> </td>  <!-- -->
              <td>
                <div class="input-group"> 
                  <input type="text" value="<?php echo $disc; ?>" id="<?php echo "btndisc".$item_id; ?>" class="qty" onfocus="disc_btn();">&nbsp;
                  <div class="input-group-prepend <?php echo "btndisc".$item_id; ?> btn-disc" style="display: none;"  id="">
                    <a  class="btn btn-success" onclick="updatedisc(<?php echo $item_id; ?>);"  style="height: 25px;"><i style="font-size: 18px;  margin: -2px -2px -2px -2px ;" class='fa fa-sm fa-check' ></i> </a>   
                  </div>
                </div>
              </td>
              <td><?php echo $o['total']; ?></td>
              <td><a onclick="del_this('<?php echo $id; ?>')" ><i class="fa fa-trash"></i></a></td> 
            </tr>
            <?php
            }
            ?>
            
            <tfooter class="table-inverse">
              <tr style="color: #373a3c; ">
                <th colspan="4" style="font-size: 20px; font-weight: 600px; text-align: center;">TOTAL</th>
                <th style="font-size: 20px; font-weight: 600px;" id="ttt">
                  <?php
                      $get_sum = mysqli_query($connection,"SELECT SUM(total) AS ttt FROM kp_sale_items WHERE  sale_id='$sale_id' ");
                      $s = mysqli_fetch_assoc($get_sum);
                        echo $s['ttt'];
                  ?>
                </th>
                <th></th>
              </tr>
            </tfooter>
          </tbody>
        </table>
 