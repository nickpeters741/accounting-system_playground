$(document).ready(function() {
    App.init();
    TableManageCombine.init();

    $(document).on('click','#new-menu', function(e){ 
        $('#load').html('');
        var pnl = $(this).data('id'); 
        $.ajax({
            url: 'menu_new.php',
            typr: 'POST', 
            data: 'pnl='+pnl,
            dataType: 'html'
        })
        .done(function(data){
            $('#load').html(''); 
            $('#load').html(data);
        })
        .fail(function() {
            $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });

    $(document).on('click','#edit', function(e){
        e.preventDefault();
        var uid = $(this).data('id'); // get id of clicked row 
        $('#load').html(''); // leave this diff blank 
        $.ajax({
            url: 'menu_edit.php',
            typr: 'POST',
            data: 'id='+uid,
            dataType: 'html'
        })
        .done(function(data){
            $('#load').html(''); // blank before load.
            $('#load').html(data);
        })
        .fail(function(){
            $('#dynamic-content').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });
    $(document).on('click','#del-menu', function(e){
        e.preventDefault();
        var uid = $(this).data('id'); // get id of clicked row 
        var pnl = $(this).data('id2'); // get id of clicked row 
        $('#load').html(''); // leave this diff blank 
        $.ajax({
            url: 'menu_del.php',
            typr: 'POST',
            data: {id:uid,pnl:pnl},
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
});