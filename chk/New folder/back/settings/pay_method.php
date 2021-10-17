<?php

session_start();
include("../../inc/connection.php");

include('funcs.php');

?>

<!-- begin panel -->

<div class="panel panel-inverse" data-sortable-id="form-validation-2"> 

   <!-- begin panel-body -->

    <div class="panel-body "> 

        

        <fieldset>

            <legend class="m-b-15">Payment methods</legend><div id="results"></div>

            <div class="form-group row m-b-15">

                <div class="form-group col-md-4">

                <div class="form-group col-md-12">

                    <label>Payment Name</label>

                    <input type="text" class="form-control" name="name" id="name" />

                </div> 

                <div class="form-group col-md-10 col-sm-12">

                    <label >Bank to Affect</label>

                    <select class="form-control" id="bank" name="bank" onchange=""> 

            <option  value="">--------SELECT BANK-------</option>     <?php

          $bank = "SELECT * FROM kp_banks WHERE  del_status=2";

          $bank_r = mysqli_query($connection,$bank) or die("Error getting categories");

          while ($ct = mysqli_fetch_assoc($bank_r)) {

              $name = $ct['acc_name'];

              $bank_id = $ct['bank_id'];

              ?>

              <option  value="<?php echo $bank_id; ?>"><?php echo $name; ?></option>

              <?php

          }

          ?>

          </select>

                  </div>

                   <div class="form-group col-md-10">

                    <div class="row" style="margin: 0 0px;">

                        <label class="col-md-8" >Select Payment Color</label>

                        <input id="color"  class="form-control col-md-6">

                        <div class="form-group-prepend col-md-3" style="margin: 0 -15px;">

                           <a class="btn btn-warning" data-toggle="dropdown">Color</a>

                          <ul class="dropdown-menu">

                            <li><div id="colorpalette1"></div></li>

                          </ul>   

                        </div>

                    </div>  

              </div>

               <div class="form-group row col-md-12" >

                  <label class="col-md-8" >Payment has Code/No./Ref #</label>

                  <div class="col-md-12" >

                      <div class="radio radio-css radio-inline">

                          <input type="radio" name="has-ref" id="yes" value="1" />

                          <label for="yes">Yes</label>

                      </div>

                      <div class="radio radio-css radio-inline">

                          <input type="radio" name="has-ref" id="no" value="2" />

                          <label for="no">No</label>

                      </div>

                  </div>

              </div>

<div class="form-group row col-md-12" >

  <label class="col-md-8" >Has Change</label>

    <div class="col-md-12" >

        <div class="radio radio-css radio-inline">

            <input type="radio" name="has-change" id="change-yes" value="1" />

            <label for="change-yes">Yes</label>

        </div>

        <div class="radio radio-css radio-inline">

            <input type="radio" name="has-change" id="change-no" value="2" />

            <label for="change-no">No</label>

        </div>

    </div>

</div>

</div>

            <div class="form-group col-md-6 ">

                <fieldset id="payments">

            <!-- <legend class="m-b-15">Payment methods list </legend>

             <table class="table table-bordered">

                <tr> 

                    <th>Payment Name</th> 

                    <th>Bank to Affect</th>

                    <th>Button Color</th>

                    <th>Creation Time</th>

                    <th>Created By</th>  

                </tr>

            </thead> 

             </table> -->

        </fieldset>

            </div>

        </div>

        </fieldset>

        

   

                          

    </div>

    <!-- end panel-body -->

    <!--start footer-->

    <div class="panel-footer">

        <button type="button" name="new-pay" id="new-pay" class=" btn btn-lime ">Save</button>

    </div>  

</div>

<!-- end panel --> 

<div  id="pay-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">

   <div class="modal-dialog"  id="pay_load"></div>

</div>

<script>

  $('#colorpalette1').colorPalette().on('selectColor', function(e) {

        $('#color').val(e.color);

      });

document.getElementById('new-pay').addEventListener('click', general);



function general(){

    var name = $("#name").val();

    var color = $("#color").val(); 

    var bank = $("#bank").val(); 

    var has_ref = $("input[name='has-ref']:checked").val();

    var has_change = $("input[name='has-change']:checked").val();

    $.ajax({

        url: 'pay_meth_act.php',

        typr: 'POST',                           

        data: { name:name, color:color, bank:bank, has_ref:has_ref, has_change:has_change },

        dataType: 'html'

    })

    .done(function(data){

        $('#results').html(''); // blank before load.

        $('#results').html(data);

        load_item_list();

    })

    .fail(function(){

        $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');

    });

  }

  

</script>

 