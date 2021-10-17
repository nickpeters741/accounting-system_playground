<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id']; 
$po_id=$_REQUEST['id']; 
$action="LOADED SUSPEND MODAL FOR PURCHASE ORDER NO | ";
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM RECEVING PURCHASE NUMBER <?php echo $po_id; ?></h4>
    </div>
    <div class="modal-body">
    	 <table id="data-table-combine" class="table table-striped table-bordered">
                <thead>
                  <tr> 
                    <th>No</th>
                    <th>ITEM</th>  
                    <th>ORDERED QTY</th> 
                    <th>RECEIVED QTY</th> 
                    <th>BALANCE</th>    
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $no=0;
                  $pending_orders = mysqli_query($connection,"SELECT * FROM kp_po_items WHERE po_id='$po_id'") or die("Could not fetch the purchase orders");
                  if (mysqli_num_rows($pending_orders) < 1) {
                    ?>
                    <tr>
                      <td colspan="7">ALL ITEMS HAVE BEEN RECEIVED</td>
                    </tr>
                    <?php 
                  }else{ 
                    while ($row = mysqli_fetch_assoc($pending_orders)) { 
                      $id = $row['item_id'];  
                      $qty = $row['qty'];  
                      $rec_qty = $row['rec_qty']; 
                      $no=$no+1;
                      ?>
                      <tr> 
                        <td><?php echo $no; ?></td>
                        <td><?php echo get_item($id); ?></td> 
                        <td><?php echo $qty; ?></td>
                        <td><?php echo $rec_qty; ?></td>
                        <td><?php echo $qty-$rec_qty; ?></td>  
                      </tr>
                      <?php
                    }
                  }
                  ?>
                </tbody>
              </table>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">No</button>
        <a class="btn btn-lime btn-xs"  href="init_rec_act.php?id=<?php echo $po_id; ?>">Yes</a>
    </div>
</div>