<?php 
include('../clude/head.php');
$user_id = $_SESSION['user_id'];
date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");
?>
<style type="text/css">
  @media screen {
  #printSection {
      display: none;
  }
}

@media print {
  body * {
    visibility:hidden;
  }
  #printSection, #printSection * {
    visibility:visible;
  }
  #printSection {
    position:absolute;
    left:0;
    top:0;
  }
}

</style>
<body>
  
  <!-- begin #page-container -->
  <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <?php include("../clude/header.php") ?>
    <!-- end #header -->
    <!-- begin #menu -->
    <?php include("../clude/menu.php") ?>
    <!-- end #menu -->
  <!-- begin #content -->
<div id="content" class="content">
  <?php
  if (isset($_GET['msg'])) {
    if ($_GET['msg'] == 6) {
      ?>
      <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert"> &times; </a>
        <strong>Approved !</strong> Requisition updated Succesfully.
      </div>
      <?php
      }elseif ($_GET['msg'] == 2){
      ?>
      <div class="alert alert-lime col-md-6" >
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>Stock</strong> was updated Succesfully.
      </div>
      <?php
      }
    }
  ?>
  <div class="panel panel-purple" data-sortable-id="index-1">
    <div class="panel-heading">
      <h4 style="color: white;"><u><?PHP echo get_user($user_id)."  ".$today; ?> ORDERS </u></h4>
    </div>
    <div class="panel-body">
      <div class="dataTable_wrapper">
        <table id="data-table-combine" class="table table-striped table-bordered table-hover">
          <thead>
            <tr >
              <th>SALE</th> 
		      	  <th>CUSTOMER</th>
		      	  <th>AMOUNT</th> 
		          <th>SALE TYPE</th>	
              <th>ACTION</th>	       
			      </tr>
          </thead>
          <tbody>
            <?php
            $sales = mysqli_query($connection,"SELECT * FROM kp_sales WHERE user_id='$user_id' AND day='$today'");
            while ($sa = mysqli_fetch_assoc($sales)) {
              $sale_id = $sa['sale_id']; 
            ?>
            <tr ondblclick="view(<?php echo $sale_id; ?>)" id="row<?php echo $sale_id; ?>">
              <td><?php echo $sale_id; ?></td>
              <td><?php echo get_cust($sa['cust_id']); ?></td>
	   			    <td><?php echo $sa['total_amount']; ?></td>  
              <td>
              <?php  
              if ($sa['type']==1) {
                echo "CASH SALE";
              }elseif ($sa['type']==2) {
                echo "CREDIT SALE";
              }
              ?>
              </td>
              <td class="with-btn-group" nowrap>
                            <div class="btn-group">
                                <a href="#" class="btn btn-lime btn-xs width-60">Actions</a>
                                <a href="#" class="btn btn-lime btn-xs dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                  <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                  <?php
                                  if ($sa['type']==1) {
                                    ?>
                                    <li style="color: purple;"><a data-toggle="modal" data-target="#modal" data-id="<?php echo $sale_id; ?>" data-id2="<?php echo $sa['type']; ?>" id="re-print">Re-print</a></li>
                                    <?php
                                    }elseif ($sa['type']==2) {
                                      ?>
                                    <li style="color: purple;"><a data-toggle="modal" data-target="#modal" data-id="<?php echo $sale_id; ?>" id="re-print">Re-print</a></li>
                                    <?php
                                    }?>
                                  
                                  <!-- <li style="color: white;"><a data-toggle="modal" data-target="#cancel-modal" data-id="<?php echo $sale_id; ?>" id="cancel">Cancel</a></li> -->
                                  <!--<li><a data-toggle="modal" data-target="#prods-modal" data-id="<?php echo $row["item_id"]; ?>" id="price-adj">Adjust Prices</a></li>
                                   <li><a href="#">Price History</a></li> -->
                                </ul>
                            </div>
                        </td>            </tr>
            <?php
            } 
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>
<?php include("../clude/foot.php") ?>  

<!-- ================== END BASE JS ================== -->
<script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/jszip.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/pdfmake.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.html5.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/vfs_fonts.min.js"></script>
  <script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.print.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script src="../scripts/gen.js"></script>
<script type="text/javascript">
  $(document).ready(function() { 
    TableManageCombine.init();
    $(document).on('click','#re-print', function(e){ 
      var uid = $(this).data('id'); // get id of clicked row 
      var type = $(this).data('id2'); // get id of clicked row 
      $('#load').html(''); // leave this diff blank 
      $.ajax({
        url: 'trans-modal.php',
        typr: 'GET',
        data: 'id='+uid+'&act=REPRINT'+'&type='+type,
        dataType: 'html'
    })
      .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
      });
    });
  });
</script>
</body>

</html>


