<?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
	{
        $id = $_REQUEST['id'];
        $get_details = mysqli_query($connection,"SELECT * FROM kp_category WHERE cat_id='$id'") or die("Could not get the customer details");
        $row = mysqli_fetch_assoc($get_details);
    }
?>
<div class="modal-content">
<div class="modal-body">
    <div id="results3"></div>
    <div class="alert alert-warning">Confirm Delete - <?php echo $row['name']; ?>.</div>
    <input type="hidden" class="form-control" id="cat_id" value="<?php echo $id; ?>" />

      <div class="form-group  col-md-12">
          <label>Select Category Assign All items assigned to this <?php echo $row['name']; ?></label>
          <select class="form-control" id="cat" name="cat" onchange="cat();"> 
            <option  value="<?php echo $cat_id; ?>">--------SELECT CATEGORY-------</option>     <?php
          $cat = "SELECT * FROM kp_category WHERE cat_id!='$id'";
          $cat_r = mysqli_query($connection,$cat) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($cat_r)) {
              $name = $ct['name'];
              $cat_id = $ct['cat_id'];
              ?>
              <option  value="<?php echo $cat_id; ?>"><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
      </div>
</div>
<div class="modal-footer">
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
        <button type="button" id="btn_delete" class="btn btn-danger waves-effect" disabled="true">DELETE</button>
      </div>
   
</div>
<script type="text/javascript">
   function cat(){
    var cat_id = $("#cat_id").val();
  var cat = document.getElementById("cat").value;
  if(cat>0 && !(cat==cat_id)){ 
    //document.getElementById("btn_delete").style.display = "block";
    $('#btn_delete').attr('disabled',false);
  }else{
    //document.getElementById("btn_delete").style.display = "none";
    $('#btn_delete').attr('disabled',true);
  }
}

    // Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    document.getElementById('btn_delete').addEventListener('click', Delete);
        function Delete()
        {
            $('#btn_delete').text('');
            $('#btn_delete').append('<span> Processing... </span>');
            $('#btn_delete').attr('disabled',true);
             var cat = $("#cat").val();
            var cat_id = $("#cat_id").val();
            $.ajax(
                {
                    url: 'cat_del_act.php',
                    typr: 'POST',                           
                    data: 'cat_id='+cat_id+'&id='+cat,
                    dataType: 'html'
                })

                .done(function(data)
                 {
                    $('#results3').html(''); // blank before load.
                    $('#results3').html(data);

                })

                .fail(function()
                {
                    $('#results3').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured Try Again.</div>');
                    
                });
        }

    });
             
    </script>
