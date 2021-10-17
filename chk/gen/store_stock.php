<?php
include("../inc/connection.php"); 
include("../back/clude/funcs.php"); 
$st=$_REQUEST['st'];
if ($st==1) {
  ?> 
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">SELECT STORE TO MANAGE</h4>
	</div> 
  <form action="../thitoo/store_man.php" method="POST">
    <div class="modal-body">
      <div class="form-group col-md-10">
        <label ></label>
        <select type="text" class="form-control" id="store" name="store" onchange="load()">
          <option  value="0">---SELECT STORE----</option>
          <?php
            $get_categories = mysqli_query($connection,"SELECT * FROM kp_store") or die("Could not get the stores");
            while ($cat = mysqli_fetch_assoc($get_categories)) {
          ?>
          <option  value="<?php echo $cat['store_id']; ?>" > <?php echo $cat['name']; ?> </option>
          <?php
            }
          ?> 
        </select> 
      </div> 
    </div>
    <div class="modal-footer"> 
      <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
      <button type="submit" name="select-counter" id="select-counter" class="btn btn-sm btn-lime" disabled="true">MANAGE</button>
   </div>
 </form>
</div> 



<?php 
}elseif ($st==2) {
  ?> 
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">START/CONTINUE STORAGE INVENTORY TAKE </h4>
  </div> 
   <div style="padding: 10px;">
      <a name="newbtn" id="cashbtn" class="btn btn-lime" onclick="new_take();">NEW TAKE</a> 
      <a  name="susbtn" id="susbtn"  class="btn btn-warning" onclick="continue_take();" >SUSPENDED</a > 
    </div> 
    <form action="../thitoo/init_take.php" method="POST">
    <div class="modal-body">
      <div class="form-group col-md-10" id="new" style="display: none; margin-left: 2px;"> 
        <select type="text" class="form-control" id="store" name="store" onchange="load()">
          <option  value="0">---SELECT STORE----</option>
          <?php
            $get_categories = mysqli_query($connection,"SELECT * FROM kp_store WHERE take_status=2") or die("Could not get the stores");
            while ($cat = mysqli_fetch_assoc($get_categories)) {
          ?>
          <option  value="<?php echo $cat['store_id']; ?>" > <?php echo $cat['name']; ?> </option>
          <?php
            }
          ?> 
        </select> 
      </div> 
      <div id="sus">
    <table class="table">
      <thead>
        <tr>
          <td>DATE</td>
          <td>USER</td>
          <td>SHIFT</td>
          <td>START TIME</td>
          <td>ACTION</td>
        </tr>
      </thead>
      <tbody>
        <?php
            $get_order = "SELECT * FROM kp_store_take_status";
            $get_order_r = mysqli_query($connection,$get_order) or die("Could not get the orders");
             
            while ($o = mysqli_fetch_assoc($get_order_r)) { 
              $store_id = $o['store_id'];
              $user_id = $o['user_id'];
            ?>
            <tr style="color: #373a3c;" id="<?php echo $item_id; ?>">
              <td><?php echo get_store($store_id); ?></td>  
              <td><?php  echo get_user($user_id); ?></td>
              <td><?php  echo $o['shift']; ?></td>  
              <td><?php  echo $o['start']; ?></td> 
              <td><a href="../thitoo/init_take.php?id=<?php echo $store_id; ?>&sh=<?php echo $o['shift'];?>&cont=3;" class="btn btn-warning btn-xs">CONTINUE TAKE</a></td> 
            </tr>
            <?php
            }
            ?> 
      </tbody>
    </table> 
    </div>
    </div>
    <div class="modal-footer"> 
      <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
      <button type="submit" name="start-take" id="select-counter" class="btn btn-sm btn-lime" disabled="true">START TAKE</button>
   </div>
 </form>
</div>   
<?php 
}
?>

<script>
function new_take(){ 
    document.getElementById("sus").style.display = 'none';  
    document.getElementById("new").style.display = 'block';  
}
function continue_take(){
  document.getElementById("sus").style.display = 'block';  
  document.getElementById("new").style.display = 'none';  
}
function load(){
  var store = $("#store").val(); 
  if (store==0){
     document.getElementById("select-counter").disabled = true; 
  } else {
    document.getElementById("select-counter").disabled = false;  
  }
}
</script>