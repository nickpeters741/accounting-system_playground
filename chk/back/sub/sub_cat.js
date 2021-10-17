function new_sub(){
    $('#new_cat').text(''); 
    var name = $("#name").val();
    var desc = $("#desc").val();
    var cat = $("#main-cat").val();
    var code = $("#sub_code").val(); 
    $.ajax({
            url: '../sub/sub_new_act.php',
            typr: 'POST',                           
            data: 'name='+name+'&desc='+desc+'&cat='+cat+'&code='+code+'&st=1',
            dataType: 'html'
        })
        .done(function(data)
         {
            $('#results').html(''); // blank before load.
            $('#results').html(data);

        })
        .fail(function()
        {
          $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
            
        });
  }

// Add your custom JS code here
$( document ).ready(function() {
    // Handler for .ready() called.
    $(document).on('click','#sub-add', function(e){
      e.preventDefault(); 
      $('#sub-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: '../sub/sub_new.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){
        $('#sub-load').html(''); // blank before load.
        $('#sub-load').html(data);
      })
      .fail(function(){
        $('#sub-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });

        $(document).on('click','#sub-edit', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row
          $('#cat-load').html(''); // leave this diff blank
          $('#modal-loader').show(); // load ajax loader button cliked
          $.ajax({
            url: '../sub/sub_edit.php',
            typr: 'POST',
            data: 'id='+uid,
            dataType: 'html'
          })
          .done(function(data){
            $('#sub-load').html(''); // blank before load.
            $('#sub-load').html(data);
          })
          .fail(function(){
            $('#sub-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });
        $(document).on('click','#sub-del', function(e){
          e.preventDefault();
          var uid = $(this).data('id'); // get id of clicked row 
          $('#sub-load').html(''); // leave this diff blank
          $('#modal-loader').show(); // load ajax loader button cliked
          $.ajax({
            url: '../sub/sub_del.php',
            typr: 'POST',
            data: 'id='+uid,
            dataType: 'html'
          })
          .done(function(data){
            $('#sub-load').html(''); // blank before load.
            $('#sub-load').html(data);
          }).fail(function(){
            $('#sub-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
        });

    });