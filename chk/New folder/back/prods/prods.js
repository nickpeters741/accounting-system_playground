function imp(){
  var form = $("#import");
  var formData = new FormData(form[0]);
  $("#results").html("<img src=../../assets/img/loader/uploading.gif>");
  $.ajax({
    type: "POST",
    url: 'import.php',
    data: formData,
    contentType: false,
    processData: false,
  })
  .done(function(data){  
    $('#results').html('');
    $('#results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
function priview(){
  var form = $("#import");
  var formData = new FormData(form[0]);
  $("#results").html("<img src=../../assets/img/loader/uploading.gif>"); 
  $.ajax({
    type: "POST",
    url: 'preview.php',
    data: formData,
    contentType: false,
    processData: false,
  })
  .done(function(data){  
    $('#results').html('');
    $('#results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}
function showRecords() {
  $('.act_btn').hide(); 
  // $.ajax({
  //   type: "POST",
  //   url: 'get_items.php',
  //   data: {},
  //   contentType: false,
  //   processData: false,
  // })
  // .done(function(data){  
  //   console.log(data);
  // })
  var dt = $('#data-table-combine').DataTable( {
    "processing": true,
    "serverSide": true,
    "ajax": "get_items.php", 
    "columns": [
      { data: null, defaultContent: '<input type="checkbox" name="items[]" onclick="item_select()" class="bulk" />' }, 
      { "class": "item_id", "data":  "id"},
      { "class": "code",    "data": "stock_code" },
      { "class": "name",    "data": "name"  },
      { "class": "cat",     "data": "cat_id" },
      { "class": "sub",     "data": "sub_id" },
      { "class": "bprice",  "data": "bprice"  },
      { "class": "base",    "data": "base_price" },
      { "class": "dprice",  "data": "dprice" },
      { "class": "wprice",  "data": "wprice" },
      { "class": "sprice",  "data": "sprice" },
      { "data": "stock" },
      { "class": "uom",  "data": "uom" },
      { "data": "tax" },
      { "class": "bulk",  "data": "bulk" },
      { "class": "pcs",  "data": "pcs" },
      { "class": "break_item",  "data": "break_item" },
      { "class": "barcode", "data":  "bar"}
    ], 
    columnDefs: [
      {"targets": [0], "searchable": false, "orderable": false, "visible": true }
    ],
    createdRow: function( row, data, dataIndex ) { 
      item_id=$(row).find('td:eq(1)').html();

      cat_id=$(row).find('td:eq(4)').html();
      get_name("kp_category","name","cat_id",cat_id,"cat"+item_id);

      sub_id=$(row).find('td:eq(5)').html();
      get_name("kp_sub_cat","name","sub_id",sub_id,"sub"+item_id);

      tax_id=$(row).find('td:eq(13)').html();
      get_name("kp_tax","percent","tax_id",tax_id,"tax"+item_id);

      b_item=$(row).find('td:eq(16)').html();
      get_name("kp_items","name","item_id",b_item,"b_item"+item_id);

      bulk= $(row).find('td:eq(14)').html();
      get_bool(bulk,"bulk"+item_id,item_id);

      bar=$(row).find('td:eq(17)').html(); 
      //console.log("barcode="+bar)

      $( row ).find('td:eq(1)').attr('contenteditable',"true");
      $( row ).find('td:eq(1)').attr('data-id1',item_id);
      $( row ).find('td:eq(2)').attr('contenteditable',"true");
      $( row ).find('td:eq(2)').attr('data-id1',item_id);
      $( row ).find('td:eq(3)').attr('contenteditable',"true");
      $( row ).find('td:eq(3)').attr('data-id1',item_id); 
      $( row ).find('td:eq(4)').attr('id',"cat"+item_id);
      $( row ).find('td:eq(5)').attr('id',"sub"+item_id); 
      $( row ).find('td:eq(6)').attr('contenteditable',"true");
      $( row ).find('td:eq(6)').attr('data-id1',item_id);
      $( row ).find('td:eq(7)').attr('contenteditable',"true");
      $( row ).find('td:eq(7)').attr('data-id1',item_id);
      $( row ).find('td:eq(8)').attr('contenteditable',"true");
      $( row ).find('td:eq(8)').attr('data-id1',item_id);
      $( row ).find('td:eq(9)').attr('contenteditable',"true");
      $( row ).find('td:eq(9)').attr('data-id1',item_id);
      $( row ).find('td:eq(10)').attr('contenteditable',"true");
      $( row ).find('td:eq(10)').attr('data-id1',item_id);
      $( row ).find('td:eq(12)').attr('contenteditable',"true");
      $( row ).find('td:eq(12)').attr('data-id1',item_id);
      $( row ).find('td:eq(13)').attr('id',"tax"+item_id);
      $( row ).find('td:eq(14)').attr('id',"bulk"+item_id);
      $( row ).find('td:eq(14)').attr('data-id1',item_id);
      $( row ).find('td:eq(15)').attr('id',"pcs"+item_id); 
      $( row ).find('td:eq(15)').attr('contenteditable',"true");
      $( row ).find('td:eq(15)').attr('data-id1',item_id); 
      $( row ).find('td:eq(16)').attr('id',"b_item"+item_id);
      $( row ).find('td:eq(17)').attr('id',"bar"+item_id);
      $( row ).find('td:eq(17)').attr('data-id',item_id);
    },
    "order": [[3, 'asc']]
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
function get_bool(value,id,item){ 
  $.ajax({
    type: "GET",
    url: '../../gen/get_bool.php', 
    data: {value:value,item:item},
    success:  function(data) {   
      document.getElementById(id).innerHTML = data;
    }
  });
}
function get_name(table,column,fcolumn,filter,id){ 
  $.ajax({
    type: "GET",
    url: '../../gen/get_column.php', 
    data: {table:table,column:column,fcolumn:fcolumn,filter:filter },
    success:  function(data) {   
      document.getElementById(id).innerHTML = data;
    }
  });
}
function edit_data(id, text, column_name,field){  
  $.ajax({  
    url:"edit.php",  
    method:"POST",  
    data:{id:id, text:text, column_name:column_name,field:field},  
    dataType:"text",  
    success:function(data){  
      var hulla = new hullabaloo();
      hulla.send(data, "success"); 
    }  
  });  
}
$(document).on('dblclick', '.barcode', function(){  
  var id = $(this).data("id");
  $('#modal').modal('show');
  $('#load').html(''); // leave this diff blank 
  $.ajax({
    url: 'bar_edit.php',
    typr: 'POST',
    data: {id:id},
    dataType: 'html'
  })
  .done(function(data){
    $.fn.get_cat();
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});  
$(document).on('blur', '.name', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text(); 
  edit_data(id, text, "name","Name");  
});
$(document).on('blur', '.code', function(){ 
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "stock_code","Stock code");  
}); 
$(document).on('blur', '.sprice', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "sprice", "Selling Price");  
});  
$(document).on('blur', '.wprice', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "wprice", "Wholesale Price");  
}); 
$(document).on('blur', '.dprice', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "dprice", "Distributor Price");  
}); 
$(document).on('blur', '.bprice', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "bprice","Buying Price");  
});  
$(document).on('blur', '.base', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "base_price","Base Price");  
}); 
$(document).on('blur', '.uom', function(){  
  var id = $(this).data("id1");  
  var text = $(this).text();  
  edit_data(id, text, "uom","Unit of Measure");  
}); 
$(function(){
  $('.checkAll').click(function(){
    if (this.checked) {
      $(".bulk").prop("checked", true);
      $('.act_btn').show(); 
    } else {
      $(".bulk").prop("checked", false);
      $('.act_btn').hide();
    } 
  });
});
function item_select(){
  var checked = (function () {
    var valor = [];
    $('input:checked').each(function () {
        if (this.checked)
          var row = $(this).closest("tr")[0]; 
          valor.push(row.cells[1].innerHTML);
    });
    return valor;
  })();
  if (checked.length > 0){
    $('.act_btn').show();
  }else{
    $('.act_btn').hide();
  }
} 
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
        data: 'name='+name+'&desc='+desc+'&code='+code+'&st=2',
        dataType: 'html'
    })
    .done(function(data){
      $('#results').html('');
      $('#results').html(data);
      $.fn.get_cat();
    })
    .fail(function(){
        $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}
function new_sub(){
  $('#new_cat').text(''); 
  var name = $("#name").val();
  var desc = $("#desc").val();
  var cat = $("#main-cat").val();
  var code = $("#sub_code").val();  
  $.ajax({
    url: '../sub/sub_new_act.php',
    typr: 'POST',                           
    data: 'name='+name+'&desc='+desc+'&cat='+cat+'&code='+code+'&st=2',
    dataType: 'html'
  })
  .done(function(data){
    $('#results').html(''); 
    $('#results').html(data);
  })
  .fail(function(){
    $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
}

$(document).on('click','#prods-add', function(e){
  e.preventDefault(); 
  $('#load').html(''); // leave this diff blank
  $('#modal-loader').show(); // load ajax loader button cliked
  $.ajax({
    url: 'prods_new.php',
    typr: 'POST',
    data: '',
    dataType: 'html'
  })
  .done(function(data){
    $.fn.get_cat();
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});

$(document).on('click','#cat', function(e){
  e.preventDefault(); 
  $('#load').html('');
  $('#modal-loader').show(); 
  var items = [];
  $('input[name="items[]"]:checked').each(function() { 
    if (this.checked)
      var row = $(this).closest("tr")[0]; 
      items.push(row.cells[1].innerHTML); 
  });  
  $.ajax({
    url: 'prod_cat.php',
    typr: 'POST',
    data: 'items='+items
    ,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});

$(document).on('click','#new-cat', function(e){
  e.preventDefault(); 
  $('#load2').html(''); 
  $.ajax({
    url: '../cat/cat_new.php',
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
  });
});

$(document).on('click','#new-sub', function(e){
  e.preventDefault(); 
  $('#load2').html(''); 
  $.ajax({
    url: '../sub/sub_new.php',
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
  });
});

$(document).on('click','#sub_cat', function(e){
  e.preventDefault(); 
  $('#load').html(''); 
  var items = [];
  $('input[name="items[]"]:checked').each(function() { 
    if (this.checked)
      var row = $(this).closest("tr")[0]; 
      items.push(row.cells[1].innerHTML); 
  });  
  $.ajax({
    url: 'prod_sub.php',
    typr: 'POST',
    data: 'items='+items
    ,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});

$(document).on('click','#del', function(e){
  e.preventDefault(); 
  $('#load').html(''); 
  var items = [];
  $('input[name="items[]"]:checked').each(function() { 
    if (this.checked)
      var row = $(this).closest("tr")[0]; 
      items.push(row.cells[1].innerHTML); 
  });  
  $.ajax({
    url: 'prods_del.php',
    typr: 'POST',
    data: 'items='+items
    ,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});

$(document).on('click','#tax', function(e){
  e.preventDefault(); 
  $('#load').html(''); 
  var items = [];
  $('input[name="items[]"]:checked').each(function() { 
    if (this.checked)
      var row = $(this).closest("tr")[0]; 
      items.push(row.cells[1].innerHTML); 
  });  
  $.ajax({
    url: 'prods_tax.php',
    typr: 'POST',
    data: 'items='+items
    ,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});

$(document).on('click','#bulk', function(e){
  e.preventDefault(); 
  $('#load').html(''); 
  item=$(this).data("id")
  $.ajax({
    url: 'prods_bulk.php',
    typr: 'POST',
    data: 'item='+item
    ,
    dataType: 'html'
  })
  .done(function(data){
    $('#load').html(''); // blank before load.
    $('#load').html(data);
  })
  .fail(function(){
    $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
  });
});