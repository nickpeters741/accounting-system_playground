<?php 
session_start();
include('../../inc/connection.php');
include('funcs.php');
$user_id = $_SESSION['user_id'];  
$action="LOADED NEW PURCHASE MODAL | ";
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM CREATE NEW PURCHASE ORDER</h4>
    </div>
    <div class="modal-body">
    	<div id="qtresult"></div>  
        <div class="col-lg-12  m-3" id="cust-div">
            <div class="input-group">
                <div class="input-group-prepend">
                    <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modal2" id="new-sup"><i class='fa fa-lg fa-plus' ></i></a>
                </div>
                  <select type="text" class="selectpicker form-control col-lg-12" name="sup_id" id="sup_id"  style="width: 80%;" onchange="sup_select();"> 
                  </select>
            </div>
        </div>  
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">No</button>
        <button type="submit"  id="start-btn" class="btn btn-purple btn-xs" disabled="true">START PURCHASE</button>
    </div>
</div>
<script type="text/javascript">
    $('.selectpicker').select2({
        dropdownParent: $('#modal')
    });

    function sup_select(){
        selectVal = $('#sup_id').val();
        if (selectVal == 0) {
            document.getElementById("start-btn").disabled =true;
        }else{
            document.getElementById("start-btn").disabled =false; 
        }
    }
    $(document).on('click','#new-sup', function(e){  
        $.ajax({
            url: '../../back/sup/sup_new.php',
            typr: 'POST',                           
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#load2').html(data); 
        })
        .fail(function(){
            $('#load2').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
        });
    });
    function new_sup(){  
      var sup_name = $("#sup_name").val(); 
      var sup_id = '<?php echo $sup_id; ?>';  
      var sup_phone = $("#sup_phone").val(); 
      var sup_address = $("#sup_address").val(); 
      var sup_email = $("#sup_email").val(); 
      var sup_pin = $("#sup_pin").val();
      var sup_vat = $("#sup_vat").val();
      $.ajax({
        url: '../../back/sup/sup_new_act.php',
        typr: 'POST',                           
        data: 'name='+sup_name+'&sup_id='+sup_id+'&sup_phone='+sup_phone+'&sup_email='+sup_email+'&sup_address='+sup_address+'&sup_pin='+sup_pin+'&sup_vat='+sup_vat+'&st=2',
        dataType: 'html'
      })
      .done(function(data){
        $('#results').html(''); // blank before load.
        $('#results').html(data);
      })
      .fail(function(){
        $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
      });
    }
    $(document).on('click','#start-btn', function(e){  
        $('#qtresult').html('');
        var sup_id= $('#sup_id').val();  
        $.ajax({
            url: 'init_po.php',
            typr: 'POST',
            data: 'sup='+sup_id+'&st=NEW',
            dataType: 'html'
        })
        .done(function(data){ 
            console.log(data);
            $('#qtresult').html(''); // blank before load.
            $('#qtresult').html(data);
        })
        .fail(function(){
            $('#qtresult').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });
 

</script>