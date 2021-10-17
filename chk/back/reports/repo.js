function repo(){
  var report = document.getElementById("repo").value;
  $('#filter_result').html("");  
  if(report == 0){ 
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'none';
    document.getElementById('div-date2').style.display = 'none';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
  } else if(report == 1) { 
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","day_sale()");
  } else if (report == 2) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cash_sale()");
  } else if (report == 3) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'block';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cred_sale()");
  } else if (report == 4) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'block';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cust_sale()");
  } else if (report == 5) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'block';
    // document.getElementById('div-subcat').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cat_sale()");
    $.fn.get_cat();
  } else if (report == 6) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'none';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","cred_age()"); 
  } else if (report == 7) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","item_sum()"); 
  } else if (report == 8) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-item').style.display = 'block';
    document.getElementById('div-date1').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $("#filter").attr("onclick","item_hist()"); 
  } else if (report == 9) {
    document.getElementById('div-users').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block'; 
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $.fn.get_users();
    $("#filter").attr("onclick","user_sales()"); 
  } else if (report == 10) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $("#filter").attr("onclick","filtered_sales()"); 
  } else if (report == 11) {
    document.getElementById('div-users').style.display = 'block';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $.fn.get_users();
    $("#filter").attr("onclick","user_cat_sales()"); 
  } else if (report == 12) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    // document.getElementById('div-shop').style.display = 'none';
    document.getElementById('div-date2').style.display = 'block';
    document.getElementById('div-det').style.display = 'none';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    $.fn.get_users();
    $("#filter").attr("onclick","day_purc()"); 
  } else if (report == 13) {
    document.getElementById('div-users').style.display = 'none';
    document.getElementById('div-date1').style.display = 'block';
    document.getElementById('div-date2').style.display = 'block'; 
    document.getElementById('div-det').style.display = 'block';
    document.getElementById('div-cust').style.display = 'none';
    document.getElementById('div-cat').style.display = 'none';
    document.getElementById('div-subcat').style.display = 'none';
    document.getElementById('div-item').style.display = 'none';
    $("#filter").attr("onclick","filt_purc()");
  }
}
function item_hist(){
    start_date = document.getElementById('pick').value;
    end_date = document.getElementById('pick2').value;
    item = document.getElementById('item').value;
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","item_hist.php?start_date="+start_date+"&end_date="+end_date+"&item="+item,false);
    xmlhttp.send(null);
    document.getElementById("filter_result").innerHTML = xmlhttp.responseText;
    document.getElementById("filter_result").style.visibility = "visible";
}
function item_sum(){
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
  xmlhttp = new XMLHttpRequest();
  xmlhttp.open("GET","item_sum.php?start_date="+start_date+"&end_date="+end_date,false);
  xmlhttp.send(null);
  document.getElementById("filter_result").innerHTML = xmlhttp.responseText;
  document.getElementById("filter_result").style.visibility = "visible";
}
function cash_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  det =$('input[name="det"]:checked').val();
  console.log(det);
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cash_sales.php',
            typr: 'POST', 
            data: {id:1,start_date:start_date,end_date:end_date,det:det},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
  }
}
function filt_purc(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  var det =$('input[name="det"]:checked').val();

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'filt_purc.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
  }
}
function cred_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  var det =$('input[name="det"]:checked').val();

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cash_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
           // $('#modal-loader').hide();
        });
  }
}
function cust_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  cust_id = document.getElementById('cust').value;
  var det =$('input[name="det"]:checked').val();

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(cust_id === '' ||cust_id==null ||cust_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Customer!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'cust_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,det:det,cust_id:cust_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
}
function cat_sale(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  cust_id = document.getElementById('cust').value;
  var det =$('input[name="det"]:checked').val();
  var cat_id = document.getElementById('cat_id').value; 
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(cat_id === '' ||cat_id==null ||cat_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'cat_sale.php',
      typr: 'POST', 
      data: {id:2,start_date:start_date,end_date:end_date,det:det,cat_id:cat_id},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    });
  }
} 
function user_sales(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  if( $('#user_id :selected').length > 0){ 
    var user_id = [];
    $('#user_id :selected').each(function(i, selected) {
        user_id[i] = $(selected).val();
    }); 
  } else {
    var user_id = document.getElementById('user_id').value; 
  } 
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(user_id === '' ||user_id==null ||user_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'user_sales.php',
      typr: 'POST', 
      data: {id:2,start_date:start_date,end_date:end_date,user_id:user_id},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    });
  }
} 
function user_cat_sales(){
  $('#filter_result').html(""); 
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value; 
  if( $('#user_id :selected').length > 0){ 
    var user_id = [];
    $('#user_id :selected').each(function(i, selected) {
        user_id[i] = $(selected).val();
    }); 
  } else {
    var user_id = document.getElementById('user_id').value; 
  } 
  console.log(user_id); 

  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  }  else if(user_id === '' ||user_id==null ||user_id==0){
    var hulla = new hullabaloo();
    hulla.send('You Must Select a Category!!!!!', "danger");
  } else {
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
            url: 'user_cat_sales.php',
            typr: 'POST', 
            data: {id:2,start_date:start_date,end_date:end_date,user_id:user_id},
            dataType: 'html'
        })
        .done(function(data){
            $('#filter_result').html(''); 
            $('#filter_result').html(data);
        })
        .fail(function() {
            $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
        });
  }
} 
function day_sale(){ 
  $('#filter_result').html(""); 
  $('#filter_result').append('<table id="data-table-scroller" class="table table-striped table-bordered display">'
    +'<thead>'
    +'<tr>'
      +'<th>NO#</th>'
      +'<th>DAY</th>'
      +'<th>CASH TOTAL</th>'
      +'<th>CREDIT TOTAL</th>'
      +'</tr>'
    +'</thead>'
  +'</table>');

  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  // test for empty string
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  } else {
    if ($('#data-table-scroller').length !== 0) {
      $('#data-table-scroller').DataTable({ 
        processing: true,
        serverSide: true, 
        deferRender:    true,
        scrollY:        300,
        scrollCollapse: true,
        scroller:       true,
        responsive:     true, 
        ajax: {
          url: "daily_sales.php", 
          data: {action: 'daysale', start_date:start_date,end_date:end_date},  
          type: 'GET', 
        }
      });
    } 
  } 
}
function day_purc(){ 
  $('#filter_result').html(""); 
  $('#filter_result').append('<table id="data-table-scroller" class="table table-striped table-bordered display">'
    +'<thead>'
    +'<tr>'
      +'<th>NO#</th>'
      +'<th>DAY</th>'
      +'<th>TOTAL</th>' 
      +'</tr>'
    +'</thead>'
  +'</table>');

  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;
  // test for empty string
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if(end_date === '' ||end_date==null){
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger");
  } else {
    if ($('#data-table-scroller').length !== 0) {
      $('#data-table-scroller').DataTable({ 
        processing: true,
        serverSide: true, 
        deferRender:    true,
        scrollY:        300,
        scrollCollapse: true,
        scroller:       true,
        responsive:     true, 
        ajax: {
          url: "daily_purc.php", 
          data: {action: 'daysale', start_date:start_date,end_date:end_date},  
          type: 'GET', 
        }
      });
    } 
  } 
}
function cred_age(){
  start_date = document.getElementById('pick').value; 
  det =$('input[name="det"]:checked').val();
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else {
    $('#filter_result').html('');  
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'credit_aging.php',
      typr: 'POST', 
      data: {start_date:start_date,det:det},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    }); 
  }
}

