<?php 
include('../../inc/connection.php'); 
 
if(isset($_POST['search'])){
	$no=0;
    $search = $_POST['search'];
    $query = "SELECT * FROM kp_items WHERE name like'%".$search."%' OR stock_code like'%".$search."%'"; //OR barcode like '%".$search."%'
    $result = mysqli_query($connection,$query);
    while($row = mysqli_fetch_array($result) ){
    	$no=$no+1;
    ?>
    <tr>
    	<td><?php echo $no; ?></td>
        <td><?php echo $row['name']; ?></td>
        <td><?php echo $row['qty']; ?></td>
        <td><?php echo $row['bprice']; ?></td>
        <td><?php echo $row['wprice']; ?></td>
        <td><?php echo $row['sprice']; ?></td> 
    </tr>
    <?php  
    } 
}
 
?> 