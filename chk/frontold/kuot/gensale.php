<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php'); 
$user_id = $_SESSION['user_id'];
$qt_id = $_REQUEST['id'];

$action="LOADED|-|-|-|CONFIRM GENERATE SALE FROM QUOTE NO|".$qt_id;
logs($action,"../../");  
?>
<div class="modal-content">
	<div class="modal-header"> 
        <h4 class="modal-title">GENERATE SALE FROM QUOTE NO <?php echo $qt_id; ?></h4>
    </div>
    <div class="modal-body" style="overflow-y:scroll; max-height: 400px; width: auto; "> 
        <table class="table table-bordered" id="TheSo">
            <thead> 
                <tr>
                    <th>No:</th> 
                    <th>Item Name</th>
                    <th>Quantity</th> 
                    <th>Price</th>  
                    <th>Amount</th>  
                    <th>Current Stock</th>               
                </tr>
            </thead>
            <tbody>
                <?php 
                $requisitions = mysqli_query($connection,"SELECT * FROM kp_qt_items WHERE  qt_id='$qt_id'") or die(mysqli_error($connection));
                while ($row = mysqli_fetch_assoc($requisitions)) {
                    $item_id = $row['item_id']; 
                    $no=$no+1;
                    $amount=$row['total'];
                    $total=$total+$amount; 
                    if ($row['qty']>get_column('kp_items','qty',"item_id='$item_id'")) {
                        $color="red";
                    }else{
                        $color="black"; 
                    }
                    ?>
                <tr style="color:<?php echo $color; ?>">
                    <td><?php echo $no; ?></td> 
                    <td><?php echo get_item($item_id); ?></td>
                    <td><?php echo $row['qty']; ?></td>  
                    <td><?php echo $row['price'];  ?></td> 
                    <td><?php echo $amount ?></td>
                    <td style="color:blue"><?php echo get_column('kp_items','qty',"item_id='$item_id'"); ?></td>
                     
                </tr>
                <?php
                 }
                ?>
            </tbody> 
        </table>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
        <a class="btn btn-lime btn-xs"  href="hold.php">Generate Sale</a>
    </div>
</div>