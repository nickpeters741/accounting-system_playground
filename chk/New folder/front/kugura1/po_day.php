<?php
session_start();
include('../../inc/connection.php');
include('funcs.php'); 
$action="LOADED|-|-|-|CHANGE PURCHASE DATE MODAL";
logs($action,"../../");  
?> 
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CHANGE THE PURCHASE DATE</h4>
            </div>
            <div class="modal-body">
              <div id="day_res"></div>
              <div class="form-group col-lg-12" id="div-day">
                 <label>DATE</label>
                 <input type="date" id="day" class="form-control col-xs-2" data-date-format="yyyy-mm-dd"  max="<?php echo  today(); ?>"  name="day"  >
              </div>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
              <button class="btn btn-purple btn-xs"   id="new-day" >CONTINUE</button>
            </div>
        </div>

<script type="text/javascript"> 
  $(document).on('click','#new-day', function(e){
    e.preventDefault(); 
    var day=$('#day').val(); 
    if (day==0) {
      $.gritter.add({
        title: 'EMPTY DATE!',
        text: 'The Date Cannot be Empty. ',
        sticky: false, 
        class_name: 'gritter-light',
        before_open: function() {
          if($('.gritter-item-wrapper').length === 4) {
            $.gritter.removeAll(); //return false;
          }
        }
      }); 
    } else {
      $.ajax({
        url: 'po_day_act.php',
        typr: 'POST',
        data: 'day='+day,
        dataType: 'html'
      })
      .done(function(data){ 
        $('#day_res').html(''); // blank before load.
        $('#day_res').html(data);
      })
      .fail(function(){
        $('#day_res').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    }
  });
</script>