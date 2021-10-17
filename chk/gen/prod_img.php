<?php 
session_start();
include('../inc/connection.php');
include('../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];  
$action="LOADED VIHECLE DETAILS MODAL | ";
$url="../../"; 
//logs($action,$url);

$id = strtoupper($_REQUEST['id']);   
?> 
<script>
  function previewFile(input){
    var file = $("input[type=file]").get(0).files[0];
    if(file){
      var reader = new FileReader();
      reader.onload = function(){
        $("#previewImg").attr("src", reader.result);
      }
      reader.readAsDataURL(file);
    }
  }
</script>
<div class="modal-content">
  <div class="modal-header"> 
    <h4 class="modal-title">ITEM IMAGE<?php echo get_column("kp_items","name","item_id='$id'"); ?></h4>
  </div> 
    <div class="modal-body"> 
      <div id="item-results"></div> 
        <div class="form-group row">
          <form method="post" action=""  enctype="multipart/form-data" id="impact-form">
            <input type="hidden" name="id"  value="<?php echo $id; ?>">
            <input type="file" name="photo" id="photo" onchange="previewFile(this);" class="btn btn-purple"><br>
            <img id="previewImg" src="<?php echo get_column("kp_items","img","item_id='$id'"); ?>" alt="" style="width: 450px;">
          </form>
        </div>   
    </div>
    <div class="modal-footer">
      <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
      <button type="button" name="new_prod" id="new_prod"  class="btn btn-xs btn-lime" onclick="impact();">Save</button>
    </div> 
  </div>
</div> 

<script type="text/javascript">   
  function impact(){ 
    var form = $("#impact-form");
    var formData = new FormData(form[0]); 
    $.ajax({
      url: '../../gen/prod_img_act.php',
      type: 'POST',                           
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'html'
    })
    .done(function(data){
      $('#item-results').html(data);
      //$('#modal').modal('toggle'); 
    })
    .fail(function(){
      $('#item-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  } 
</script>