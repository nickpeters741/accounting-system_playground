 <?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    $get_priv_details = mysqli_query($connection,"SELECT * FROM kp_roles WHERE role_id='$id'") or die("Could not get the role details");
    $row = mysqli_fetch_assoc($get_priv_details);
}
 function panel($panel,$pan){
    if ($panel==$pan) { return "selected"; }else{ return ""; }
}
   
function dash($dash,$dashboard){
    if ($dash==$dashboard) { return "selected"; }else{ return ""; }
}

$perm=$row['front_perm'];

function perm($perm,$menu){  
    $arr = explode(',',$perm); 
    foreach($arr as $i) {
    $i; 
    if ($i==$menu) {
        echo "checked";
     } else{

     }
    }
}
?>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">EDIT <?php echo strtoupper($row['role_name']); ?> ROLE</h4>
    </div>
        <form role="form" action="role_edit_action.php" role="form"  method="post" style="">
    <div class="modal-body">
        <div id="results"></div>
            <fieldset>
                <input type="hidden" id="role_id" name="role_id" value="<?php echo $id; ?>"/>
                <div class="form-group col-md-10">
                    <label >Role Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="<?php echo strtoupper($row['role_name']); ?>" required />
                </div> 
                ,
                <div class="form-group col-md-6 col-sm-12">
                    <label >Access Panel</label>
                    <select class="form-control" name="panel" id="panel">

                        <option value="">----SELECT PANEL---</option>
                        <option value="2" <?php echo panel($row['role_access_panel'],2) ?>>FRONT PANEL</option>
                        <option value="1" <?php echo panel($row['role_access_panel'],1) ?>>BACK-END PANEL</option>
                        <option value="3" <?php echo panel($row['role_access_panel'],3) ?>>BOTH PANELS</option>
                    </select>
                </div> 

            <div class="form-group col-md-6 col-sm-12">
                <label>Dahboard</label>
                <select class="form-control" name="dash" id="dash">
                  <option value="">----SELECT DASHBOARD---</option>
                  <option value="admin_dash.php" <?php echo dash($row['access_dash'],'admin_dash.php') ?>>ADMIN DASHBOARD</option>
                  <option value="acc_dash.php" <?php echo dash($row['access_dash'],'acc_dash.php') ?>>ACCOUNTS DASHBOARD</option>
                  <option value="store_dash.php" <?php echo dash($row['access_dash'],'store_dash.php') ?>>STORE DASHBOARD</option>
                  <option value="sales_dash.php" <?php echo dash($row['access_dash'],'sales_dash.php') ?>>SALES DASHBOARD</option>
                </select>
            </div>
                <div class="form-group col-md-12">
                    <label >Role Description</label>
                    <textarea class="form-control" id="desc" name="desc" ><?php echo strtoupper($row['role_description']); ?></textarea>
                </div>
            </fieldset>
            <div class="col-md-12">
        <fieldset>
          <legend>Front end Permissions:</legend>
          <div class="row"> 
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="m-sale"   onclick=""  name="perm[]" value="1" <?php perm($perm,1) ?>/>
            <label for="m-sale">Make Sales</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="a-del"   onclick=""  name="perm[]" value="2" <?php perm($perm,2) ?>/>
            <label for="a-del">Approve delete</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="a-ret"   onclick=""  name="perm[]" value="3" <?php perm($perm,3) ?>/>
            <label for="a-ret">Approve Return</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="t-sales"   onclick=""  name="perm[]" value="4" <?php perm($perm,4) ?>/>
            <label for="t-sales">View Today Sales</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="z-repo"   onclick=""  name="perm[]" value="5" <?php perm($perm,5) ?>/>
            <label for="z-repo">Raise Z report</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="edit-det"   onclick=""  name="perm[]" value="6" <?php perm($perm,6) ?>/>
            <label for="edit-det">Edit Sale Details</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="app_petty"   onclick=""  name="perm[]" value="7" <?php perm($perm,7) ?>/>
            <label for="app_petty">Approve Petty Cash</label>
          </div>
        </div>
        </fieldset>
      </div>
  </div>
            <div class="modal-footer">
                <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
                <button type="submit" name="role-edit" class="btn btn-success">Save</button>
            </div>
        </form>
    </div>
</div>

                    
                    


        <!--modal add-->
        
				


		<!--modal add-->
		
