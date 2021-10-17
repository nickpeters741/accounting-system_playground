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
            <th>Payment Name</th> 
            <th>Bank to Affect</th>
            <th>Button Color</th>
            <th>Has REF</th>
            <th>Give Change</th>
            <th>Creation Time</th>
            <th>Created By</th>
            <th>Action</th>  
          </tr>
        </thead>
        <tbody>
          <?php
            $get_order = "SELECT * FROM kp_pay_mode WHERE  del_status=2";
            $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the orders");
            $order_no = mysqli_num_rows($get_order_r);
            while ($o = mysqli_fetch_assoc($get_order_r)) {
              $bank_id = $o['bank_id'];
              $name = $o['name'];
              $btn_color = $o['btn_color']; 
               $datime = $o['datime'];
               $created_by = $o['created_by'];
               if ($o['has_ref']==1) {
                   $ref="YES";
                 } elseif ($o['has_ref']==2) {
                   $ref="NO";
                 } else{
                    $ref="ERROR";
                 }

                 if ($o['has_change']==1) {
                   $change="YES";
                 } elseif ($o['has_change']==2) {
                   $change="NO";
                 } else{
                    $change="ERROR";
                 }
            ?>
            <tr style="color: #373a3c;" id="row<?php echo $o["pay_id"]; ?>">
              <td><?php echo $name; ?></td> 
              <td><?php echo get_bank($bank_id); ?></td> 
              <td><?php echo $btn_color; ?></td>
              <td><?php echo $ref; ?></td> 
              <td><?php echo $change; ?></td>  
              <td><?php echo $datime; ?></td>
              <td><?php echo $created_by; ?></td>
              <td class="with-btn-group" nowrap>
                <div class="btn-group">
                  <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                  <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu pull-right">
                    <li><a data-toggle="modal" data-target="#pay-modal" data-id="<?php echo $o["pay_id"]; ?>" onclick="pay_edits('<?php echo $o["pay_id"]; ?>');" id="pay-edit" >Edit</a></li>
                    <li><a data-toggle="modal" data-target="#pay-modal" data-id="<?php echo $o["pay_id"]; ?>" onclick="pay_dis('<?php echo $o["pay_id"]; ?>');" id="dis" >Disable</a></li> 
                  </ul>
                </div>
              </td>
            </tr>
            <?php
            }
            ?>
          </tbody>
        </table>
