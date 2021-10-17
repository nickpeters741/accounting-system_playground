<?php 
session_start();
include("../../inc/connection.php");

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

       	<div class="col-sm-6">

                <div class="col-sm-12">

                    <fieldset>

                        <legend class="m-b-15">Company Details</legend>

                        <div class="form-group m-b-15" id="link-div">

                            <label class="col-form-label">Company Name* :</label> 

                            <input class="form-control" type="text" id="name" name="name" value="<?php echo $row['company_name']; ?>" placeholder="Enter Company name" /> 

                        </div> 

                        <div class="form-group m-b-15" id="link-div">

                            <label class="col-form-label">Company Tag* :</label> 

                            <input class="form-control" type="text" id="tag" name="tag" value="<?php echo $row['company_tag']; ?>"  placeholder="Enter Company tag" /> 

                        </div>

                    </fieldset>  

                </div>

                <div class="col-sm-12">

                    <fieldset>

                        <legend class="m-b-15">Contacts Details</legend>  

                        <div class="form-group m-b-15" id="link-div">

                            <label class="col-form-label">Phone 1* :</label> 

                            <input class="form-control" type="text" id="phone" name="phone" value="<?php echo $row['phone1']; ?>"  placeholder="Enter Company Phone 1..." /> 

                        </div> 

                        <div class="form-group m-b-15" id="link-div">

                            <label class="col-form-label">Phone 2* :</label> 

                            <input class="form-control" type="text" id="phone2" name="phone2" value="<?php echo $row['phone2']; ?>"  placeholder="Enter Company Phone 2... " /> 

                        </div> 

                        <div class="form-group m-b-1" id="link-div">

                            <label class="col-form-label">Email* :</label> 

                            <input class="form-control" type="email" id="email" name="email" value="<?php echo $row['email']; ?>"  placeholder="Enter Company Email..." /> 

                        </div>

                        <div class="form-group m-b-1" id="link-div">

                            <label class="col-form-label">Website* :</label> 

                            <input class="form-control" type="website" id="website" name="website" value="<?php echo $row['website']; ?>"  placeholder="Enter Company Website..." /> 

                        </div>

                        <div class="form-group">

                            <label class="col-form-label">Address:</label> 

                            <textarea class="form-control pull-left" id="address" name="address"><?php echo $row['address']; ?> </textarea>  

                        </div>

                    </fieldset> 

                </div>             	 

		    </div>

            <div class="col-sm-6">

                <div class="col-sm-12">

                    <fieldset>

                        <legend class="m-b-15">Company Logo</legend>

                        <div class="form-group col-md-4">

                    <div class="form-group">

                        <div class="img-preview" >

                            <img src="<?php echo $row['image_path']; ?>" alt="No Image"  id="img" class="rounded-circle" style="margin-bottom: 10px; width: 180px; height:auto;">

                        </div>

                        <div class="upload-msg"></div>

                        <input type="file" name="photo" id="photo">

                    </div>

                </div>

                    </fieldset>

                </div> 

                <br>

                <div class="col-sm-12">

                    <fieldset>

                        <legend class="m-b-15" style="color: green;">MPESA Details</legend> 

                        <div class="form-group row">

                            <div class="form-group row col-md-12" >

                                <div class="col-md-6" style="background-color: green;">

                                    <div class="radio radio-css radio-inline">

                                        <input type="radio" name="mpesa-select" id="till" value="1" <?php if ($row['mpesa']==1) { echo "checked"; } ?>/>

                                        <label for="till" style="color:#fff;">TILL</label>

                                    </div>

                                    <div class="radio radio-css radio-inline">

                                        <input type="radio" name="mpesa-select" id="paybill" value="2" <?php if ($row['mpesa']==2) { echo "checked"; } ?>/>

                                        <label for="paybill"  style="color:#fff;">PAYBILL</label>

                                    </div>

                                </div>

                            </div>

                            <div class="form-group m-b-15 col-md-6" id="mpesa-div">

                                <label class="col-form-label">Mpesa No* :</label> 

                                <input class="form-control" type="text" id="mpesa-no" name="mpesa-no" value="<?php echo $row['mpesa_no']; ?>"  placeholder="Enter Till/Business Number..... " /> 

                            </div> 

                            <div class="form-group m-b-15 col-md-6" id="acc-div" style="display: none;">

                                <label class="col-form-label">Account* :</label> 

                                <input class="form-control" type="text" id="mpesa-account" name="mpesa-account" value="<?php echo $row['mpesa_account']; ?>"  placeholder="Enter Paybill Account Number... " /> 

                            </div> 

                        </div>

                    </fieldset>

                </div>

            </div> 

            

		</div></form> 

	<!-- end panel-body -->

	<!-- START PANEL FOOTER -->

    <div class="panel-footer text-right">

        <!-- <a href="javascript:;" class="btn btn-danger" data-dismiss="modal">Close</a> -->

        <button type="submit" id="submit-gen" class="btn btn-lime">Submit</button>

    </div>

	<!-- END PANEL FOOTER -->

</div>

<!-- end panel --> 

<script type="text/javascript">

    document.getElementById('till').addEventListener('click', till);

    document.getElementById('paybill').addEventListener('click', paybill);

    function till(){

        document.getElementById('acc-div').style.display = 'none'; 

        $("#mpesa-account").val('');

    } 

    function paybill(){

        document.getElementById('acc-div').style.display = 'block'; 

    } 



    document.getElementById('submit-gen').addEventListener('click', thermal);

    function thermal(){

        var form = $("#myform");

        var formData = new FormData(form[0]);

        $.ajax({

                type: "POST",

                url: '../settings/gen_set_act.php',

                data: formData,

                contentType: false, //this is requireded please see answers above

                processData: false, //this is requireded please see answers above

            })

        .done(function(data)

        {

            $('#results').html(''); // blank before load.

            $('#results').html(data);

        })

        .fail(function()

        {

            $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');

        });

    }

 

</script>