       <?php 
include('../../inc/connection.php');
?>
 <div class="modal-content" style="width: auto;">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h4 class="modal-title">NEW USER ROLE</h4>
    </div>
    <form id="myform" class="myform" method="post" name="myform">
    <div class="modal-body">
      <div id="results"></div>   
            <div class="form-group col-md-10">
                <label >Role Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Name"/>
            </div> 
            <div class="form-group col-md-10 col-sm-12">
                <label >Access Panel</label>
                <select class="form-control" name="panel" id="panel" >
                  <option value="">----SELECT PANEL---</option>
                  <option value="2">FRONT PANEL</option>
                  <option value="1">BACK-END PANEL</option>
                  <option value="3">BOTH PANELS</option>
                </select>
            </div>
            <div class="form-group col-md-10 col-sm-12">
                <label>Dahboard</label>
                <select class="form-control" name="dash" id="dash" >
                  <option value="">----SELECT DASHBOARD---</option>
                  <option value="admin_dash.php">ADMIN DASHBOARD</option>
                  <option value="acc_dash.php">ACCOUNTS DASHBOARD</option>
                  <option value="store_dash.php">STORE DASHBOARD</option>
                  <option value="sales_dash.php">SALES DASHBOARD</option>
                </select>
            </div>
            <div class="form-group col-md-12">
                <label >Role Description</label>
                <textarea class="form-control" id="desc" name="desc"></textarea>
            </div> 
            <div class="col-md-12">
        <fieldset>
          <legend>Front end Permissions:</legend>
          <div class="row"> 
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="m-sale"   onclick=""  name="perm[]" value="1" />
            <label for="m-sale">Make Sales</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="a-del"   onclick=""  name="perm[]" value="2" />
            <label for="a-del">Approve delete</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="a-ret"   onclick=""  name="perm[]" value="3" />
            <label for="a-ret">Approve Return</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="t-sales"   onclick=""  name="perm[]" value="4" />
            <label for="t-sales">View Today Sales</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="z-repo"   onclick=""  name="perm[]" value="5" />
            <label for="z-repo">Raise Z report</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="edit-det"   onclick=""  name="perm[]" value="6" />
            <label for="edit-det">Edit Sale Details</label>
          </div>
          <div class="checkbox checkbox-css col-md-6">
            <input type="checkbox" id="app_petty"   onclick=""  name="perm[]" value="7"/>
            <label for="app_petty">Approve Petty Cash</label>
          </div>
        </div>
        </fieldset>
      </div>
    </div>
    <div class="modal-footer">
        <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
        <button type="button" id="btn-save"  name="btn-user"  class="btn btn-success">Save</button>
    </div>
  </form>
  </div>

<script>
$(document ).ready(function() {
    document.getElementById('btn-save').addEventListener('click', user);
    function user(){
      // $('#btn-save').text('');
      // $('#btn-save').append('<span> Please wait... </span>');
      // $('#btn-save').attr('disabled',true);

    //   var name = $("#name").val();
    //   var desc = $("#desc").val();
    //    var dash = $("#dash").val();
    // var panel = $("#panel").val();
    var form = document.myform;
    var dataString = $(form).serialize();
      $.ajax({
          url: 'role_act.php',
          typr: 'POST', 
           //data: 'name='+name+'&desc='+desc+'&panel='+panel+'&dash='+dash,

    data: dataString,
           dataType: 'html'
         })
        .done(function(data){
          $('#results').html(''); // blank before load.
          $('#results').html(data);
        })
        .fail(function(){
          $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
          window.setTimeout(function(){
            window.location.href = 'user_index.php';
          }, 1000);
        });
       
    }
  });
    </script>