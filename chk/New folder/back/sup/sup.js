  function new_sup(){  
    var sup_name = $("#sup_name").val(); 
    var sup_id = '<?php echo $sup_id; ?>';  
    var sup_phone = $("#sup_phone").val(); 
    var sup_address = $("#sup_address").val(); 
    var sup_email = $("#sup_email").val(); 
    var sup_pin = $("#sup_pin").val();
    var sup_vat = $("#sup_vat").val();
    $.ajax({
      url: '../sup/sup_new_act.php',
      typr: 'POST',                           
      data: 'name='+sup_name+'&sup_id='+sup_id+'&sup_phone='+sup_phone+'&sup_email='+sup_email+'&sup_address='+sup_address+'&sup_pin='+sup_pin+'&sup_vat='+sup_vat+'&st=1',
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

// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    $(document).on('click','#sup-add', function(e){
      e.preventDefault(); 
      $('#sup-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: '../sup/sup_new.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){
        $('#sup-load').html(''); // blank before load.
        $('#sup-load').html(data);
      })
      .fail(function(){
        $('#sup-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });

        $(document).on('click','#sup-edit', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          $('#sup-load').html(''); // leave this diff blank
          $('#modal-loader').show(); // load ajax loader button cliked
          $.ajax({
            url: '../sup/sup_edit.php',
            typr: 'POST',
            data: 'id='+uid,
            dataType: 'html'
          })
          .done(function(data){
            $('#sup-load').html(''); // blank before load.
            $('#sup-load').html(data);
          })
          .fail(function(){
            $('#sup-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });
        $(document).on('click','#sup-del', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row 
          $('#sup-load').html(''); // leave this diff blank
          $('#modal-loader').show(); // load ajax loader button cliked
          $.ajax({
            url: '../sup/sup_del.php',
            typr: 'POST',
            data: 'id='+uid,
            dataType: 'html'
          })
          .done(function(data){
            $('#sup-load').html(''); // blank before load.
            $('#sup-load').html(data);
          }).fail(function(){
            $('#sup-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });

    });