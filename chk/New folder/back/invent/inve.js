 
// Add your custom JS code here
$( document ).ready(function() { 
   
  function edit_data(id, text, column_name,field){  
    $.ajax({  
        url:"../prods/edit.php",  
        method:"POST",  
        data:{id:id, text:text, column_name:column_name,field:field},  
        dataType:"text",  
        success:function(data){  
        var hulla = new hullabaloo();
        hulla.send(data, "success"); 
        }  
    });  
  }   
    $(document).on('blur', '.qty', function(){ 
      console.log('loading'); 
      var item_id = $(this).data("id1");   
      var text = $(this).text();  
      edit_data(item_id,text, "qty","qty");  
    });

    $(document).on('blur', '.reorder', function(){ 
      console.log('loading'); 
      var item_id = $(this).data("id1");   
      var text = $(this).text();  
      edit_data(item_id,text, "reorder","reorder");  
    });  
    // Handler for .ready() called.
    $(document).on('click','#stock-adj', function(e){
      e.preventDefault(); 
      var uid = $(this).data('id'); // get id of clicked row 
      $('#stock-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: 'qty_adj.php',
        typr: 'POST',
        data: 'id='+uid,
        dataType: 'html'
      })
      .done(function(data){
        $('#stock-load').html(''); // blank before load.
        $('#stock-load').html(data);
      })
      .fail(function(){
        $('#stock-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });

       // Handler for .ready() called.
    $(document).on('click','#re-adj', function(e){
      e.preventDefault(); 
      var uid = $(this).data('id'); 
      $('#stock-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: 're_adj.php',
        typr: 'POST',
        data: 'id='+uid,
        dataType: 'html'
      })
      .done(function(data){
        $('#stock-load').html(''); // blank before load.
        $('#stock-load').html(data);
      })
      .fail(function(){
        $('#stock-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });

     $(document).on('click','#transfer', function(e){
      e.preventDefault(); 
      var uid = $(this).data('id'); // get id of clicked row  
      var store = $(this).data("id2");
      $('#stock-load').html(''); // leave this diff blank
      $('#modal-loader').show(); // load ajax loader button cliked
      $.ajax({
        url: 'stock_trans.php',
        typr: 'POST',
        data: 'id='+uid+'&store='+store,
        dataType: 'html'
      })
      .done(function(data){
        $('#stock-load').html(''); // blank before load.
        $('#stock-load').html(data);
      })
      .fail(function(){
        $('#stock-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
    });
});