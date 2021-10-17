
function new_cat(){
    $('#new_cat').text('');
    $('#new_cat').append('<span> Please wait... </span>');
    $('#new_prod').attr('disabled',true);
    var name = $("#name").val();
    var desc = $("#desc").val();
    var code = $("#cat_code").val();
    $.ajax({
        url: '../cat/cat_new_act.php',
        typr: 'POST',                           
        data: 'name='+name+'&desc='+desc+'&code='+code+'&st=1',
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
    $(document).on('click','#cat-add', function(e){
      e.preventDefault(); 
      $('#cat-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: '../cat/cat_new.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){
        $('#cat-load').html(''); // blank before load.
        $('#cat-load').html(data);
      })
      .fail(function(){
        $('#cat-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
    $(document).on('click','#cat-edit', function(e){
      e.preventDefault();
      var uid = $(this).data('id'); // get id of clicked row
      $('#cat-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: '../cat/cat_edit.php',
        typr: 'POST',
        data: 'id='+uid,
        dataType: 'html'
      })
      .done(function(data){
        $('#cat-load').html(''); // blank before load.
        $('#cat-load').html(data);
      })
      .fail(function(){
        $('#cat-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
    $(document).on('click','#cat-del', function(e){
      e.preventDefault();
      var uid = $(this).data('id'); // get id of clicked row 
      $('#cat-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: '../cat/cat_del.php',
        typr: 'POST',
        data: 'id='+uid,
        dataType: 'html'
      })
      .done(function(data){
        $('#cat-load').html(''); // blank before load.
        $('#cat-load').html(data);
      }).fail(function(){
        $('#cat-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });

});