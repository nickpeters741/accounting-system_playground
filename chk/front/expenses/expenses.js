$(document).ready(function() {
  App.init();
  TableManageCombine.init();
  $(document).on('click','#new-cust', function(e){
    e.preventDefault();  
    $.ajax({
      url: 'new_exp.php',
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
  $(document).on('click','#edit-cust', function(e){
    e.preventDefault();
    var id = $(this).data('id');  
    $.ajax({
      url: 'edit_cust.php',
      typr: 'POST',
      data: 'id='+id,
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
  $(document).on('click','#del-cust', function(e){
    e.preventDefault();
    var uid = $(this).data('id'); // get id of clicked row  
    $.ajax({
      url: 'del_cust.php',
      typr: 'POST',
      data: 'id='+uid,
      dataType: 'html'
    })
    .done(function(data){
      console.log(data);
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    }).fail(function(){
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    });
  });
}); 
  