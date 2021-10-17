<?php 
session_start();
include('../../inc/connection.php');
include('../clude/funcs.php');
$user_id = $_SESSION['user_id'];  
$action="LOADED NEW QUOTE MODAL |";
$url="../../";
logs($action,$url);
?>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">RAISE NEW QUOTE</h4>
    </div>
    <div class="modal-body">
        <div id="qtresult"></div>
    	<div class="container-fluid">
    		<div class="row">
    			<div class="input-group mb-3">
          <div class="input-group-prepend">
            <a class="btn btn-warning" data-toggle="modal" data-target="#modal2" id="new-cust"><i class='fa fa-lg fa-plus' ></i></a>   
          </div>
          <select type="text" class="selectpicker form-control col-lg-12" name="cust_id" id="cust_id" data-size="10" data-live-search="true" style="width: 80%;" onchange="cust_change();"> 
          </select>
        </div>
    		</div>
    	</div>
    </div>
    <div class="modal-footer" >
    	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-lime btn-xs" id="newqt"   disabled="true" >Yes</button>
    </div>
</div>
<script type="text/javascript">
      $('.selectpicker').select2({
        dropdownParent: $('#modal')
    });

    function cust_change(){
        selectVal = $('#cust_id').val();
        if (selectVal == 0) {
            document.getElementById("newqt").disabled =true;
        }else{
            document.getElementById("newqt").disabled =false; 
        }
    }

    $(document).on('click','#newqt', function(e){  
        $('#qtresult').html('');
        var cust_id= $('#cust_id').val(); 
        console.log(cust_id);
        $.ajax({
            url: 'init_qt.php',
            typr: 'POST',
            data: 'cust='+cust_id+'&st=NEW',
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

    $(document).on('click','#new-cust', function(e){  
        $('#load2').html(''); 
        $.ajax({
            url: '../gen/quick_cust.php',
            typr: 'POST',
            data: '',
            dataType: 'html'
        })
        .done(function(data){ 
            $('#load2').html(''); // blank before load.
            $('#load2').html(data);
        })
        .fail(function(){
            $('#load2').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });
</script>