

// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    $(document).on('click','#bank-add', function(e){
      e.preventDefault(); 
      $('#cat-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: 'bank_new.php',
        typr: 'POST',
        data: '',
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

        $(document).on('click','#bank-edit', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          $('#load').html(''); // leave this diff blank
          $.ajax({
            url: 'bank_edit.php',
            typr: 'POST',
            data: 'id='+uid,
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
        $(document).on('click','#bank-del', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          console.log(uid)  ;
          $.ajax({
            url: 'bank_del.php',
            typr: 'POST',
            data: {id:uid},
            dataType: 'html'
          })
          .done(function(data){
            $('#load').html(''); // blank before load.
            $('#load').html(data);
          }).fail(function(){
            $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });

        $(document).on('click','#bank-trans', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row 
          $.ajax({
            url: 'bank_trans.php',
            typr: 'POST',
            data: {id:uid},
            dataType: 'html'
          })
          .done(function(data){
            $('#load').html(''); // blank before load.
            $('#load').html(data);
          }).fail(function(){
            $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });

    });