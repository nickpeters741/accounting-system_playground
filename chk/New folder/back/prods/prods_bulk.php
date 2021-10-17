<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
if(isset($_REQUEST['item'])){
  $item = $_REQUEST['item']; 
  $action="LOADED|-|-|UNIT OF MEASURE SET MODAL FOR |";
  logs($action,"../../"); 
  $break_item=get_column('kp_items',"break_item","item_id='$item'");
  $bulk=get_column('kp_items',"bulk","item_id='$item'");
  $pcs=get_column('kp_items',"pcs","item_id='$item'");
  $uom=get_column('kp_items',"uom","item_id='$item'");
}
?>
<div class="modal-content">
  <div class="modal-header"> 
    <h4 class="modal-title">SET UNIT OF MEASURE FOR <?php echo get_column('kp_items',"name","item_id='$item'"); ?></h4>
  </div>
		<div class="modal-body">
			<div id="results"></div>
			<form  id="cat-form"> 
       <fieldset>
        <legend style="font-size:18px; color:purple;">Unit Of Measure</legend>
        <div class="form-group row">
          <div class="col-md-4">
            <label >UOM</label>
            <input type="hidden" class="form-control form-control-xs"  id="item_id" name="item_id" value="<?php echo $item; ?>"/>
            <input type="text" class="form-control form-control-xs"  id="uom" name="uom" placeholder="Enter the UOM....." value="<?php echo $uom; ?>" required />
          </div>
          <div class="form-group col-md-8">
            <label style="color:red">Does it produce smaller quantites</label><br>
            <div class="radio radio-css radio-inline">
              <input type="radio" name="bulk" id="yes" value="1" <?php if ($bulk==1) { echo "checked"; } ?>/>
              <label for="yes" style="color:blue;">YES</label>
            </div>
            <div class="radio radio-css radio-inline">
              <input type="radio" name="bulk" id="no" value="2" <?php if ($bulk==2) { echo "checked"; } ?>/>
              <label for="no"  style="color:blue;">NO</label>
            </div>
          </div>
          <div class="col-md-4" id="div-pcs" <?php if ($bulk==2) { ?>style="display: none;" <?php } ?> >
            <label >Pieces Produced</label>
            <input type="number" class="form-control form-control-xs"  id="pcs" name="pcs" placeholder="Enter Pcs Produced....." required  value="<?php echo $pcs; ?>"/>
          </div>
          <div class="col-md-7" id="div-item" <?php if ($bulk==2) { ?>style="display: none;" <?php } ?> >
            <label>Select Item Produced</label> 
            <select type="text" class="form-control form-control-xs pickers"  id="items_prod" name="items_prod" style="width: 100%; height: 25px;">
              <option  value="0" <?php if ($break_item==0) { echo "selected"; } ?>>---SELECT ITEMS PRODUCED----</option>
              <?php
                $get_tax = mysqli_query($connection,"SELECT * FROM kp_items WHERE item_id!='$item' ORDER BY name ASC") or die("Could not get the categories");
                while ($tat = mysqli_fetch_assoc($get_tax)) {
              ?>
              <option  value="<?php echo $tat['item_id']; ?>" <?php if ($break_item==$tat['item_id']) { echo "selected"; } ?> > <?php echo $tat['name']; ?> </option>
              <?php
                }
              ?> 
            </select>    
          </div>
        </div>
      </fieldset> 
    </form>
      </div>
      <div class="modal-footer p-10">
        <a  class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
				<a  id="set-uom" class="btn btn-xs btn-success">SET UOM</a>
			</div>
		</div>
	</div> 

<script type="text/javascript">
// Add your custom JS code here
$( document ).ready(function(){
   $('.pickers').select2({
    dropdownParent: $('#modal')
  }); 
  document.getElementById('set-uom').addEventListener('click', set_uom);
  function set_uom(){ 
    var str = $( "#cat-form" ).serialize(); 
    $('#results').html('');
    $.ajax({
      url: 'prods_bulk_act.php',
      type: 'POST',                           
      data: str,
      dataType: 'html'
    })
    .done(function(data){
      $('#results').html(data);
      $('#modal').modal('toggle'); 
    })
    .fail(function(){
      $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
  
   $('input[name="bulk"]').click(function() {    
      if($(this).val() == '1'){ 
        $('#div-pcs').show();
        $('#div-item').show(); 
      }else if($(this).val() == '2'){   
        $('#div-pcs').hide();
        $('#div-item').hide();
      }
    }); 
});
</script>
<!--modal add-->
		