function filtered_sales(){
  start_date = document.getElementById('pick').value;
  end_date = document.getElementById('pick2').value;  
  if (start_date === '' ||start_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the Start Date!!!!!', "danger"); 
  } else if (end_date === '' ||end_date==null) {
    var hulla = new hullabaloo();
    hulla.send('You Must Select the End Date!!!!!', "danger"); 
  } else {
    $('#filter_result').html("");  
    $("#filter_result").html("<img src=../../assets/img/loader/pwait.gif>");
    $.ajax({
      url: 'filt_sales.php',
      typr: 'POST', 
      data: {start_date:start_date, end_date:end_date},
      dataType: 'html'
    })
    .done(function(data){
      $('#filter_result').html(''); 
      $('#filter_result').html(data);
    })
    .fail(function() {
      $('#filter_result').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
    }); 
  }
}
function view(id){
  $('#modal').modal('show');
  $.ajax({
      url: '../../gen/sale_items.php',
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

$(document).ready(function() {
  App.init();
  document.getElementById('div-users').style.display = 'none';
  document.getElementById('div-date1').style.display = 'none';
  document.getElementById('div-date2').style.display = 'none';
  // document.getElementById('div-shop').style.display = 'none';
  document.getElementById('div-det').style.display = 'none';
  document.getElementById('div-cust').style.display = 'none';
  document.getElementById('div-cat').style.display = 'none';
  document.getElementById('div-subcat').style.display = 'none';
  document.getElementById('div-item').style.display = 'none'; 
  $(".selectpicker").select2(); 
  $(".multiple-select2").select2({ placeholder: "Select a state" });
  $("#cat_id").change(function(event){
     var selected = $(this).val();
     $('#sub_id').removeAttr('disabled');
     $('#sub_id').empty();
     console.log(selected);
     $.ajax({ 
      type: "GET",
      url: '../../gen/get_subs.php',
      data: { id: selected },
      success:  function(data) { 
        $('#sub_id').append(data);
      }
    });
  });
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
  $.fn.get_users = function(){ 
    $('#user_id').empty(); 
    $.ajax({
      type: "GET",
      url: '../../gen/get_users.php', 
      data: { },
      success:  function(data) {  
        $('#user_id').append(data);
      }
    });
  }
});