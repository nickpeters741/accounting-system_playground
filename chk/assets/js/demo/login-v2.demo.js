var handlelogin= function() {
    $(document).on('click','[data-click="logins"]', function(e){ 
        e.preventDefault();
        var cabi = $('#cabi').val(); 
        var shop = $('#shop').val();
        if (shop === 0 ||shop=='undefined' || shop==0) {
            var hulla = new hullabaloo();
            hulla.send('SELECT SHOP!!!!!You have to select Shop/Store', "danger"); 
        } else if (cabi === '' ||cabi==null) {
            var hulla = new hullabaloo();
            hulla.send('EMPTY PASSWORD!!!!!The password Cannot be Empty', "danger"); 
        } else {
            $.ajax({
                url: 'kuingira.php',
                typr: 'POST', 
                data: {cabi:cabi,shop:shop},
                dataType: 'html'
            })
            .done(function(data){    
                 console.log(data);
                $('#login-results').html(data); 
            })
            .fail(function() {
                $('#login-results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
            });
        } 
    });
};
var load_dash = function(){
    $.ajax({
        url: 'gen/select_dash.php',
        typr: 'POST', 
        data: '',
        dataType: 'html'
    })
    .done(function(data){     
        $('#modal-load').html(data); 
    })
    .fail(function() {
        $('#modal-load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
         
    });
 }
var handleLoginPageChangeBackground = function() {
    $(document).on('click', '[data-click="change-bg"]', function(e) {
        e.preventDefault();
        var targetImage = '[data-id="login-cover-image"]';
        var targetImageSrc = 'url(' + $(this).attr('data-img') +')';
        
        $(targetImage).css('background-image', targetImageSrc);
        $('[data-click="change-bg"]').closest('li').removeClass('active');
        $(this).closest('li').addClass('active');   
    });
};
var LoginV2 = function () {
	"use strict";
    return {
        init: function () {
            load_dash();
            handlelogin();
            handleLoginPageChangeBackground();
        }
    };
}();
