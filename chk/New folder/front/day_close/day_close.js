$(document ).ready(function(){ 
    App.init();
    $(document).on('click','#cash', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_cash.php',
            typr: 'POST', 
            data: {id:1,day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
    });
    $(document).on('click','#credit', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_cash.php',
            typr: 'POST', 
            data: {id:2,day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
    });
    $(document).on('click','#cred-pay', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_cred_pay.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#item_sum', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_items.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#purc', function(e){ 
        var day = $(this).data("id"); 
        var shop = $(this).data("id2"); 
        $.ajax({
            url: 'day_purc.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#purc_items', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_purc_items.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#return', function(e){ 
        var day = $(this).data("id"); 
        var shop = $(this).data("id2"); 
        $.ajax({
            url: 'day_returns.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#return_items', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_ret_items.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#voided', function(e){ 
        var day = $(this).data("id");
        var shop = $(this).data("id2");  
        $.ajax({
            url: 'day_del_items.php',
            typr: 'POST', 
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#held', function(e){ 
        var day = $(this).data("id"); 
        $.ajax({
            url: '../gen/held.php',
            typr: 'POST', 
            data: {day:day},
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
    });
    $(document).on('click','#print', function(e){  
        var day = $(this).data("id"); 
        var shop = $(this).data("id2"); 
        // myWindow =window.open('../print/close_a4.php', '', 'height=600, width=350');  
        //myWindow.print();
        //myWindow.close();
        $('#modal').modal('show'); 
        $('#load').html('');  
        $.ajax({
            url: '../gen/zprint.php',
            typr: 'POST',
            data: {day:day,shop:shop},
            dataType: 'html'
        })
        .done(function(data){ 
            $('#load').html('');
            $('#load').html(data);
        })
        .fail(function(){
            $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        }); 
    });
});
 