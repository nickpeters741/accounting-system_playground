<?php 
include('../../inc/connection.php'); 
 
if(isset($_POST['search'])){
	$no=0;
    $search = $_POST['search'];
    $pay_id = $_POST['id'];
    $has_change = $_POST['change'];
    $get_menu = mysqli_query($connection,"SELECT * FROM split_message WHERE phone like'%".$search."%' AND status=2") or die("Could not get the customer invoices with balances". mysqli_error($connection));
    while ($mat = mysqli_fetch_assoc($get_menu)) {
        $name=$mat['name'];
        $code=$mat['code'];
        $amount=$mat['amount'];
        $time=$mat['time'];
        ?>
        <tr>
          <td>  
            <input onclick="sel<?php echo $pay_id; ?>()" type="checkbox" name="pay-sale[]"  value="<?php echo $amount ?>" data-value1="<?php echo $code ?>" class="bulk" />
          </td>
          <td><?php echo $code; ?></td>
          <td><?php echo $name; ?></td>
          <td><?php echo $amount; ?></td>
          <td><?php echo $time; ?></td> 
        </tr>
        <?php
    } 
}
 
?>  