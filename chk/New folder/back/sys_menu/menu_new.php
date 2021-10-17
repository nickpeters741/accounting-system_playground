<?php
$pnl = $_REQUEST['pnl'];
?>
<div class="modal-content">
	<div class="modal-header">
		<h4 class="modal-title">CREATE NEW MENU</h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	</div>
	<form action="menu_action.php" method="POST" data-parsley-validate="true"> 
		<div class="modal-body">
			<div class="form-group row m-b-15">
				<label class="col-md-4 col-sm-4 col-form-label">Menu  Level:</label>
				<div class="col-md-8 col-sm-8">
					<div class="form-check">
						<input type="radio" class="form-check-input" name="level" value="1" id="level1" data-parsley-required="true" />
						<label class="form-check-label" >Level 1</label>
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" name="level" value="2" id="level2" data-parsley-required="true" />
						<label class="form-check-label" >Level 1.1</label>
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" name="level" id="level3" value="3" />
						<label class="form-check-label">Level 2.1</label>
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" name="level" id="level4" value="4" />
						<label class="form-check-label">Level 3.1</label>
					</div>
				</div>
			</div>
			<div class="form-group row m-b-15">
				<label class="col-md-4 col-sm-4 col-form-label">Has Sub:</label>
				<div class="col-md-8 col-sm-8">
					<div class="form-check" id="sub-yes">
						<input type="radio" class="form-check-input" name="hsub" value="1" id="has-sub" data-parsley-required="true" />
						<label class="form-check-label">Yes</label>
					</div>
					<div class="form-check" id="sub-no">
						<input type="radio" class="form-check-input" name="hsub" id="has-sub2" value="2" />
						<label class="form-check-label">No</label>
					</div>
				</div>
			</div>
			<div class="form-group row m-b-15">
				<label class="col-md-4 col-sm-4 col-form-label">Loads Modal:</label>
				<div class="col-md-8 col-sm-8">
					<div class="form-check" id="modal-yes">
						<input type="radio" class="form-check-input" name="modalr" value="1" id="modal1" data-parsley-required="true" />
						<label class="form-check-label">Yes</label>
					</div>
					<div class="form-check" id="modal-no">
						<input type="radio" class="form-check-input" name="modalr" id="modal2" value="2" />
						<label class="form-check-label">No</label>
					</div>
				</div>
			</div>
			<div class="form-group row m-b-15" id="modal-div" style="display: none;">
				<label class="col-md-4 col-sm-4 col-form-label">Modal Function* :</label>
				<div class="col-md-8 col-sm-8">
					<input class="form-control" type="text" id="modal-func" name="modal-func"  placeholder="Enter Function to load modal..."  data-parsley-required="true" />
				</div>
			</div>
			<div class="form-group row m-b-15">
				<label class="col-md-4 col-sm-4 col-form-label">Menu Name* :</label>
				<div class="col-md-8 col-sm-8">
					<input class="form-control" type="text" id="name" name="name"  placeholder="Enter Menu Name..."  data-parsley-required="true" />
				</div>
			</div>
			<div class="form-group row m-b-15" id="link-div">
				<label class="col-md-4 col-sm-4 col-form-label">Menu Link* :</label>
				<div class="col-md-8 col-sm-8">
					<input class="form-control" type="text" id="link" name="link"  placeholder="Enter Menu Link..."  data-parsley-required="true" />
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
					<input class="form-control" type="text" id="icon" name="icon"  placeholder="Enter Menu icon name..." />
					<input class="form-control" type="text" id="panel" name="panel"  value="<?php echo $pnl; ?>" />
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
			<button type="submit" class="btn btn-success">Save Menu</button>
		</div>
	</form>
</div>

<script type="text/javascript">
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
	$("#level4").change(function(event){
	    var selected = $('#level3').val(); 
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
        	$("#sub-yes").show(); 
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
            $("#sub-yes").show();
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
             $("#has-sub").click();
             $("#sub-yes").show();

             //$("#sub-yes").hide();
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
    $("#modal1").click(function () {
        if ($(this).is(":checked")) {  
            $("#modal-div").show();
            $("#modal-func").val('');

        } 
    });

    $("#modal2").click(function () {
        if ($(this).is(":checked")) {  
            $("#modal-div").hide();
            $("#modal-func").val('');

        } 
    });
}); 
</script>