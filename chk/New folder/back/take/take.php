<?php
include('../clude/head.php');
$day=$_GET['day'];
$id=$_GET['id'];
if (empty($id)) {
    header("Location:init_take.php");
}else{

}
$no=0;
?>
<!-- begin #page-container -->
<div id="page-container" class="fade page-without-sidebar page-header-fixed">
  <!-- begin #header -->  
  <?php 
    require("../clude/header.php");
  ?>
  <!-- end #header -->   
        <!-- begin #content -->
        <div id="content" class="content">
            <!-- begin row -->
            <div class="row" >
				<!-- begin col-8 -->
                <div class="col-md-4">
                    <div class="panel panel-success" data-sortable-id="index-1" style="margin-top: 10px;">
                         <div class="panel-body">
                            <div id="results"></div>
                            <div id="bd"><a href="stock_sheet.php?day=<?php echo $day; ?>"  class="btn btn-sm hidden-print btn-success m-b-10 print" style="margin-top: 10px;" ><i class="fa fa-print m-r-5"></i>Print Stock Sheet</a>
                            <a href="hold_take.php?id=<?php echo $id ?>&day=<?php echo $day; ?>"  class="btn btn-sm hidden-print btn-warning m-b-10 print pull-right" style="margin-top: 10px;" ><i class="fa fa-hand m-r-5"></i>Hold</a> 
                                <?php 
                                $get_items = mysqli_query($connection,"SELECT * FROM kp_items WHERE take=2 ORDER BY name ASC") or die("Could not get the items");
                                $num=mysqli_num_rows($get_items); 
                                if ($num>1) { 
                             ?>
                                <div class="form-group col-md-12">
                                    <label >SELECT ITEM TO TAKE STOCK</label>
                                    <select type="text" class="form-control" id="id" name="id">
                                      <?php
                                        
                                        while ($cat = mysqli_fetch_assoc($get_items)) {
                                      ?>
                                      <option  value="<?php echo $cat['item_id']; ?>"><?php echo $cat['name']; ?></option>
                                      <?php
                                        }
                                 
                                      ?> 
                                    </select> 
                                </div> 
                                <div class="form-group col-md-12"> 
                                    <input type="text" class="form-control"  id="qty" name="qty" autofocus="true" />
                                </div>
                            <?php } ?>
                               </div>
                             </div> 
                        <div class="panel-footer text-right">
                            <?php if (mysqli_num_rows($get_items)<1) { 
                             ?>
                            <a href="fini_take.php" id="fini"  class="btn btn-sm btn-danger">Finish</a>
                            <?php }else{ ?>
                            <button type="button"  id="take" class="btn btn-sm btn-lime" >Take</button>
                        <?php } ?>
                        </div>
                        
                    
                    </div>
                </div>
                <!-- end col-8 -->
                <!-- begin col-8 -->
                <div class="col-md-8">
                    <div class="panel panel-success" data-sortable-id="index-1" style="margin-top: 10px;">
                        <div class="panel-heading">
                            <h4 class="panel-title"><?php echo $day; ?> TAKEN STOCK</h4>
                        </div>                       
                        <div class="panel-body">
                            <div id="d1" style="overflow-y:scroll; height: 700px; width: auto;"></div>
                        </div>
                    </div>
                </div>
                <!-- end col-8 -->
			</div>
			<!-- end row -->
		</div>
        <!-- end #content -->
        <div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
   <div class="modal-dialog"  id="load"></div>
</div>
    </div> 
    <!-- end #page-container -->
<?php include('../clude/foot.php') ?>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
<script src="../../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.bootstrap.min.js"></script>
<script src="../../assets/plugins/DataTables/extensions/Buttons/js/buttons.flash.min.js"></script>   
<script src="../../assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script> 
<script src="../../assets/js/demo/table-manage-combine.demo.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript">

$(document).ready(function() { 
  App.init();     
}); 
</script>  
</body>
</html>
  
<script type="text/javascript">
    $(document).ready(function(){ 
        load_items();
        $(document).keydown(function(e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if(code==107) 
            {
                take();
            }  
        });
        
    });  

    document.getElementById('take').addEventListener('click', take);
    function take(){
        var qty = $("#qty").val();
        var id = $("#id").val();
        var day = '<?php echo $day; ?>';
        $.ajax({
          url: 'take_act.php',
          typr: 'POST',                           
          data: 'qty='+qty+'&id='+id+'&day='+day+'&func=1',
          dataType: 'html'
        })
        .done(function(data){  
            $("#id").empty();
            $.ajax({
                type: "GET",
                url: 'fetchitems.php',
                data: { },
                success:  function(data) {
                    $('#id').append(data); 
                }
            });  
            $('#results').html(''); // blank before load.
            $('#results').html(data);
            $("#qty").val('');
            $("#qty").focus();
            load_items();
        })
        .fail(function(){
            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
        });
    }

    function load_items(){ 
        var day = '<?php echo $day; ?>';
        $.ajax({
            url: 'take_content.php',
            type: 'POST',
            data: 'day='+day,
            dataType: 'html'
        })
        .done(function(data){
            $('#d1').html(''); // blank before load.
            $('#d1').html(data);
        })
        .fail(function(){
            $('#d1').html(''); // blank before load.
            $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        });
    }

    function hasimemi(item_id,qty){ 
        var day = '<?php echo $day; ?>'; 
        $('#modal').modal('show');  
        $.ajax({
          url: 'take_imei.php',
          typr: 'POST',
          data: 'item_id='+item_id+'&qty='+qty+'&day='+day,
          dataType: 'html'
        })
        .done(function(data){  
          $('#load').html(''); // blank before load.
          $('#load').html(data);
        })
        .fail(function(){
            $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    }
</script>