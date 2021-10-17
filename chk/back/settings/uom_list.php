<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php'); 
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
  <script type="text/javascript">
   
 </script>
<table class="table" id="users" >
  <thead>
    <tr>
    <th>No.</th> 
      <th>Name</th> 
      <th>Qty</th>  
      <th>Action</th>  
    </tr>
  </thead>
  <tbody>
    <?php
    $no=0;
      $get_order = "SELECT * FROM kp_uom";
      $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the Tax List");
      $order_no = mysqli_num_rows($get_order_r);
      while ($o = mysqli_fetch_assoc($get_order_r)) {
        $uom_id = $o['uom_id'];
        $name = $o['name'];
        $qty = $o['qty'];  
        $no=$no+1; 
      ?>
      <tr style="color: #373a3c;" id="row<?php echo $o["pay_id"]; ?>">
        <td><?php echo $no; ?></td>  
        <td><?php echo $name; ?></td>  
        <td><?php echo $qty; ?></td>  
        <td class="with-btn-group" nowrap>
          <div class="btn-group">
            <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
            <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu pull-right">
              <li><a data-toggle="modal" data-target="#modal" onclick="uom_edit('<?php echo $o["uom_id"]; ?>');" id="pay-edit" >Edit</a></li>
              <!-- <li><a data-toggle="modal" data-target="#modal" onclick="tax_dis('<?php echo $o["tax_id"]; ?>');" id="dis" >Disable</a></li>  -->
            </ul>
          </div>
        </td>
      </tr>
      <?php
      }
      ?>
    </tbody>
  </table>
