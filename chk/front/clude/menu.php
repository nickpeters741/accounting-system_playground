<?php
// if ($_SESSION['panel']==1) {
//   header("Location:../../log_out.php");
// }
?> 
<!-- begin #sidebar -->
<div id="sidebar" class="sidebar sidebar-transparent">
	<!-- begin sidebar scrollbar -->
	<div data-scrollbar="true" data-height="100%">
		
		<?php
		require_once('amenu.php');
		?>
	</div>
	<!-- end sidebar scrollbar -->
</div>
		 
		<!-- end #sidebar -->
 <div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load" style="padding: 10px;"> </div>
</div>
<div  id="modal2" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load2" style="padding: 10px;"> </div>
</div>
<script type="text/javascript">
	function zreport(){ 
		$('#modal').modal('show'); 
		$('#load').html('');  
		$.ajax({
			url: '../gen/zmodal.php',
			typr: 'POST',
			data: '',
			dataType: 'html'
		})
		.done(function(data){ 
			$('#load').html('');
			$('#load').html(data);
		})
		.fail(function(){
			$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
		}); 
	}
</script>