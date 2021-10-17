function get_price(){ 
  var price= $('#price').val();
  var qty= $('#qty').val();
  total=parseFloat(price)*parseFloat(qty);   
  $('#total').val(total); 
}
function get_total(){
  var qty= $('#qty').val(); 
  var total= $('#total').val();
  price=parseFloat(total)/parseFloat(qty);   
  $('#price').val(price.toFixed(2));
}
$(".selectpicker").select2();
function get_uom(){ 
  var id = $("#item_id").val();
    $('#uom_id').empty();
    $.ajax({
      type: "GET",
      url: '../../gen/get_uom.php', 
      data: {id:id },
      success:  function(data) { 
        $('#uom_id').append(data); 
      }
    });
}

function assign_uom(item){
  $('#modal').modal('show');   
    $.ajax({
      url: '../../gen/assign_uom.php',
      typr: 'POST',
      data: 'item='+item,
      dataType: 'html'
    })
    .done(function(data){  
      $('#load').html(''); // blank before load.
      $('#load').html(data);
    })
    .fail(function()
    {
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
    url: '../sup/sup_new_act.php',
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
$(document).ready(function() {
  App.init(); 
  load_items();
  $.fn.fetch_items();
  $.fn.get_sup();
  po_total();

  $(document).on('click','#new-sup', function(e){
    console.log('loading');
    $('#load').html('test'); 
    $.ajax({
      url: '../sup/sup_new.php',
      typr: 'POST',                           
      data: '',
      dataType: 'html'
    })
    .done(function(data){
      $('#load').html(data); 
    })
    .fail(function(){
      $('#load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  });
  $('input[name="tax"]').click(function() { 
    var total =$('#ttt').html();
    var vat=0;
    if($(this).val() == '0') {
      $('#div-perc').hide();  
      $('#vat').val(0);
      $('#tt').html(total);
      $('#total').val(total); 
      $('#vatable').html(''); 
      $('#vatt').html('');
      $('#perc-input').val(0); 
      $('#vatable').html(0); 
      $('#vatt').html(0);


    }else if($(this).val() == '1'){ 
      $('#div-perc').show();
      $('#others').prop("disabled", true);
      $('#vatable').html(0); 
      $('#vatt').html(0);
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();

    }else if($(this).val() == '2'){   
      $('#div-perc').show();
      $('#others').prop("disabled", true);
      $('#vatable').html(0); 
      $('#vatt').html(0); 
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();
    }
   });

  $('input[name="perc"]').click(function() {
    if($(this).val() == '1') {
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();     
    }else{ 
      $('#vatable').html(0); 
      $('#vatt').html(0);
      $('#perc-input').val(0);
      $('#others').prop("disabled", false);
      $('#perc-input').prop("disabled", false);  
    }
   }); 
 
 }); 
  function clear_tax(){
    $("#none").click();
    var total =$('#ttt').html();
    var disc= $('#disc').val();
    total=total-disc;
    $('#tt').html(total);
  }

  function load_items(){
    po_total(); 
    $.ajax({
      url: '../kugura/po_items.php',
      type: 'POST',
      data: ' ',
      dataType: 'html'
    })
    .done(function(data){ 
      $('#d1').html(data); 
    })
    .fail(function(){ 
      $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }

  function tax_perc(){
    var vat_type=$('input[name="tax"]:checked').val();
    var perc= $('#perc-input').val();
    var total =$('#ttt').html();
    var disc= 0;
    total=total-disc;
    var add=parseInt(100) + parseInt(perc);
    if (vat_type==1) {
      //inclusive 
      var multi=parseInt(perc)/add; 
      var vat=parseInt(total)*multi;
      var vatt=vat.toFixed(2);
      var vatable=total- vatt;
      var vatable=vatable.toFixed(2);
      var tt=total;
    } else if (vat_type==2){
      //exclusive 
      var multi=parseInt(add)/100;
      var vat= total *multi;
      var vatt=  vat - total ;
      var vatt=vatt.toFixed(2);
      var vatable= total ;
      var tt=vat.toFixed(2);
    }  
    $('#vatable').html(vatable); 
    $('#vatt').html(vatt);
    $('#tt').html(tt);  
  } 

  function po_total(){ 
    var total=$('#ttt').html(); 
    $('#tt').html(total); 
  }

  function confirm_po(){
    var disc= 0;
    var vatable= $('#vatable').html(); 
    var vatt= $('#vatt').html();
    var perc= $('#perc-input').val();
    var sup = document.getElementById("sup_id").value; 
    var tt= $('#tt').html();
    if (tt==0) {
      var hulla = new hullabaloo();
        hulla.send('Warning!!! Sale Cannot be Empty', "warning");
        $('#modal').modal('toggle');
    }else{
      $.ajax({
        url: 'confirm_modal.php',
        type: 'POST',
        data: {disc:disc,vatable:vatable,vatt:vatt,tt:tt,perc:perc,sup:sup},
        dataType: 'html'
      })
      .done(function(data){ 
        $('#load').html(data); // blank before load.
      })
      .fail(function(){ 
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      });
    }
  }

  function hold(){
    $('#load').html(''); 
    console.log('loading');
    $.ajax({
      url: 'hold_modal.php',
      type: 'POST',
      data: ' ',
      dataType: 'html'
    })
    .done(function(data){ 
      $('#load').html(data); 
    })
    .fail(function(){ 
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }

  function cancel(){
    $('#load').html('');
    $.ajax({
      url: 'cancel_modal.php',
      type: 'POST',
      data: ' ',
      dataType: 'html'
    })
    .done(function(data){
      $('#load').html(''); // blank before load.
      $('#load').html(data); // blank before load.
    })
    .fail(function(){
      $('#load').html(''); // blank before load.
      $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }
  function sup(){
    var sup = document.getElementById("sup_id").value;
    if(sup>0){ 
      document.getElementById("print-po").style.display = "block";
    }else{
      document.getElementById("print-po").style.display = "none";
    }
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

  $.fn.fetch_items = function(){ 
    $('#item_id').empty(); 
    $.ajax({
      type: "GET",
      url: '../../gen/itemsoptions.php', 
      data: { },
      success:  function(data) {  
        $('#item_id').append(data);
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

  function quick_item(){
     $.ajax({
      type: 'GET',
      url: '../prods/prods_new.php',
      data: { }, 
       success:  function(data) {
          $.fn.get_cat();
        $('#load').html(data); 
      }
    });
  }

  function btnSubmitForm() {
    var item_id = $("#item_id").val();
    var quantity = $("#qty").val();
    var price = $("#price").val(); 
    $.post("../kugura/po_action.php", { item_id: item_id, quantity: quantity ,price : price},
    function(data) {
      $('#results').html(data); 
      $.fn.fetch_items();
      load_items();
      $("#qty").val('');
      $("#price").val(''); 
      $("#total").val(''); 
      po_total();
    }); 
  }
   
  function showbtn(){ 
    var id=$('input:focus').attr('id'); 
    $(".btn-div").hide();
    $("."+id).show(); 
  }
  function showbtndisc(){ 
    var id=$('input:focus').attr('id'); 
    $(".btndisc-div").hide();
    $("."+id).show(); 
  }

  function updatepo(id) {  
    var qty = $("#btn"+id).val();  
    $.ajax({
      url: 'update_po.php',
      type: 'POST',
      data: 'item_id='+id+'&qty='+qty,
      dataType: 'html'
    })
    .done(function(data){
      load_items();
      po_total();
      $('#results').html(''); // blank before load.
      $('#results').html(data); // blank before load.;
    })
    .fail(function(){
      $('#results').html(''); // blank before load.
      $('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }

  function updatepodisc(id) {  
    var disc = $("#btndisc"+id).val();  
    $.ajax({
      url: 'update_podisc.php',
      type: 'POST',
      data: 'item_id='+id+'&disc='+disc,
      dataType: 'html'
    })
    .done(function(data){
      load_items();
      po_total();
      $('#results').html(''); // blank before load.
      $('#results').html(data); // blank before load.;
    })
    .fail(function(){
      $('#results').html(''); // blank before load.
      $('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }

  function del_this(id){ 
    $.ajax({
      url: 'po_item_del.php',
      type: 'POST',
      data: 'id='+id,
      dataType: 'html'
    })
    .done(function(data) { 
      load_items();
      po_total();
    })
    .fail(function() { 
      $('#d1').html(''); // blank before load.
      $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
  }
