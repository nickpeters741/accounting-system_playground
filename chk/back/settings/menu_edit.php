 <?php

include("../../inc/connection.php");
 if(isset($_REQUEST['id']))
    {
        $id = $_REQUEST['id'];
        $get_priv_details = mysqli_query($connection,"SELECT * FROM menu WHERE menu_id='$id'") or die("Could not get the role details");
        $row = mysqli_fetch_assoc($get_priv_details);
    }
?>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">EDIT <?php echo strtoupper($row['name']); ?> </h4>
    </div>
    <div class="modal-body">
        <div id="results"></div>
        <form role="form" action="role_edit_action.php" role="form"  method="post" style="">
            <fieldset>
                <div class="form-group row m-b-15">
                        <label class="col-md-4 col-sm-4 col-form-label">Menu  Level:</label>
                        <div class="col-md-8 col-sm-8">
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="level" value="1" <?php if ($row['level']=1) { echo "checked"; } ?> id="level1" data-parsley-required="true" />
                                <label class="form-check-label" >Level 1</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="level" value="2"  <?php if ($row['level']=2) { echo "checked"; } ?>  id="level2" data-parsley-required="true" />
                                <label class="form-check-label" >Level 1.1</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="level" id="level3" value="3"  <?php if ($row['level']=3) { echo "checked"; } ?>  />
                                <label class="form-check-label">Level 2.1</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="level" id="level4" value="4"  <?php if ($row['level']=4) { echo "checked"; } ?>  />
                                <label class="form-check-label">Level 3.1</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-md-4 col-sm-4 col-form-label">Has Sub:</label>
                        <div class="col-md-8 col-sm-8">
                            <div class="form-check" id="sub-yes">
                                <input type="radio" class="form-check-input" name="hsub" value="1" id="has-sub" data-parsley-required="true"  <?php if ($row['sub']=1) { echo "checked"; } ?>  />
                                <label class="form-check-label">Yes</label>
                            </div>
                            <div class="form-check" id="sub-no">
                                <input type="radio" class="form-check-input" name="hsub" id="has-sub2" value="2"  <?php if ($row['sub']=2) { echo "checked"; } ?> />
                                <label class="form-check-label">No</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row m-b-15">
                        <label class="col-md-4 col-sm-4 col-form-label">Menu Name* :</label>
                        <div class="col-md-8 col-sm-8">
                            <input class="form-control" type="text" id="name" name="name" value="<?php echo $row['name']; ?>" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15" id="link-div">
                        <label class="col-md-4 col-sm-4 col-form-label">Menu Link* :</label>
                        <div class="col-md-8 col-sm-8">
                            <input class="form-control" type="text" id="link" name="link" value="<?php echo $row['link']; ?>" />
                        </div>
                    </div>
                    <div class="form-group row m-b-15" id="parent-div">
                        <label class="col-md-4 col-sm-4 col-form-label">Parent :</label>
                        <div class="col-md-8 col-sm-8">
                            <select class="form-control" id="parent" name="parent" >
                                <option  value="0">---SELECT MENU LEVEL-----</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row m-b-15" id="icon-div">
                        <label class="col-md-4 col-sm-4 col-form-label">Menu Icon* :</label>
                        <div class="col-md-8 col-sm-8">
                            <input class="form-control" type="text" id="icon" name="icon" value="<?php echo $row['icon']; ?>" /><i class="<?php echo $row['icon']; ?>"></i>
                        </div>
                    </div>
                 
                </div>
            </fieldset>
            <div class="modal-footer">
                <a href="javascript:;" class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
                <button type="submit" name="role-edit" class="btn btn-success">Save</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
<?php include("settings.js");?>
$(document).ready(function() {
    $("#level2").change(function(event){
        var selected = $('#level1').val();  
        $('#parent').empty();
        $.ajax({
            type: "GET",
            url: 'get_parent.php', 
            data: { id: selected },
            success:  function(data) {
                $('#parent').append(data);
            }
        });
    });
    $("#level3").change(function(event){
        var selected = $('#level2').val(); 
        $('#parent').empty();
        $.ajax({
            type: "GET",
            url: 'get_parent.php', 
            data: { id: selected },
            success:  function(data) { 
                $('#parent').append(data);
            }
        });
    });
}); 
$(function () {
    $("#level1").click(function () {
        if ($(this).is(":checked")) {
            $("#sub-no").show(); 
            $("#has-sub").click();
            $("#has-sub").show();
            $("#link-div").hide(); 
            $("#link").val('#');
            $("#icon-div").show(); 
            $("#parent-div").hide(); 
            $("#parent").val(0);  

        } 
    });
    $("#level2").click(function () {
        if ($(this).is(":checked")) { 
            $("#sub-yes").show();
            $("#has-sub").click();
            $("#sub-no").show();
             $("#icon").val('-'); 
            $("#icon-div").hide();
            $("#link-div").show();
            $("#link").val('');
            $("#parent-div").show();

        } 
    });
    $("#level3").click(function () {
        if ($(this).is(":checked")) { 
            $("#sub-no").show();
             $("#has-sub2").click();
             $("#sub-yes").hide();
             $("#icon").val('-'); 
             $("#icon-div").hide();
             $("#link-div").show();
             $("#link").val('');
             $("#parent-div").show();

        } 
    });
    $("#level4").click(function () {
        if ($(this).is(":checked")) { 
            $("#sub-no").show();
             $("#has-sub2").click();
             $("#sub-yes").hide(); 
             $("#icon").val('-');
             $("#icon-div").hide();
             $("#link-div").show();
             $("#link").val('');
             $("#parent-div").show();

        } 
    });
    $("#has-sub").click(function () {
        if ($(this).is(":checked")) {  
            $("#link-div").hide();
            $("#link").val('#');

        } 
    });
    $("#has-sub2").click(function () {
        if ($(this).is(":checked")) {  
            $("#link-div").show();
            $("#link").val('');

        } 
    });
}); 
</script>		
