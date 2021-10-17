<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');
$user_id = $_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details);
$sale_id = $row['sale_id'];

$action="LOADED|-|-|-|CUSTOMER CHANGE MODAL|".$sale_id;
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
        <a class="btn btn-warning" data-toggle="modal" data-target="#modal2" id="new-cust"><i class='fa fa-lg fa-plus' ></i></a>   
     </div>
      <select type="text" class="selectpicker form-control  col-lg-12" name="cust" onchange="cust_change();" id="cust-id" data-size="10" data-live-search="true" style="width: 80%;">
        <option value="empty">-------SELECT CUSTOMER-------------</option>
        <?php
        $get_types = mysqli_query($connection,"SELECT * FROM kp_customers ORDER BY name ASC") or die("Could not get the users");
        while ($type = mysqli_fetch_assoc($get_types)) {
        ?>
        <option value="<?php echo $type['cust_id']; ?>"><?php echo $type['phone']."-".strtoupper($type['name']); ?></option>
        <?php
          }
        ?>
      </select>
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button> 
  <button type="submit" name="" id="custo_btn" class="btn btn-purple btn-xs" disabled="true">CHANGE</button>
  </div>
</div>

<script type="text/javascript">
  $('.selectpicker').select2({
     dropdownParent: $('#modal')
 });
function cust_change(){
  selectVal = $('#cust-id').val();
  if (selectVal == "empty") {
    $( "#custo_btn" ).prop( "disabled", true);
    //document.getElementById("custo_btn").disabled =true;
  }else{
  $( "#custo_btn" ).prop( "disabled", false); 
    //document.getElementById("custo_btn").disabled =false;
  }
} 
  $(document).on('click','#custo_btn', function(e){  
    var cust=$('#cust-id').val(); 
    console.log(cust);
    $.ajax({
      url: 'cust_change_act.php',
      typr: 'POST',
      data: 'cust_id='+cust,
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