// Add your custom JS code here
$(document ).ready(function(){ 
    $(document).on('click','#gen', function(e){
        $.ajax({
            url: '../settings/gen_set.php',
            typr: 'POST', 
            data: '',
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
    $(document).on('click','#uom', function(e){  
        $.ajax({
            url: 'uom.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
            load_list("uom-res","uom_list.php");
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        });
    });
    $(document).on('click','#take', function(e){  
        $.ajax({
            url: 'stock_take.php',
            typr: 'POST', 
            data: '',
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
    $(document).on('click','#tax', function(e){  
        $.ajax({
            url: '../settings/tax.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
            load_list("tax-res","tax_list.php");
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        });
    });
    $(document).on('click','#sales', function(e){  
        $.ajax({
            url: '../settings/sales_set.php',
            typr: 'POST', 
            data: '',
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
    $(document).on('click','#pay-method', function(e){  
        $.ajax({
            url: '../settings/pay_method.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
            load_item_list();
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
    });
    $(document).on('click','#dbback', function(e){ 
        //$('#load').html('');  
        //$('#modal-loader').show(); 
        $.ajax({
            url: '../settings/db_set.php',
            typr: 'POST', 
            data: '',
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
    $(document).on('click','#new-menu', function(e){ 
        $('#load').html('');  
        $('#modal-loader').show(); 
        $.ajax({
            url: '../settings/menu_new.php',
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
        console.log(uid);
        $('#load').html(''); // leave this diff blank
        $('#modal-loader').show(); // load ajax loader button cliked
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
 
    $(document).on('click','#thermal-print', function(e){ 
        $('#load').html('');  
        $('#modal-loader').show(); 
        $.ajax({
            url: '../settings/thermal.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });

    $(document).on('click','#A4-print', function(e){ 
        $('#load').html('');  
        $('#modal-loader').show(); 
        $.ajax({
            url: '../settings/a4.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });

    $(document).on('click','#points', function(e){ 
        $('#load').html('');  
        $('#modal-loader').show(); 
        $.ajax({
            url: '../settings/point_set.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){
            $('#set').html(''); 
            $('#set').html(data);
        })
        .fail(function() {
            $('#set').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
        });
    });

    $(document).on('change','#photo', function(e){
        $(".upload-msg").empty();  
        var file = this.files[0];
        var imagefile = file.type;
        var imageTypes= ["image/jpeg","image/png","image/jpg"];
        if(imageTypes.indexOf(imagefile) == -1){
          $(".upload-msg").html("<span class='msg-error'>Please Select A valid Image File</span><br /><span>Only jpeg, jpg and png Images type allowed</span>");
          return false;
        }else{
            var reader = new FileReader();
            reader.onload = function(e){
                $(".img-preview").html('');
                $(".img-preview").html('<img src="' + e.target.result + '" style="margin-bottom: 10px; width: 180px; height:auto;" />');        
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

    $(document).on('click','#edit', function(e){
        e.preventDefault();
        var uid = $(this).data('id'); // get id of clicked row
        $('#load').html(''); // leave this diff blank
        $('#modal-loader').show(); // load ajax loader button cliked
        $.ajax({
            url: '../settings/menu_edit.php',
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

function load_item_list(){ 
    xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById("payments").innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET","pay_mode_list.php",true);
    xmlhttp.send();
}

function load_list(id,path){ 
    xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById(id).innerHTML=xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET",path,true);
    xmlhttp.send();
}

function pay_edits(id){  
    $.ajax({
        url: 'pay_edit.php',
        typr: 'POST',                           
        data: {id:id},
        dataType: 'html'
    })
    .done(function(data){
        $('#pay_load').html(''); // blank before load.
        $('#pay_load').html(data);
        load_item_list();
    })
    .fail(function(){
        $('#pay_load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}

function pay_dis(id){  
    $.ajax({
        url: 'pay_dis.php',
        typr: 'POST',                           
        data: {id:id},
        dataType: 'html'
    })
    .done(function(data){
        $('#pay_load').html(''); // blank before load.
        $('#pay_load').html(data); 
    })
    .fail(function(){
        $('#pay_load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}

function uom_edit(id){  
    $.ajax({
        url: 'uom_edit.php',
        typr: 'POST',                           
        data: {id:id},
        dataType: 'html'
    })
    .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data);
    })
    .fail(function(){
        $('#load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}
function tax_edit(id){  
    $.ajax({
        url: 'tax_edit.php',
        typr: 'POST',                           
        data: {id:id},
        dataType: 'html'
    })
    .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data);
    })
    .fail(function(){
        $('#load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}

function tax_dis(id){  
    $.ajax({
        url: 'tax_dis.php',
        typr: 'POST',                           
        data: {id:id},
        dataType: 'html'
    })
    .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data); 
    })
    .fail(function(){
        $('#load').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
}