<?php
include("../../inc/connection.php");  
?> 
<div class="modal-content" style="width: 700px;">
  <div class="modal-header"> 
    <h4 class="modal-title">QUICK ADD ITEM</h4>
  </div>
  <form id="quick-form">
    <div class="modal-body"> 
      <div id="item-results"></div>
      <fieldset >
        <legend style="font-size:18px; color:purple;">ITEM DETAILS</legend>
        <div class="form-group row">
          <div class="col-md-4">
            <label >Item Name</label> *
            <input type="text" class="form-control form-control-xs"  id="quick-name" name="name"  placeholder="Enter the Item Name....."/>
            <p id="error-name" style="color: red;"></p>
          </div>
          <div class="col-md-4">
            <label>Select Category</label><br>
            <div class="input-group input-group-xs mb-3">
              <div class="input-group-prepend">
                <a class="btn btn-purple" data-toggle="modal" data-target="#modal2" id="new-cat"><i class='fa fa-lg fa-plus' ></i></a>   
              </div> 
              <select type="text" class="form-control form-control-xs col-lg-12 pickers"  id="cat_id" name="cat_id" style="width: 80%;">
              </select> 
            </div>
          </div>
          <div class="col-md-4">
            <label>Select Sub Category</label><br>
            <div class="input-group mb-3 input-group-xs">
              <div class="input-group-prepend">
                <a class="btn btn-purple" data-toggle="modal" data-target="#modal2"  id="new-sub"><i class='fa fa-lg fa-plus' ></i></a>   
              </div> 
              <select type="text" class=" form-control form-control-xs col-lg-12 pickers"  id="sub_id" name="sub_id" style="width: 80%;">
              </select> 
            </div>
          </div>
          <div class="col-md-4">
            <label >Stock Code</label>
            <input type="text" class="form-control form-control-xs"  id="code" name="code" placeholder="Enter the Stock Code....." required />
          </div>
        </div>
      </fieldset>
      <fieldset>
        <legend style="font-size:18px; color:purple;">Pricing</legend>
        <div class="form-group row"> 
          <div class="col-md-4">
            <label >Buying Price</label>
            <input type="number" class="form-control form-control-xs"  id="bprice" name="bprice" placeholder="Enter the Buying Price....." required />
          </div>  
          <div class="col-md-4">
            <label >Base Price</label>
            <input type="number" class="form-control form-control-xs"  id="base_price" name="base_price" placeholder="Enter the Base Price....." required />
            <p id="error-price" style="color: red;"></p>
          </div>
          <div class="col-md-4">
            <label >Distributor Price</label>
            <input type="number" class="form-control form-control-xs"  id="dist_price" name="dist_price" placeholder="Enter the Distributor Price....." required />
          </div>
          <div class="col-md-4">
            <label >Wholesale Price</label>
            <input type="number" class="form-control form-control-xs"  id="whole_price" name="whole_price" placeholder="Enter the Wholesale Price....." required />
          </div>
          <div class="col-md-4">
            <label >Selling Price</label>
            <input type="number" class="form-control form-control-xs"  id="sprice" name="sprice" placeholder="Enter the Selling Price....." required />
          </div>
          <div class="col-md-4">
            <label>Select Tax</label> 
            <select type="text" class="form-control form-control-xs pickers"  id="tax_id" name="tax_id" style="width: 100%; height: 25px;">
              <option  value="0">---SELECT TAX----</option>
              <?php
                $get_tax = mysqli_query($connection,"SELECT * FROM kp_tax") or die("Could not get the categories");
                while ($tat = mysqli_fetch_assoc($get_tax)) {
              ?>
              <option  value="<?php echo $tat['tax_id']; ?>"> <?php echo $tat['name']." ".$tat['percent']."%"; ?> </option>
              <?php
                }
              ?> 
            </select>    
          </div>
        </div>
      </fieldset>
      <fieldset>
        <legend style="font-size:18px; color:purple;">Unit Of Measure</legend>
        <div class="form-group row">
          <div class="col-md-4">
            <label >UOM</label>
            <input type="text" class="form-control form-control-xs"  id="uom" name="uom" placeholder="Enter the UOM....." required />
          </div>
           <div class="form-group col-md-8">
            <label style="color:red">Does it produce smaller quantites</label><br>
            <div class="radio radio-css radio-inline">
              <input type="radio" name="bulk" id="yes" value="1"/>
              <label for="yes" style="color:blue;">YES</label>
            </div>
            <div class="radio radio-css radio-inline">
              <input type="radio" name="bulk" id="no" value="2"/>
              <label for="no"  style="color:blue;">NO</label>
            </div>
          </div>
          <div class="col-md-4" id="div-pcs" style="display: none;">
            <label >Pieces Produced</label>
            <input type="number" class="form-control form-control-xs"  id="pcs" name="pcs" placeholder="Enter Pcs Produced....." required />
          </div>
          <div class="col-md-4" id="div-item" style="display: none;">
            <label>Select Item Produced</label> 
            <select type="text" class="form-control form-control-xs pickers"  id="items_prod" name="items_prod" style="width: 100%; height: 25px;">
              <option  value="0">---SELECT ITEMS PRODUCED----</option>
              <?php
                $get_tax = mysqli_query($connection,"SELECT * FROM kp_items") or die("Could not get the categories");
                while ($tat = mysqli_fetch_assoc($get_tax)) {
              ?>
              <option  value="<?php echo $tat['item_id']; ?>"> <?php echo $tat['name']; ?> </option>
              <?php
                }
              ?> 
            </select>    
          </div>
        </div>
      </fieldset>
    </div>
    <div class="modal-footer">
      <a href="javascript:;" class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
      <button type="button" name="new_prod" id="new_prod"  class="btn btn-xs btn-lime" onclick="item();">Save</button>
    </div>
  </form>
  </div>
</div>

<div  id="cat-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" id="cat-load"> 
  </div>
</div>

<script type="text/javascript"> 
  $(document).ready(function() {
    $("#cat_id").change(function(event){
      var selected = $(this).val();
      $('#sub_id').removeAttr('disabled');
      $('#sub_id').empty();
      $.ajax({ 
        type: "GET",
        url: '../../gen/get_subs.php',
        data: { id: selected },
        success:  function(data) { 
          $('#sub_id').append(data);
        }
      });
    });
  $('.pickers').select2({
    dropdownParent: $('#modal')
  }); 
    $('input[name="bulk"]').click(function() {    
      if($(this).val() == '1'){ 
        $('#div-pcs').show();
        $('#div-item').show(); 
      }else if($(this).val() == '2'){   
        $('#div-pcs').hide();
        $('#div-item').hide();
      }
    });
  });
 
  function save_cat(){
    var name = $("#cat-name").val(); 
    $.ajax({
      url: '../../gen/cat_act.php',
      typr: 'POST',
      async: false, 
      data: 'name='+name,
      dataType: 'html'
    })
    .done(function(data){ 
      $('#Modal2').modal('toggle');
      $('#item-results').html('');
      $.fn.get_cat();
      $('#item-results').html(data);
    })
    .fail(function(){
      $('#item-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }

function item(){ 
  var str = $( "#quick-form" ).serialize(); 
  console.log(str);  
  $.ajax({
    url: '../../back/prods/prod_new_act.php',
    type: 'POST',                           
    data: str,
    dataType: 'html'
  })
  .done(function(data){
    $('#item-results').html(data);
    //$('#modal').modal('toggle'); 
  })
  .fail(function(){
    $('#item-results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
  });
} 
</script>