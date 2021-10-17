// Add your custom JS code here
$(document ).ready(function(){
    App.init();
    TableManageCombine.init();
   $(".select-picker").select2();
     $(document).on('click','#new', function(e){ 
        $('#load').html('');  
        $('#modal-loader').show(); 
        $.ajax({
            url: 'role_new.php',
            typr: 'POST', 
            data: '',
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
        $('#modal-loader').show(); // load ajax loader button cliked
        $.ajax({
            url: 'role_edit.php',
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
 

    $(document).on('click','#del', function(e){
        e.preventDefault();
        var uid = $(this).data('id'); // get id of clicked row
        $('#load').html(''); // leave this diff blank
        $('#modal-loader').show(); // load ajax loader button cliked
        $.ajax({
            url: 'role_del.php',
            typr: 'POST',
            data: 'id='+uid,
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