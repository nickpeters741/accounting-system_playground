<?php 
session_start();
 include("../../inc/connection.php");

 include("funcs.php");

//  $get_company_details = mysqli_query($connection,"SELECT * FROM settings") or die("Could not get the product details");

// $row = mysqli_fetch_assoc($get_company_details);

$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");

$row = mysqli_fetch_assoc($get_gen_details);

?>

<!-- begin panel -->

    <div class="panel">

    	<!-- begin panel-body -->

    	<div id="results"></div>

         <form method="post" action=""  enctype="multipart/form-data" id="myform"> 

        <div class="panel-body row">

       	<div class="col-sm-12">

                <div class="col-sm-12">

                    <fieldset>

                        <legend class="m-b-15">Start Numbers/ID</legend>

                        <div class="form-group row">

                            <div class="form-group m-b-15 col-md-3" id="link-div">

                                <label class="col-form-label"> Cash sale No.* :</label> 

                                <input class="form-control" type="text" id="sale_id" name="sale_id" value="<?php echo get_id('kp_sale_id','sale_id'); ?>"/> 

                            </div> 

                            <div class="form-group m-b-15 col-md-3" id="link-div">

                                <label class="col-form-label">Purchase Number* :</label> 

                                <input class="form-control" type="text" id="po_id" name="po_id" value="<?php echo get_id('kp_po_id','po_id'); ?>"/> 

                            </div>

                            <div class="form-group m-b-15 col-md-3" id="link-div">

                                <label class="col-form-label">Requistion Number* : </label> 

                                <input class="form-control" type="text" id="req_id" name="req_id" value="<?php echo get_id('kp_req_id','req_id'); ?>"/> 

                            </div>

                            <div class="form-group m-b-15 col-md-3" id="link-div">

                                <label class="col-form-label">Petty Cash Id* : </label> 

                                <input class="form-control" type="text" id="petty_id" name="petty_id" value="<?php echo get_id('kp_petty_id','petty_id'); ?>"/> 

                            </div>

                        </div>

                    </fieldset>  

                </div>              	 

		    </div>

        </div>

    </form> 

	<!-- end panel-body -->

	<!-- START PANEL FOOTER -->

    <div class="panel-footer text-right">

        <!-- <a href="javascript:;" class="btn btn-danger" data-dismiss="modal">Close</a> -->

        <button type="submit" id="submit-sales" onclick="sales();" class="btn btn-lime">Submit</button>

    </div>

	<!-- END PANEL FOOTER -->

</div>

<!-- end panel --> 

<script type="text/javascript">

    //document.getElementById('submit-sales').addEventListener('click', sales);

    function sales(){

        var form = $("#myform");

        var formData = new FormData(form[0]);

        $.ajax({

            type: "POST",

            url: '../settings/sales_set_act.php',

            data: formData,

            contentType: false, //this is requireded please see answers above

            processData: false, //this is requireded please see answers above

        })

        .done(function(data){

            $('#results').html(''); // blank before load.

            $('#results').html(data);

        })

        .fail(function(){

            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');

        });

    }



//   function general()

//   {

//     $('#submit-gen').text('');

//     $('#submit-gen').append('<span> Please wait... </span>');

//     $('#submit-gen').attr('disabled',true);

//     var name = $("#name").val();

//     var phone = $("#phone").val();
//     var phone2 = $("#phone2").val();

//     var email = $("#email").val(); 

//      var address = $("#address").val();

//     $.ajax(

//         {

//             url: 'gen_set_act.php',

//             typr: 'POST',                           

//             data: 'name='+name+'&phone='+phone+'&phone2='+phone2+'&email='+email+'&address='+address,

//             dataType: 'html'

//         })

//         .done(function(data)

//          {

//             $('#results').html(''); // blank before load.

//             $('#results').html(data);



//         })

//         .fail(function()

//         {

//             $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');

            

//         });

//   }

</script>