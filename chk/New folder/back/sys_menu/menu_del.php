<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id'])){
	$id = $_REQUEST['id'];
  $panel = $_REQUEST['pnl'];
    $get_menu_details = mysqli_query($connection,"SELECT * FROM kp_menu WHERE menu_id='$id'") or die("Could not get the menu details");
    $row = mysqli_fetch_assoc($get_menu_details);

    $level=$row['level'];

    $get_parent_det = mysqli_query($connection,"SELECT * FROM kp_menu WHERE parent='$id'") or die("Could not get the parent details");
    $dow = mysqli_fetch_assoc($get_parent_det);
    }
?>
<div class="modal-content">
<div class="modal-body">
    <div id="results"></div>
    <div class="alert alert-warning">Confirm Deleting of - <?php echo $row['name']; ?>.</div>
    <input type="hidden" class="form-control" id="menu_id" value="<?php echo $id; ?>"/>
    <?php 
    if (mysqli_num_rows($get_parent_det)<1) {
    ?>
    <script type="text/javascript">
      $('#btn_delete').attr('disabled',false);
    </script>
    <?php
    }else{
      ?>
    <div class="form-group  col-md-12">
          <label>Select parent to Assign All children menu of <?php echo $row['name']; ?></label>
          <select class="form-control" id="menu" name="menu" onchange="menu();"> 
            <option  value="<?php echo $menu_id; ?>">--------SELECT CATEGORY-------</option>     <?php
          $cat = "SELECT * FROM kp_menu WHERE sub=1 AND panel='$panel' AND level='$level' AND menu_id!='$id'";
          $cat_r = mysqli_query($connection,$cat) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($cat_r)) {
              $name = $ct['name'];
              $menu_id = $ct['menu_id'];
              ?>
              <option  value="<?php echo $menu_id; ?>"><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
      </div>
      <?php
    }
    ?>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
    <button type="button" id="btn_delete" class="btn btn-danger waves-effect " onclick="archive();" disabled="true">DELETE</button>
</div>
</div>
<script type="text/javascript"> 
function menu(){ 
  var menu_id = $("#menu_id").val();
  var menu = document.getElementById("menu").value;
  if(menu>0 && !(menu==menu_id)){  
    $('#btn_delete').attr('disabled',false);
  }else{ 
    $('#btn_delete').attr('disabled',true);
  }
}
    function archive(){
        // $('#btn_delete').text('');
        // $('#btn_delete').append('<span> Processing... </span>');
        // $('#btn_delete').attr('disabled',true);
        var menu_id = $("#menu_id").val();
        var menu = $("#menu").val();
        var pnl = '<?php echo $panel; ?>';
        $.ajax({
            url: 'menu_del_act.php',
            typr: 'POST',                           
            data: {menu_id:menu_id,menu:menu,pnl:pnl},
            dataType: 'html'
        })
        .done(function(data){
            $('#results').html(''); // blank before load.
            $('#results').html(data);
        })
        .fail(function(){
            $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
        });
    }
sss</script>
