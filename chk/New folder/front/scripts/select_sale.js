$(document).on('click','#cashbtn', function(e){
    e.preventDefault();
    $("#sus").css({display: "none"});
    $("#cust-div").css({display: "block"}); 
    $.fn.get_cust();
    $("#div-foot").css({display: "block"}); 
    $("#start-btn").text("CASH SALE"); 
    $( "#start-btn" ).attr( "name", "1" );
    $( "#start-btn" ).prop( "disabled", true);
});

$(document).on('click','#credit-btn', function(e){
    e.preventDefault();
    $("#sus").css({display: "none"});
    $("#cust-div").css({display: "block"}); 
    $.fn.get_cust();
    $("#div-foot").css({display: "block"}); 
    //$("#div-day").css({display: "block"});
    $("#start-btn").text("START INVOICE"); 
    $( "#start-btn" ).attr( "name", "2" );
    $( "#start-btn" ).prop( "disabled", true);
});

$(document).on('click','#held-btn', function(e){
    e.preventDefault();
    $("#sus").css({display: "block"});
    $("#cust-div").css({display: "none"});  
    $("#div-foot").css({display: "none"}); 
    $("#div-day").css({display: "none"});
    $.ajax({
      url: '../gen/held.php',
      type: 'POST', 
      dataType: 'html'
    })
    .done(function(data){
      $('#sus').html(''); // blank before load.
      $('#sus').html(data); // blank before load.
    })
    .fail(function(){
      $('#sus').html(''); // blank before load.
      $('#sus').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    }); 
});

$(document).on('click','#new-cust', function(e){  
  $('#load2').html(''); 
  $.ajax({
    url: '../gen/quick_cust.php',
    typr: 'POST',
    data: '',
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
});

function cust_select(){
    selectVal = $('#cust_id').val();
    if (selectVal == 0) {
      $("#mkt-div").css({display: "none"});
      $( "#start-btn" ).prop( "disabled", true); 
    }else{
      $("#mkt-div").css({display: "none"});
        $("#start-btn").prop('disabled', false);
    }  
}

// function mkt_select(){
//     selectVal = $('#mkt').val(); 
//     if (selectVal == 0) {
//         $( "#start-btn" ).prop( "disabled", true);
//     } else { 
//         $("#start-btn").prop('disabled', false);
//     }
// }  

