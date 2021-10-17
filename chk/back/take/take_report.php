<?php
include('../clude/head.php'); 
$day = mysqli_real_escape_string($connection,$_GET['start_date']);
$no=0;

$sales = mysqli_query($connection,"SELECT * FROM stock_take WHERE shift='$day'");
if (mysqli_num_rows($sales) < 1) {
    ?> 
    <p>Stock was not taken this day</p>
    <?php
}else{
?>

    <body>
  <!-- begin #page-loader -->
  <div id="page-loader" class="fade show"><span class="spinner"></span></div>
  <!-- end #page-loader -->
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #menu -->
    <?php include("../includes/menu.php") ?>
    <!-- end #menu -->
<!-- begin #content -->
		<div id="content" class="content">

		
			

			<!-- begin row -->
			<div id="stats"></div>
             <?php
                        if (isset($_GET['msg'])) {
                            if ($_GET['msg'] == 1) {
                                ?>
                                <div class="alert alert-warning">
                                    <p>Receiving finished</p>
                                </div>
                                <?php
                            }
                        }
                        ?>
			
            <!-- /.row -->
			<div class="row" >
				<!-- begin col-8 -->
                <div class="col-md-12">
                    <div class="panel panel-success" data-sortable-id="index-1" style="margin-top: 10px;">
                        <div class="panel-heading">
                            <h4 class="panel-title">PENDING PURCHASE ORDERS LIST</h4>
                        </div>                       
                        <div class="panel-body"> 
                            <table class="table" style="margin-left: 5px; margin-right: 10px;">
                       <thead> 
                         <tr style="border-top:2px solid #000;">
                            <th style="width: 10px;">NO</th>
                             <th style="width: 100px;">ITEMS</th>
                             <!-- <th style="width: 50px;">YESTER CLOSING</th> -->
                             <th style="width: 50px;">OPENING STOCK</th>
                             <!-- <th style="width: 50px;">VARIANCE</th> -->
                             <th style="width: 50px;">ISSUES</th>
                             <th style="width: 50px;">TOTAL</th>
                             <th style="width: 50px;">CLOSING STOCK</th>
                             <th style="width: 50px;">TOTAL OUT</th>
                             <th style="width: 50px;">SELLING PRICE</th>
                             <th style="width: 50px;">SALES</th>
                             <th style="width: 50px;" class="hidden-print" >Status</th> 
                         </tr>
                       </thead>
                        <tbody style="font-size: 10px;">
                          <?php
                           
                            while ($sa = mysqli_fetch_assoc($sales)) {
                                $take_id= $sa['take_id'];
                                $item_id= $sa['item_id'];
                                $yester_closing= $sa['yester_closing'];
                                $counted_stck = $sa['counted_stck'];
                                $sys_closing=$sa['sys_closing'];
                                $shift = $sa['shift']; 
                                $status= $sa['status'];
                                $variance=  $counted_stck- $yester_closing;
                                if ($variance==0 && $status==2) {
                                    $color="#63bf7b";
                                }elseif ($variance!=0 && $status==2) {
                                    $color="red;";
                                }elseif ($variance!=0 && $status==3) {
                                    $color="Orange;";
                                }
 
                            $total_out = mysqli_query($connection,"SELECT SUM(qty) AS out_qty FROM stock_track WHERE status='OUT' AND item_id='$item_id' AND shift='$day'") or die("Could not fetch the quantity out");
                            $rowout = mysqli_fetch_assoc($total_out);
                                    $totalout = $rowout['out_qty'];
                                    if ($totalout==0) {
                                        $totalout=0;
                                    }else{
                                        $totalout = $totalout;
                                    }
                            $total_in = mysqli_query($connection,"SELECT SUM(qty) AS in_qty FROM stock_track WHERE status='IN_BUY' AND item_id='$item_id' AND shift='$shift'") or die("Could not fetch the total quantity in");
                                    $rowin = mysqli_fetch_assoc($total_in);
                                    $totalin = $rowin['in_qty'];
                                    if ($totalin==0) {
                                        $totalin=0;
                                    }else{
                                        $totalin = $rowin['in_qty'];
                                    }

                                    $stock_total=$counted_stck+$totalin;

                                  $price=get_price($item_id);


                                ?>
                                <tr>
                                    <td><?php echo $no=$no+1; ?></td>
                                    <td><?php get_item($item_id); ?></td>
                                    <!-- <td style="color: #a82529;"><?php echo $yester_closing; ?></td> -->
                                    <td style="color: #a82529;"><?php echo $counted_stck; ?></td>
                                    <!-- <td style="color: red; width: 50px;"><?php echo $variance; ?></td> -->
                                    <td><?php echo $totalin; ?></td>
                                    <td><?php echo $stock_total ?></td>
                                    <td  style="color:#f9a64b;"><?php echo $sys_closing; ?></td> 
                                    <td><?php echo $totalout; ?></td>
                                    <td  style="color:#f9a64b;"><?php echo $price; ?></td>
                                    <td  style="color:#f9a64b;"><?php echo $totalout*$price; ?></td>
                                    <td class="hidden-print" id="<?php echo $take_id; ?>" style="background-color: <?php echo $color;?>">
                                        <?php 
                                            if ($variance!=0 && $status==2) {
                                                ?> <a  data-toggle="modal" data-target="#item_take" data-id="<?php echo $take_id; ?>" style=" font-size: 14px; margin-bottom:  8px;margin-left: 5px; color: white; font-weight: bold;s" id="ret" >ADJUST</a>    
                                        <?php
                                            }else{}
                                        ?>
                                    </td>
                        </tr>
                                <?php   
                            }
                           }
                           ?>

                         
                        
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
                <!-- end col-8 -->
			</div>
			<!-- end row -->
		</div>
<script type="text/javascript">
    function delete_this(str){
        var id = str;
        $.ajax({
            type: "POST",
            url:"delete_order_item.php",
            data:"id="+id,
            success:function(data){
            }
        })
    } 
</script>
<!-- end #content -->
<?php include('../includes/foot.php') ?>