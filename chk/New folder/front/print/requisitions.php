       <br>
       <table id="data-table-combine" class="table table-striped table-bordered">
                <thead>
                  <tr> 
                    <th colspan="4"><?php echo $today; ?> REQUISITIONS</th>   
                  </tr>
                  <tr> 
                    <th>REQ Number</th>  
                    <th>Order By</th> 
                    <th>Status</th> 
                    <th>Type</th>  
                  </tr>
                </thead>
                <tbody>
          <?php
          $pending_orders = mysqli_query($connection,"SELECT * FROM kp_req WHERE req_date='$today'") or die("Could not fetch the purchase orders");
            if (mysqli_num_rows($pending_orders) < 1) {
              ?>
              <tr>
                <td colspan="7">There are no raised Purchase orders today</td>
              </tr>
              <?php 
            }else{ 
                  while ($row = mysqli_fetch_assoc($pending_orders)) { 
                    $id = $row['req_id'];  
                    $user_id = $row['req_user'];
                    $rec_status = $row['rec_status'];  
                    $stock_status = $row['s2s']; 
                    $type = $row['req_type']; 
                    if ($type==1) {
                      $type="ON DEMAND REQUISITION";
                    }  else{
                      $type="STOCK OUT REQUISITION";
                    }
                    ?>
                    <tr> 
                      <td><?php echo $id; ?></td>  
                      <td><?php echo get_user($user_id); ?></td> 
                      <td>
                        <?php 
                        if ($rec_status==2) {
                          echo "PENDING RECEIVE";
                        }elseif ($rec_status==1 AND $stock_status==2) {
                          echo "PENDING SEND TO STORE";
                        }elseif ($rec_status==1 AND $stock_status==1) {
                          echo "COMPLETELY PROCESSED";
                        } ?>
                      </td>
                    <td><?php echo $type; ?></td>  
                    </tr>
                    <?php
                  }
                  }
                  ?>
                </tbody>
              </table>