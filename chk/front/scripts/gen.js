function view(id){
  $('#modal').modal('show');
  $.ajax({
    url: 'sale_items.php',
    typr: 'POST',
    data: 'id='+id,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html('');
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function new_sup(){  
  var sup_name = $("#sup_name").val(); 
  var sup_id = '<?php echo $sup_id; ?>';  
  var sup_phone = $("#sup_phone").val(); 
  var sup_address = $("#sup_address").val(); 
  var sup_email = $("#sup_email").val(); 
  var sup_pin = $("#sup_pin").val();
  var sup_vat = $("#sup_vat").val();
  $.ajax({
    url: '../../back/sup/sup_new_act.php',
    typr: 'POST',                           
    data: 'name='+sup_name+'&sup_id='+sup_id+'&sup_phone='+sup_phone+'&sup_email='+sup_email+'&sup_address='+sup_address+'&sup_pin='+sup_pin+'&sup_vat='+sup_vat+'&st=2',
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
$(document).ready(function(){
  App.init();
  function disableBack() {window.history.forward()}
  window.onload = disableBack();
  window.onpageshow = function (evt) {if (evt.persisted) disableBack()}
  $(document).on('click','#select_modal', function(e){
  	e.preventDefault(); 
    $('#load').html(''); 
    $.ajax({
      url: '../gen/select_sale.php',
      typr: 'POST',
      data: '',
      dataType: 'html'
    })
    .done(function(data){
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
    .fail(function(){
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again loadig the sale script...');
      $('#modal-loader').hide();
    });
	});
	$.fn.get_cust = function(){ 
	  $('#cust_id').empty();
	  $.ajax({
	    type: "GET",
	    url: '../../gen/get_cust.php', 
	    data: { },
	    success:  function(data) {  
	      $('#cust_id').append(data);
	    }
	  });
	}
	$.fn.get_cat = function(){ 
	  $('#cat_id').empty();
	  $.ajax({
	    type: "GET",
	    url: '../../gen/get_cat.php', 
	    data: { },
	    success:  function(data) { 
	      $('#cat_id').append(data);
	    }
	  });
	} 
  $.fn.get_sup = function(){ 
    $('#sup_id').empty(); 
    $.ajax({
        type: "GET",
        url: '../../gen/get_sup.php',
        data: { },
        success:  function(data) { 
          $('#sup_id').append(data);
        }
    });
  }
});