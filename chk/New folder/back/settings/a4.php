<?php
session_start();
include("../../inc/connection.php");

$get_thermal_details = mysqli_query($connection,"SELECT * FROM kp_settings_print") or die("Could not get the print details");

$row = mysqli_fetch_assoc($get_thermal_details);



$get_gen_details = mysqli_query($connection,"SELECT * FROM kp_settings_gen") or die("Could not get the gen details");

$gen = mysqli_fetch_assoc($get_gen_details);



date_default_timezone_set("Africa/Nairobi");

$today=date("Y-m-d");

?>

    <style type="text/css">

      .p-order{ 

        padding:1mm;

        margin: 0;

        width:  210mm;

        height: 297mm;

        background: #FFF;

      }

      #footer {

        position:absolute;

        bottom:0;

        width:209mm;

        height:60px;   /* Height of the footer */

        background:#000;

        color: white;

      }

   @media print {

    @media print {

 

.table > thead > tr > th, 

.table > tbody > tr > th, 

.table > tfoot > tr > th, 

.table > thead > tr > td, 

.table > tbody > tr > td, 

.table > tfoot > tr > td {

    border: 1px solid #000;

    border-right: 2px solid black; 

}

      .p-order{ 

         

        margin: 0;

        width:  200mm;

        height: 297mm;

        background: #FFF; 

      }

      thead > tr > th >td {

  border:1px solid #000;

}

    .content {

        background-color: white !important;

        height: 100% !important;

        width: 100% !important;

        position: fixed !important;

        top: 0 !important;

        left: 0 !important;

        margin: 0 !important;

    }

    .hidden-print {

    display: none !important;

  }

    body,

    .content,

    .page-header-fixed {

        padding: 0 !important;

        margin: 0 !important;

    }

    .sidebar,

    .header,

    .theme-panel {

        display: none !important;

    }

  }

} 

         

 </style>

<!-- begin panel -->

<div class="panel panel-inverse" data-sortable-id="form-validation-2"> 

   <!-- begin panel-body -->

    <div class="panel-body ">

 <div class="row">

     <div class="col-md-4"> 

      <form method="post" action="" enctype="multipart/form-data" id="myform"> 

      <div class="form-group row">

       <div class="form-group row col-md-6">

            <label class="col-md-12"  style="color:blue;">Show Logo</label>

            <div class="col-md-12">

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="logo" id="logoyes" value="1"  <?php if ($row['show_logo']==1) { echo "checked"; } ?>/>

                    <label for="logoyes" style="color:blue;">YES</label>

              </div>

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="logo" id="logono" value="2"   <?php if ($row['show_logo']==2) { echo "checked"; } ?>/>

                    <label for="logono"  style="color:blue;">NO</label>

                </div>

            </div>

      </div> 

    </div> 

    <br>

      <!-- <div class="form-group row"> -->

      <div class="form-group row">

            <label class="col-md-12"  style="color:blue;">Show PIN</label>

            <div class="col-md-12">

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="pin" id="pinyes" value="1"  <?php if ($row['pin']==1) { echo "checked"; } ?> />

                    <label for="pinyes" style="color:blue;">YES</label>

              </div>

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="pin" id="pinno" value="2" <?php if ($row['pin']==2) { echo "checked"; } ?>/>

                    <label for="pinno"  style="color:blue;">NO</label>

                </div>

            </div>

      </div>



      <div class="form-group row">

            <label class="col-md-12"  style="color:blue;">Show Tax Calculations</label>

            <div class="col-md-12">

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="tax" id="taxyes" value="1" <?php if ($row['tax']==1) { echo "checked"; } ?>/>

                    <label for="taxyes" style="color:blue;">YES</label>

              </div>

              <div class="radio radio-css radio-inline">

                    <input type="radio" name="tax" id="taxno" value="2" <?php if ($row['tax']==2) { echo "checked"; } ?>/>

                    <label for="taxno"  style="color:blue;">NO</label>

                </div>

            </div>

      </div> 

    <br> <div>

            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>

            <button type="button" name="btn-thermal" id="btn-thermal" class="btn btn-sm btn-success">Save</button>

          </div> 



      </form>

    </div>    

     

           

    <div class="col-md-8">

        <div id="results"></div>

        <div class="p-order"> 

          <!--  Start panel body  -->

          <div class="panel-body p-order">

            <!-- begin invoice-header-->

            <div class="invoice-company row">

              <div class="col-md-6" style=" border-right: 3px solid green;">

                <?php if ($row['show_logo']==1 ){ ?>

            <img src="<?php echo $gen['image_path']; ?>" style="width: 250px; margin-left: 30px; margin-top: 20px;" /></br>

            <?php } ?>



              </div><div class="col-md-6">

               <h4><u>INVOICE</u> </h4>

                  <address class="m-b-5" style="font-size: 12px; margin-top: 40px;">

                    NO.9  Kijabe Street, Opp. Barot House, Town P.O Box 1330-00606, Nairobi,Tel. 0784100100

                  </address>

                </div>

              <div class="invoice-date pull-right col-md-6">

               

                <div class="date text-inverse m-t-5"><?php echo $ord_date;?></div>

                <div class="invoice-detail">

                  

                  </div>

                </div>

              </div>

              <!-- end invoice-header -->



              <!-- begin invoice-Details-->

              <div class="invoice-header">

                <div class="invoice-from">

                  <small>TO</small>

                  <address class="m-t-5 m-b-5">

                    <strong class="text-inverse"><?php echo "bname";?></strong><br />

                    <?php echo "address";?><br/> 

                    Phone: <?php echo "mobile";?><br/>

                    Email: <?php echo "email";?>

                  </address>

                </div>

                <div class="invoice-to">

                  

                  <address class="m-t-5 m-b-5">

                    <strong class="text-inverse">Invoice No: #: &nbsp;<?php echo "100";?></strong><br />

                     Date1: <br/>

                     Delivery Note No.<br/> 

                     LPO No.  

                  </address>

                </div>

              </div>

              <!-- end invoice-Details-->

              <div class="invoice-content">

                <table class="table table-invoice table-bordered">

                  <thead>

                    <tr>

                      <th>No</th>

                      <th>Details</th>

                      <th>Quantity</th>

                      <th>Unit Price</th>

                      <th>Total</th> 

                    </tr>

                  </thead>

                  <tbody> 

                    <tr>

                      <td>1</td>

                      <td>ITEM1</td>

                      <td>5</td>

                      <td>100</td>

                      <td>500</td> 

                    </tr>

                    <tr>

                      <td>2</td>

                      <td>ITEM2</td>

                      <td>5</td>

                      <td>100</td>

                      <td>500</td> 

                    </tr>

                          

                  </tbody>

                  <thead>

                    <tr>

                      <th colspan="4" class="text-center m-b-5"><h3><strong>TOTAL KSH:</strong></h3></th>

                      <th><h3><strong> 500</strong></h3></th>

                    </tr>

                  </thead>

              </table>

            </div>

            <div class="panel-body">

              * Prepared By <?php echo "Macharia"; ?><br><br>

              * Approved By ......................................<br>

              <a href="back/kubuy/po_pending.php" class="btn btn-success btn-sm hidden-print pull-left back" style="margin-top: 10px;">Back</a> &nbsp; 

              <a href="javascript:;" onclick="window.print()" class="btn btn-sm hidden-print btn-success m-b-10 print" style="margin-top: 10px;" ><i class="fa fa-print m-r-5"></i> Print</a>

            </div>

            <div id="footer">

              <div class="panel-body">

                <p class="text-center">

                  THANK YOU FOR YOUR BUSINESS<br/>

                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-globe"></i>www.gadgetworld.com</span>

                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-phone"></i> +254 71111111</span>

                  <span class="m-r-10"><i class="fa fa-fw fa-lg fa-envelope"></i> info@gadgetworld.com</span>

                </p>

              </div>

            </div>

          </div>

          <!-- END PANEL BODY -->

      </div>  

        </div>

      </div>

    </div>

    <!-- end panel-body -->

  </div>

  <!-- end panel --> 

