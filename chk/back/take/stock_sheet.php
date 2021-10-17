<?php
include('../clude/head.php');
$day=$_GET['day'];
$no=0;
?>
 <style type="text/css">
  tr,th,td{ 
      border: 2px solid #000 !important; 
    }
   .table{   
        width: 100% !important;
        height: 100% !important;
        border:  1.5px solid #000 !important;
    }
  
    .print { 
        width: 210mm !important;
        width: 297mm !important;
        margin-bottom: 20px; 
    }
@media print {
    body,
    .content,
    .page-header-fixed {
        padding: 0 !important;
        margin: 0 !important;
    }
    .sidebar,
    .header,
    .theme-panel{
        display: none !important;
    }

    tr,th,td{ 
      border: 2px solid #000 !important; 
    }
 
/* tr,th{ 
       
    }*/

    .hidden-print {
        display: none !important;
    }
    
    .table{   
        width: 100% !important;
        height: 100% !important;
        border:  1.5px solid #000 !important;
    }
  
    .print { 
        width: 210mm !important;
        width: 297mm !important;
        margin-bottom: 20px; 
    }
     
}
 </style>
<script>
  function logout(){
  window.location = document.referrer;
}
</script>
<!-- begin #page-container -->
<div id="page-container" onload="logout(); window.print()" class="fade page-sidebar-fixed page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
    
  ?>
  <!-- end #header -->  
  <!-- begin #sidebar -->
  <?php 
    //require("../clude/menu.php");
  ?>
  <!-- onload="logout(); window.print();"  end #sidebar -->
  <body>
    <div class="panel panel-default col-md-10" style="margin-bottom: 10px;">
      <span class="pull-right hidden-print" style="height: 50px; margin-top: 10px;">
        <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-success m-b-10  hidden-print" ><i class="fa fa-print m-r-5"></i> Print</a>
      </span>
      <div class="print" onload="logout(); window.print()" style="margin-top: 10px;"> 
                  <?php
                       $get_items = "SELECT * FROM kp_items ORDER BY name ASC";
                        $get_items_r = mysqli_query($connection,$get_items) or die("Could not get the ite list");
                        $item_count = mysqli_num_rows($get_items_r);
                        if ($item_count < 1) {
                            echo "No food in the database";
                        }else{
                            ?>
                        <table class="table-sheet">
                           <thead>
                            <th>
                              <tr>
                                <th colspan="3"><?php echo $day; ?> STOCK TAKE SHEET</th>
                              </tr>
                            </th>
                              <tr>
                                <th style="width: auto;">NO</th>
                                <th style="width: auto;">NAME</th> 
                                 <th style="width: auto;">   COUNT</th>  
                              </tr>
                           </thead>
                           <tbody>
                            <?php
                             while ($i = mysqli_fetch_assoc($get_items_r)) {
                              $item_id = $i['item_id']; 
                              $name = $i['name'];  
                              $no=$no+1; 
                            ?>
                          <tr>
                            <td><?php echo $no; ?></td>
                            <td><?php echo strtoupper($name); ?></td> 
                            <td> </td>    
                          </tr>
                                 
                                <?php
                           }
                           ?>
                           </tbody>
                           </table>   
                           <?php
                        }
                        ?> 

                        
           
        </div>
                    <!-- end panel -->
                </div>
                <!-- end col-6 -->

</body>
            <!-- end row -->
		</div>
		<!-- end #content -->
 
</div>
	<!-- end page container -->
  <!-- ================== BEGIN BASE JS ================== -->
  <script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
  <script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
  <script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
  <!--[if lt IE 9]>
    <script src="../assets/crossbrowserjs/html5shiv.js"></script>
    <script src="../assets/crossbrowserjs/respond.min.js"></script>
    <script src="../assets/crossbrowserjs/excanvas.min.js"></script>
  <![endif]-->
  <script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
  <script src="../../assets/js/theme/default.min.js"></script> 
  <script src="../../assets/js/apps.min.js"></script>
  <!-- ================== END BASE JS ================== -->
    
  <script>
    $(document).ready(function() {
      App.init();
       
    }); 
  </script> 
</body>
</html>
  
        