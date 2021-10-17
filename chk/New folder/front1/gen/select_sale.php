<?php
session_start();
include('../../inc/connection.php'); 
include('../clude/funcs.php');

date_default_timezone_set("Africa/Nairobi");
$today=date("Y-m-d");

page_restrict();
$action="LOADED |-|-|-|SELECT SALE MODAL";
logs($action,"../../");  
?>
<div class="modal-content">  
<div class="modal-header">  
  <div>
    <a name="cashbtn" id="cashbtn" class="btn btn-warning btn-xs">RECEIPT</a>
    <a name="credit-btn" id="credit-btn"  class="btn btn-lime btn-xs">INVOICE</a > 
    <a name="mpesabtn" id="held-btn"  class="btn btn-purple btn-xs">HELD</a >
   </div>
</div>
<form class="form-horizontal " method="POST" action="../ord/init_sale.php">
  <div class="modal-body">
    <div id="sus" class="table table-responsive"  style="display: none;"></div>  
      <div class="col-lg-12 " id="cust-div" style="display: none;">
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <a class="btn btn-warning" data-toggle="modal" data-target="#modal2" id="new-cust"><i class='fa fa-lg fa-plus' ></i></a>   
          </div>
          <select type="text" class="selectpickers form-control col-lg-12" name="cust_id" id="cust_id"  style="width: 80%;" onchange="cust_select();"> 
          </select>
        </div>
      </div> 
        <div class="form-group col-md-12 col-sm-12 col-xs-12" id="mkt-div" style="display: none;">
          <label>Select Salesperson</label>
          <div>
            <select type="text" class="selectpickers form-control  col-lg-12" name="mkt" id="mkt" style="width: 100%;" onchange="mkt_select();">
              <option value="00">----SELECT SALESPERSON------</option>
               <?php
              $get_types = mysqli_query($connection,"SELECT user_id,username FROM kp_users ORDER BY username ASC") or die("Could not get the users");
                while ($type = mysqli_fetch_assoc($get_types)) {
              ?>
              <option value="<?php echo $type['user_id']; ?>"><?php echo strtoupper($type['username']); ?></option>
              <?php
                }
              ?>
            </select>
          </div>
      </div> 
      <div class="form-group col-lg-12" id="div-day" style="display: none;">
         <label>DATE</label>
         <input type="date" id="day" class="form-control col-xs-2" data-date-format="yyyy-mm-dd"  max="<?php echo  $today; ?>"  name="day" value="<?php echo  $today; ?>">
      </div>
      </div> 

<div class="modal-footer" id="div-foot" style="display: none;">
  <button type="button" data-dismiss="modal" class="btn btn-danger btn-xs">CLOSE</button>
  <button type="submit"  id="start-btn" class="btn btn-purple btn-xs">START ORDER</button>
</div>
</form>
</div>
 

<script type="text/javascript">
  $('.selectpickers').select2({
      dropdownParent: $('#modal')
  });
</script>
