// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    $(document).on('click','#return', function(e){
      var sale = $(this).data('id2'); // get id of clicked row
      var item = $(this).data('id'); // get id of clicked row 
      $('#load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: 'return_appr.php',
        typr: 'POST',
        data: 'item='+item+'&sale='+sale,
        dataType: 'html'
      })
      .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data);
      })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
  });