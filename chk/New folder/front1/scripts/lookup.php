<?php
session_start();
include('../../inc/connection.php'); 
include('funcs.php');
$user_id = $_SESSION['user_id'];
$action="LOADED|-|-|-|ITEM LOOK UP ON SALE PAGE|";
logs($action,"../../"); 
$no=0;
 ?>
<div class="modal-content" style="width: 800px;">
  <div class="modal-header">
    <input type="text" class="form-control" name="search-bar" onfocus="this.value=''" id="search-bar"/> 
  </div>
  <div class="modal-body"  style="overflow-y:scroll; height: 500px; width: auto; background-color: #fff;"> 
    <table class="table table-bordered" id="TheSo">
    <thead>
      <tr>
        <th>#</th>
        <th>Item Name</th>
        <th>Stock</th>
        <th>Buying Price</th>
        <th>Selling</th> 
      </tr>
    </thead>
    <tbody id="search-load">
       
          </tbody>
        </table>
</div> 
</div>
<script type="text/javascript"> 
  $(document).ready(function(){
    $("#search-bar").focus();
    $( "#search-bar" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "../gen/item_look.php",
          type: 'post',
          dataType: "html",
          data: {
            search: request.term
          } 
        })
        .done(function(data){ 
          $('#search-load').html(''); // blank before load.
          $('#search-load').html(data);
        })
      } 
    });
  });
</script>