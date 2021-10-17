<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$po_id = $row['po_id'];
$sup_id = $row['sup_id'];

$action="LOADED|-|-|-|SUPPLIER CHANGE MODAL|".$po_id;
logs($action,"../../");
?>
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h4 class="modal-title">CHANGE THE CUSTOMER</h4>
  </div>
  <div class="modal-body">
    <div class="input-group mb-3"> 
      <div class="input-group-prepend">
        <a class="btn btn-warning" data-toggle="modal" data-target="#modal2" id="new-sup"><i class='fa fa-lg fa-plus' ></i></a>   
     </div>
      <select type="text" class="selectpicker form-control  col-lg-12" name="sup_id" onchange="sup_change();" id="sup-id" data-size="10" data-live-search="true" style="width: 80%;">
        <option value="empty">-------SELECT SUPPLIER-------------</option>
        <?php
        $get_types = mysqli_query($connection,"SELECT * FROM kp_suppliers ORDER BY sup_name ASC") or die("Could not get the users");
        while ($type = mysqli_fetch_assoc($get_types)) {
        ?>
          <option value="<?php echo $type['sup_id']; ?>"><?php echo $type['sup_phone']."-".strtoupper($type['sup_name']); ?></option>
        <?php
        }
        ?>
      </select>
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button> 
  <button type="submit" name="" id="sup_btn" class="btn btn-purple btn-xs" disabled="true">CHANGE</button>
  </div>
</div>

<script type="text/javascript">
  $('.selectpicker').select2({
    dropdownParent: $('#modal')
  });
  function sup_change(){
    selectVal = $('#sup-id').val();
    if (selectVal == "empty") {
      $( "#sup_btn" ).prop( "disabled", true);
      //document.getElementById("custo_btn").disabled =true;
    }else{
    $( "#sup_btn" ).prop( "disabled", false); 
      //document.getElementById("custo_btn").disabled =false;
    }
  } 
  $(document).on('click','#sup_btn', function(e){  
    var sup=$('#sup-id').val(); 
    $.ajax({
      url: 'sup_change_act.php',
      typr: 'POST',
      data: 'id='+sup,
      dataType: 'html'
    })
    .done(function(data){ 
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
    .fail(function()
    {
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
</script>