<?php

session_start();
include('../../inc/connection.php');
	$day=$_REQUEST['day']; 
	$num=0;
?>
<div class="modal-content">
        <div class="modal-header"> 
          <h4 class="modal-title" id="upload-avatar-title">CONFIRM PRINTING Z REPORT FOR <?PHP echo $day; ?> </h4>
        </div> 
        <?php
		 $get_order = mysqli_query($connection,"SELECT * FROM kp_sale_status ");
		 $held=mysqli_num_rows($get_order);

		$num=$held;
		if ($num>0) {
		 	?>
		 	<div class="modal-body">

		 	</div>
		 	<?php
		 }else{
		 ?>	
        <form action="../print/zreport.php" id="zform" method="POST" data-parsley-validate="true">
        	<div class="modal-body">
        		<div class="" id="cust_results"></div>
        	</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-danger btn-xs">NO</a>
				<a  id="zsubmit" class="btn btn-sm btn-success btn-xs">YES</a>
			</div> 
		</form>
            		 <?php
            		 }
            		 ?>
      </div> 
<script type="text/javascript">
	$(document).on('click','#zsubmit', function(e){ 
		myWindow =window.open('../print/zreport_therm.php?day='+'<?php echo $day; ?>', '', 'height=600, width=650');  
        //myWindow.print();
	});
</script>