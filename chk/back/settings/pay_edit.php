<?php
include("../../inc/connection.php");
if(isset($_REQUEST['id'])){
  $id = $_REQUEST['id'];
  $get_item_details = mysqli_query($connection,"SELECT * FROM kp_pay_mode WHERE pay_id='$id'") or die("Could not get the product details");
  $row = mysqli_fetch_assoc($get_item_details);
  $pay_id = $row['pay_id'];
  $bank_id = $row['bank_id'];
  $btn_color = $row['btn_color'];
  $item_id = $row['item_id'];
  $name=$row['name'];

         
    }
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; Edit <?php echo $row['name']; ?> Details</h4> 
   		</div>
   		<div class="modal-body">
   			<div id="results2"></div>
   			 <div class="form-group col-md-8 ">
                    <label>Payment Name</label>
                    <input type="text" class="form-control" name="name" id="name2" value="<?php echo $name;?>" />
                </div> 
                <div class="form-group col-md-8 col-sm-12">
                    <label >Bank to Affect</label>
                    <select class="form-control" id="bank2" name="bank" onchange=""> 
            <option  value="">--------SELECT BANK-------</option>     <?php
          $bank = "SELECT * FROM kp_banks WHERE  del_status=2";
          $bank_r = mysqli_query($connection,$bank) or die("Error getting categories");
          while ($ct = mysqli_fetch_assoc($bank_r)) {
              $name = $ct['acc_name']; 
              ?>
              <option  value="<?php echo $ct['bank_id']; ?>" <?php if ($bank_id==$ct['bank_id']){echo "selected";} ?>
                 ><?php echo $name; ?></option>
              <?php
          }
          ?>
          </select>
                  </div>
                   <div class="form-group col-md-8">
                    <div class="row" style="margin: 0 0px;">
                        <label class="col-md-8" >Select Payment Color</label>
                        <input id="color2"  class="form-control col-md-9" value="<?php echo $btn_color; ?>">
                        <div class="form-group-prepend col-md-3" style="margin: 0 -15px;">
                           <a class="btn btn-warning" data-toggle="dropdown">Color</a>
                          <ul class="dropdown-menu">
                            <li><div id="colorpalette12"></div></li>
                          </ul>   
                        </div>
                    </div>
    </div>
					 <div class="form-group row col-md-12" >
                                <label class="col-md-8" >Payment has Code/No./Ref #</label>
                                <div class="col-md-6" >
                                    <div class="radio radio-css radio-inline">
                                        <input type="radio" name="has-ref2" id="yes-md" value="1" <?php if ($row['has_ref']==1) { echo "checked"; } ?>/>
                                        <label for="yes-md">Yes</label>
                                    </div>
                                    <div class="radio radio-css radio-inline">
                                        <input type="radio" name="has-ref2" id="no-md" value="2" <?php if ($row['has_ref']==2) { echo "checked"; } ?>/>
                                        <label for="no-md">No</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row col-md-12" >
                                <label class="col-md-8" >Payment has Change</label>
                                <div class="col-md-6" >
                                    <div class="radio radio-css radio-inline">
                                        <input type="radio" name="has-change2" id="yes-change" value="1" <?php if ($row['has_change']==1) { echo "checked"; } ?>/>
                                        <label for="yes-change">Yes</label>
                                    </div>
                                    <div class="radio radio-css radio-inline">
                                        <input type="radio" name="has-change2" id="no-change" value="2" <?php if ($row['has_change']==2) { echo "checked"; } ?>/>
                                        <label for="no-change">No</label>
                                    </div>
                                </div>
                            </div>
      </div>
							<div class="modal-footer">
								<a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
								<button type="button"  id="edit-pay" class="btn btn-success">Save</button>
							</div> 
   	</div> 
 <script> 
  $('#colorpalette12').colorPalette().on('selectColor', function(e) {
         
        $('#color2').val(e.color);
      });
document.getElementById('edit-pay').addEventListener('click', edit_pay);

function edit_pay(){
    var name = $("#name2").val();
    var color = $("#color2").val(); 
    var bank = $("#bank2").val(); 
    var id = '<?php echo $pay_id; ?>'; 
    var has_ref2 = $("input[name='has-ref2']:checked").val();  
     var has_change2 = $("input[name='has-change2']:checked").val();  
    $.ajax({
        url: 'pay_edit_act.php',
        typr: 'POST',                           
        data: { name:name, color:color, bank:bank,id:id, has_ref2:has_ref2,has_change2:has_change2},
        dataType: 'html'
    })
    .done(function(data){
        $('#results').html(''); // blank before load.
        $('#results').html(data);
         $('#pay-modal').modal('toggle');
        load_item_list();
    })
    .fail(function(){
        $('#results').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><strong>Warning!</strong> Error occured.</div>');
    });
  }
  
</script>
					


		<!--modal add-->
		

    
