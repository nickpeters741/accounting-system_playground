
<!-- begin panel -->
    <div class="panel">
    	<!-- begin panel-body -->
        <div class="panel-body row">
        	<div id="results"></div>
        	<div class="col-sm-7 col-md-7">
        		<div class="form-group" id="link-div">
        			<label class="col-form-label">Percentage(%) :</label> 
					<input class="form-control" type="text" id="perc" name="perc"/>
					<p style="color: red;">* Percentage should be in Decimal i.e. 10% is 0.1</p>  
				</div>  
			</div>
			<div class="col-sm-7 col-md-7">
        		<div class="form-group" id="link-div">
        			<label class="col-form-label">Minimum Points:</label> 
					<input class="form-control" type="text" id="min" name="min"/>
				</div>  
			</div>  
		</div>
	<!-- end panel-body -->
	<!-- START PANEL FOOTER -->
		<div class="panel-footer">
			<a href="javascript:;" class="btn btn-danger" data-dismiss="modal">Close</a>
			<button type="submit" id="point-submit" class="btn btn-success">Submit</button>
		</div>
	<!-- END PANEL FOOTER -->
	</div>
<!-- end panel -->
 <script type="text/javascript">
document.getElementById('point-submit').addEventListener('click', general);
  function general()
  {
    $('#point-submit').text('');
    $('#point-submit').append('<span> Refres... </span>');
    $('#point-submit').attr('disabled',true);
    var perc = $("#perc").val();
    var min = $("#min").val(); 
    $.ajax(
        {
            url: 'point_set_act.php',
            typr: 'POST',                           
            data: 'perc='+perc+'&min='+min,
            dataType: 'html'
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