<script type="text/javascript">

// document.getElementById('till').addEventListener('click', till);

// document.getElementById('paybill').addEventListener('click', paybill);

  // function till()

  // {

  //   document.getElementById('acc-div').style.display = 'none'; 

  //   $("#mpesa-account").val('');

  // } 



  // function paybill()

  // {

  //  document.getElementById('acc-div').style.display = 'block'; 

  // } 



document.getElementById('logono').addEventListener('click', logono);

document.getElementById('logoyes').addEventListener('click', logoyes);

  function logono()

  {

    document.getElementById('logo-div').style.display = 'none';  

  } 



  function logoyes()

  {

   document.getElementById('logo-div').style.display = 'block'; 

  }



document.getElementById('pinno').addEventListener('click', pinno);

document.getElementById('pinyes').addEventListener('click', pinyes);

  function pinno()

  {

    document.getElementById('pin-div').style.display = 'none';

     $("#kra-pin").val('');  

  } 



  function pinyes()

  {

   document.getElementById('pin-div').style.display = 'block'; 

  }





  document.getElementById('btn-thermal').addEventListener('click', thermal);

  function thermal()

  {

    var form = $("#myform");



    // you can't pass Jquery form it has to be javascript form object

    var formData = new FormData(form[0]);



    //if you only need to upload files then 

    //Grab the File upload control and append each file manually to FormData

    //var files = form.find("#fileupload")[0].files;



    //$.each(files, function() {

    //  var file = $(this);

    //  formData.append(file[0].name, file[0]);

    //});



   // if ($(form).valid()) {

    console.log(formData);

        $.ajax({

            type: "POST",

            url: 'back/settings/thermal_act.php',

            //dataType: 'json', //not sure but works for me without this

            data: formData,

            contentType: false, //this is requireded please see answers above

            processData: false, //this is requireded please see answers above

            //cache: false, //not sure but works for me without this

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

   // }











   //var data = $('#myform').serialize();

  // var form = $('#myform')[0];

  // var formData = new FormData(form);

  

  //   $.ajax(

  //       {

  //           url: 'back/settings/thermal_act.php',

  //           type: 'POST',                           

  //           data: formData,

  //           processData: false,

  //           contentType: false,

  //           dataType: 'html'

  //       })

  //       .done(function(data)

  //        {

  //           $('#results').html(''); // blank before load.

  //           $('#results').html(data);



  //       })

  //       .fail(function()

  //       {

  //           $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');

            

  //       });

  }

</script>