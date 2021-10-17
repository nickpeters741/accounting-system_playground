<?php
session_start();
include('../../inc/connection.php');
$user_id=$_SESSION['user_id'];
$filename=$_FILES["file"]["tmp_name"];
if($_FILES["file"]["size"] > 0){
    $tmp_name = $_FILES['file']['tmp_name'];
    date_default_timezone_set("Africa/Nairobi");
    // $newname = date('Y-m-d H:i:s').".".$ext;
    $name = basename($_FILES["file"]["name"]);
    $ext = strtolower(pathinfo($name,PATHINFO_EXTENSION));
    $targetPath = "uploads/".date('dmYHis').".".$ext;   // move_uploaded_file($tmp_name, "$uploads_dir/$name");
   
    $file = fopen($filename, "r");
    $no=0;
    while (($emapData = fgetcsv($file, 10000, ",")) !== FALSE){
        if ($no==0) { 
        }else{ 
               //It wiil insert a row to our subject table from our csv file`
            $name=$emapData[1];
            if (empty($name)) {}else{
                $sql = "INSERT INTO kp_items(stock_code,name,base_price,sprice,wprice,bprice,reorder,qty) VALUES('" . $emapData[0] . "','" . $name. "','" . $emapData[2]. "','" . $emapData[3]. "','" . $emapData[4]. "','" . $emapData[5]. "','" . $emapData[6]. "','" . $emapData[7]. "')"; 
                $result = mysqli_query( $connection, $sql );
                if(! $result ){
                    ?>
                    <div class="alert alert-danger">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong><?php echo $emapData[1]; ?> Did not insert!!! <?php echo mysqli_error($connection); ?></strong> 
                    </div>
                    <?php 
                }else{
                    $item_id = mysqli_insert_id($connection);
                    $transact="ITEM IMPORTED";
                    $track=mysqli_query($connection,"INSERT INTO kp_item_hist(item_id,transaction,user_id,day) VALUES('$item_id','$transact','$user_id',CURRENT_DATE)") or die("Could not track the item");
                }
            }
       }
       $no=$no+1; 
    }
    fclose($file);
    if (move_uploaded_file($tmp_name, $targetPath)) {
    }
    ?>
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Data imported successfully!</strong> 
    </div>
    <table id="data-table-combine" class="table table-striped table-bordered">
            <thead>
                <th>Item id</th>
                <th>Stock Code</th>
                <th>Name</th>
                <th>Category</th>
                <th>Buying Price</th>
                <th>Base Price</th>
                <th>Shop Price</th>
                <th>Online Price</th>
                <th>Reorder Level</th>
                <th>Stock Level</th>
                <th>Action</th>
            </thead>
            <tbody>
                 <?php
                 $start_id=$item_id-$no;
                 $get_items = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id BETWEEN '$start_id' AND '$item_id'") or die("Could not get any items");
                 foreach ($get_items  as $row) {
                 ?>
                <tr id="row<?php echo $row['item_id'];?>">
                    <td><?php echo $row['item_id'];?></td> 
                    <td class="code" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo strtoupper($row['stock_code']); ?></td> 
                    <td class="name" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo strtoupper($row['name']); ?></td> 
                    <td id="cat<?php echo $row["item_id"]; ?>"> 
                        <a data-toggle="modal" data-target="#modal" name="cat<?php echo $row["item_id"]; ?>" data-id="<?php echo $row["item_id"]; ?>" id="cat_edit" class="btn btn-xs btn-warning" style="width: 150px;"><?php  echo $row['cat_id'];//get_cat(); ?></a>
                    </td>
                    <td class="bprice" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['bprice']; ?></td>  
                    <td class="base" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['base_price']; ?></td>
                    <td class="wprice" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['online']; ?></td>
                    <td class="sprice" data-id1="<?php echo $row["item_id"]?>" contenteditable><?php echo $row['shop']; ?></td> 
                    <td><?php echo $row['reorder']; ?></td> 
                    <td><?php echo $row['qty']; ?></td> 
                    <td class="with-btn-group" nowrap>
                        <div class="btn-group">
                            <a href="#" class="btn btn-purple btn-xs width-60">Actions</a>
                            <a href="#" class="btn btn-purple btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a data-toggle="modal" data-target="#prods-modal" data-id="<?php echo $row["item_id"]; ?>" id="prods-del">Discontinue Item</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <?php
            }
            ?>
            </tbody>
    </table>
    <script type="text/javascript">
        TableManageCombine.init();
    </script>
    <?php 
    //close of connection
    mysqli_close($connection);
}
?>