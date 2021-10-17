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

    #receipt{

        padding:1mm;

        margin: 0 auto;

        width: 79mm;

        background: #25e25e;

        color: #000;

        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;

    }

    #bord{

        border: 2px solid #000 !important

    }

    table{ 

        padding:1mm;

        margin: 0 auto;

        width: 75mm;

        background: #25e25e;

        border-collapse: collapse;

    }

    td,th{

        font-size: 13px;

        border: 1px solid #000 !important

    }

    th{

        font-size: 13px;

        padding: 2px;

        margin: 2px;

    }

    .text-center {

        text-align:center!important

    }

    .text-left {

        text-align:left!important

    }

    .text-right {

        text-align:right!important

    }

    .pull-left {

        float:left!important

    }

    .pull-right {

        float:right!important

    }

    h1.title{

        font-size: 26px;

        margin-bottom: 0px; 

    }

    p{

  font-size: 13px;

}

span{

  font-size: 13px; 

}

@media print {

    p.break {

      page-break-after: always;

    }

    body{

      margin: 2mm;

    }

#receipt{ 

  padding:1mm;

  margin: 0 auto;

  width: 79mm;

  background: #25e25e;

  #border{

  border: 2px solid #000 !important

 }

}

#bord{

    border: 2px solid #000 !important

 }

 table{ 

  padding:1mm;

  margin: 0 auto;

  width: 75mm;

  background: #25e25e;

   border-collapse: collapse;

}

td,th{

  font-size: 13px;

  border: 1.5px solid #000 !important

}

th{

  font-size: 13px;

  padding: 2px;

  margin: 2px;

}

 

span{

  font-size: 13px;

  padding: 5px;

}



}

</style> 

<!-- begin panel -->

<div class="panel panel-inverse" data-sortable-id="form-validation-2"> 

  <!-- begin panel-body -->

  <div class="panel-body ">

    <div class="row">

      <div class="col-md-7"> 

        <form method="post" action="" enctype="multipart/form-data" id="myform">

          <div class="form-group row">

            <div class="form-group col-md-12">

              <label class="col-md-6"  style="color:blue;">Show Logo</label>

              <div class="col-md-6">

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

          <div class="form-group row">

            <div class="form-group col-md-12">

              <label class="col-md-4"  style="color:blue;">Show PIN</label>

              <div class="col-md-6">

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

            <br>

            <div class="form-group col-md-12">

              <label class="col-md-6"  style="color:blue;">Show Tax Calculations</label>

              <div class="col-md-6">

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

          </div>

          <br>

          <div class="form-group col-md-12">

            <label class="col-form-label">Thankyou Section:</label> 

            <textarea class="form-control pull-left" id="thank" name="thank"><?php echo $row['thankyou_note']; ?> </textarea>  

          </div> 

          <div  class="form-group col-md-12">

            <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>

            <button type="button" name="btn-thermal" id="btn-thermal" class="btn btn-sm btn-success">Save</button>

          </div> 

        </form>

      </div>    

     

           

    <div class="col-md-5">

      <div id="receipt">

        <div id="results"></div>

        <div id="bord">

          <div id="receipt-header" class="text-center">

            <?php if ($row['show_logo']==1 ){ ?>

            <img src="<?php echo $gen['image_path']; ?>" style="height: 60px; margin-left: 30px; margin-top: 20px;" /></br>

            <?php } ?>

            <h1 class="title"><?php echo strtoupper($gen['company_name']); ?></h1>

            <p style="font-size: 18px;margin: 0px 0px 0px 0px;">(<?php echo $gen['company_tag']; ?>)</p>          

            <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

            <p style="margin: 0px 0px 0px 0px; "><?php echo $gen['address']; ?>,<BR> Cell: <?php echo $gen['phone1']; ?> | <?php echo $gen['phone2']; ?><BR></P>

            <?php if ($row['pin']==1 ){ ?>

             <span class="pull-left">PIN: <?php echo $gen['kra_pin']; ?></span> 

           <?php }?>

            <span class="pull-right"><b>Order No: 1000</b></span><p style="margin: 0px 0px 0px 0px;">.</p>

            <span class="pull-left"> Served By: </strong>staff_name</span>

            <span class="pull-right"><b><?php echo $today; ?></b></span> 

            <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

          </div>

          <div id="receipt-body">

            <table>

              <tfoot> 

                <tr>

                  <!--  <th colspan="4" class="text-center"><B style=" font-size: 22px;">Total: 2000</B></th> -->

                  <td colspan="4" class="text-center"><B style=" font-size: 22px;"><b>Total: <?php  echo number_format(2000,2); ?></b></td>  

                  </tr>

                </tfoot>

                <tbody>

                  <tr>

                    <td>ITEM 1</td>

                    <td colspan="2">10 x 100</td>

                    <td>1000</td>

                  </tr>

                  <tr>

                    <td>ITEM 1</td>

                    <td colspan="2">10 x 100</td>

                    <td>1000</td>

                  </tr>

                </tbody>

              </table>

            </div>

            <div id="receipt-footer">

              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

             <?php if ($row['tax']==1 ){ ?>

              <span class="pull-left">Gross:1000</span>

              <span class="pull-right">Cat Levy(2%): 20</span> 

               <p style="margin: 0px 0px 0px 0px;">.</p>

              <span class="pull-left">V.A.T(16%): 160</span>

              <span class="pull-right">Cat Levy(2%): 20</span> 

              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

            <?php } ?>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"><b>THANK YOU</b></p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"><?php echo $row['thankyou_note'];?></p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"> This is not an ETR.</p>

              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

              <h2 class="text-center" style="margin: 0px 0px 0px 0px;font-size: 20px;font-weight: bold; font-family: 'Helvetica LT W01 Black Cond';letter-spacing: 3px;"><?php if ($row['mpesa']==2 ){ echo "PAYBILL". " ".$gen['mpesa_no']. " ACCOUNT:". $gen['mpesa_account']; } else{echo "TILL". " ".$gen['mpesa_no']; }?> </h2>

              <p style="margin: 0px 0px 0px 0px;">*********************************************************</p>

              <p class="text-center" style="margin: 0px 0px 0px 0px;"> K-Touch Point of Sale Designed & Sold by K-SYSTEMS </BR> +254716100335 | +254735100335.</p> 

            </div> 

          </div>

        </div>

      </div>

    </div>

    <!-- end panel-body -->

  </div>

  <!-- end panel --> 

<script type="text/javascript">

document.getElementById('btn-thermal').addEventListener('click', thermal);

  function thermal()

  {

    var form = $("#myform"); 

    var formData = new FormData(form[0]);

        $.ajax({

            type: "POST",

            url: '../settings/thermal_act.php',

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