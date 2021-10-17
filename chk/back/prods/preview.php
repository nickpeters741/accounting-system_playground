<?php
session_start();
include('../../inc/connection.php');
$user_id=$_SESSION['user_id']; 
$filename=$_FILES["file"]["tmp_name"];
if($_FILES["file"]["size"] > 0){ 
    $file = fopen($filename, "r");
    $no=0;
    ?>
    <table id="data-table-combine" class="table table-striped table-bordered">
        <thead>
            <th>Stock Code</th>
            <th>Name</th>
            <!-- <th>Category</th> -->
            <th>Buying Price</th>
            <th>Base Price</th>
            <th>Shop Price</th>
            <th>Online Price</th>
            <th>Reorder Level</th>
            <th>Stock Level</th>
            <!-- <th>Action</th> -->
        </thead>
        <?php
        while (($emapData = fgetcsv($file, 10000, ",")) !== FALSE){
            if ($no==0) { 
            }else{ 
                $name=$emapData[1]; 
                if (empty($name)) {
                }else{ 
                ?>
                <tr>
                    <td contenteditable><?php echo strtoupper($emapData[0]); ?></td> 
                    <td contenteditable><?php echo strtoupper($emapData[1]); ?></td> 
                    <td><?php echo strtoupper($emapData[2]); ?> </td> 
                    <td><?php echo strtoupper($emapData[3]); ?> </td> 
                    <td><?php echo strtoupper($emapData[4]); ?> </td> 
                    <td><?php echo strtoupper($emapData[5]); ?> </td> 
                    <td><?php echo strtoupper($emapData[6]); ?> </td> 
                    <td><?php echo strtoupper($emapData[7]); ?> </td> 
                </tr>
                <?php
                }
            }
            $no=$no+1;
        }
        ?>
        </tbody>
    </table>
     <script type="text/javascript">
        TableManageCombine.init();
     </script>
     <?php
    fclose($file);
    mysqli_close($connection); 
    }
?>