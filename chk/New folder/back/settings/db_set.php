<?php 
 include("../../inc/connection.php");
 include("funcs.php"); 
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
                        <legend class="m-b-15">DB BACK UP SETTINGS</legend>
                        <div class="form-group row">
                            <div class="form-group col-md-12">
                                <label class="col-md-4"  style="color:blue;">Auto Back Up</label>
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
        <button type="submit" id="create_back" onclick="thermal();" class="btn btn-warning">Create Back Up</button>
        <button type="submit" id="create_back" onclick=";" class="btn btn-warning">Submit</button>
    </div>
	<!-- END PANEL FOOTER -->
</div>
<!-- end panel --> 
<script type="text/javascript">
     function thermal(){ 
         $.ajax({
            url: '../settings/dbback.php',
            typr: 'POST', 
            data: '',
            dataType: 'html'
        })
        .done(function(data){ 
             var hulla = new hullabaloo();
            hulla.send("Back Up Created Successfully!!!!", "success"); 
        })
        .fail(function() { 
            var hulla = new hullabaloo();
            hulla.send("Could not create Back Up!!!!", "danger"); 
        });
    }
 
</script>