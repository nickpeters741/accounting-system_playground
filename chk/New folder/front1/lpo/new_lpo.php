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
        <h4 class="modal-title">RAISE NEW LPO</h4>
    </div>
    <div class="modal-body">
        <div id="qtresult"></div> 
        <div class="row m-5">
            <a name="cashbtn" id="qtbtn" class="btn btn-warning btn-xs col-md-3 m-r-5">QUOTATIONS</a>
            <a name="credit-btn" id="new-btn"  class="btn btn-lime btn-xs col-md-3 m-r-5">NEW</a >  
        </div>
        <div class="col-lg-12  m-3" id="cust-div" style="display: none;">
            <div class="input-group">
                <div class="input-group-prepend">
                    <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modal2" id="new-cust"><i class='fa fa-lg fa-plus' ></i></a>   
              </div>
              <select type="text" class="selectpicker form-control col-lg-12" name="cust_id" id="cust_id"  style="width: 80%;" onchange="cust_select();"> 
              </select>
            </div>
        </div>  
    </div>
    <div class="modal-footer" id="div-foot" style="display: none;">
  <button type="button" data-dismiss="modal" class="btn btn-danger btn-xs">CLOSE</button>
  <button type="submit"  id="start-btn" class="btn btn-purple btn-xs">START L.P.O</button>
</div>
<script type="text/javascript">
    $('.selectpicker').select2({
        dropdownParent: $('#modal')
    });

    function cust_select(){
        selectVal = $('#cust_id').val();
        if (selectVal == 0) {
            document.getElementById("start-btn").disabled =true;
        }else{
            document.getElementById("start-btn").disabled =false; 
        }
    }
    $(document).on('click','#new-btn', function(e){
        e.preventDefault(); 
        $("#cust-div").css({display: "block"}); 
        $.fn.get_cust();
        $("#div-foot").css({display: "block"});   
        $( "#start-btn" ).attr( "name", "1" );
        $( "#start-btn" ).prop( "disabled", true);
    });

    $(document).on('click','#start-btn', function(e){  
        $('#qtresult').html('');
        var cust_id= $('#cust_id').val();  
        $.ajax({
            url: 'init_lpo.php',
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