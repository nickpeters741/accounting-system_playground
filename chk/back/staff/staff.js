$( document ).ready(function() { 
  $(document).on('click','#staff-add', function(e){
    e.preventDefault(); 
    $('#staff-load').html(''); // leave this diff blank
    $('#modal-loader').show(); // load ajax loader button cliked
    $.ajax({
      url: '../staff/staff_new.php',
      typr: 'GET',
      data: '',
      dataType: 'html'
    })
    .done(function(data){
      $('#staff-load').html(''); // blank before load.
      $('#staff-load').html(data);
    })
    .fail(function(){
      $('#staff-load').html('<div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> <i class="fa  fa-info-sign"></i> Something went wrong, Please try again...</div> </div>');
      $('#modal-loader').hide();
    });
  });

  $(document).on('click','#nok', function(e){
    e.preventDefault();
    var uid = $(this).data('id'); // get id of clicked row
    $('#staff-load').html(''); // leave this diff blank
    $('#modal-loader').show(); // load ajax loader button cliked
    $.ajax({
      url: '../staff/staff_nok.php',
      typr: 'POST',
      data: 'id='+uid,
      dataType: 'html'
    })
    .done(function(data){
      $('#staff-load').html(''); // blank before load.
      $('#staff-load').html(data);
    })
    .fail(function(){
      $('#staff-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });

  $(document).on('click','#staff_edit', function(e){
    e.preventDefault();
    var uid = $(this).data('id'); // get id of clicked row
    $('#staff-load').html(''); // leave this diff blank
    $('#modal-loader').show(); // load ajax loader button cliked
    $.ajax({
      url: '../staff/staff_edit.php',
      typr: 'POST',
      data: 'id='+uid,
      dataType: 'html'
    })
    .done(function(data){
      $('#staff-load').html(''); // blank before load.
      $('#staff-load').html(data);
    })
    .fail(function(){
      $('#staff-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
  $(document).on('click','#change_nok', function(e){
    e.preventDefault();
    var uid = $(this).data('id'); // get id of clicked row
    $('#staff-load').html(''); // leave this diff blank
    $('#modal-loader').show(); // load ajax loader button cliked
    $.ajax({
      url: '../staff/change_nok.php',
      typr: 'POST',
      data: 'id='+uid,
      dataType: 'html'
    })
    .done(function(data){
      $('#staff-load').html(''); // blank before load.
      $('#staff-load').html(data);
    })
    .fail(function(){
      $('#staff-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
  
  $(document).on('click','#staff-del', function(e){
    e.preventDefault();
    var uid = $(this).data('id'); // get id of clicked row 
    $('#staff-load').html(''); // leave this diff blank
    $('#modal-loader').show(); // load ajax loader button cliked
    $.ajax({
      url: 'del_staff.php',
      typr: 'POST',
      data: 'id='+uid,
      dataType: 'html'
    })
    .done(function(data){
      $('#staff-load').html(''); // blank before load.
      $('#staff-load').html(data);
    }).fail(function(){
      $('#staff-load').html('<i class="fa  fa-info-sign"></i>no load Something went wrong, Please try again...');
      $('#modal-loader').hide();
    });
  });
});