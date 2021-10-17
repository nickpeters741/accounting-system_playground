<?php
session_start();
include('../../inc/connection.php');
include('../../inc/gen_funcs.php');

$action="LOADED|-|-|-|CHANGE SALES PERSON MODAL";
logs($action,"../../");  
?>
<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CHANGE THE SALES DATE</h4>
            </div>
            <div class="modal-body">
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
        url: 'sale_day_act.php',
        typr: 'POST',
        data: 'day='+day,
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
    }
    
  });
</script>