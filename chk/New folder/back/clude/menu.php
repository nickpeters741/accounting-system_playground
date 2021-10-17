<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar sidebar-transparent sidebar-grid">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				 
				<!-- begin sidebar nav -->
				<ul class="nav">
					<li class="nav-header">NAVIGATION</li>
					<?php
					include('../clude/a_menu.php');
					?>  
					 
					 
					<li class="has-sub">
						<a href="javascript:;">
					        <b class="caret"></b>
						    <i class="fa fa-cogs"></i>
						    <span>SETTINGS</span> 
						</a>
						<ul class="sub-menu">
							<li><a href="../settings/settings.php">General Details</a></li> 
							<li class="has-sub"><a href="javascript:;"><b class="caret"></b>System Menus</a>
								<ul class="sub-menu">
									<li><a href="../sys_menu/menu.php?pnl=1">Back Menus</a></li> 
									<li><a href="../sys_menu/menu.php?pnl=2">Front Menu</a></li>
								</ul>
							</li>
						</ul>
					</li>
					 
			        <!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
			        <!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<!-- end #sidebar -->
<div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
	<div class="modal-dialog"  id="load"></div>
</div>
<div  id="modal2" class="modal fade bs-example-modal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
	<div class="modal-dialog"  id="load2"></div>
</div> 

<script type="text/javascript">
	//$( document ).ready(function() {
	  // Handler for .ready() called.
    //$(document).on('click','#store-stock', function(e){
    function store(st){
      $('#modal-load').html(''); // leave this diff blank 
      $.ajax({
        url: '../../gen/store_stock.php',
        typr: 'POST',
        data: 'st='+st,
        dataType: 'html'
      })
      .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data);
      })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
  }

  function po(){
  	$('#modal-load').html(''); // leave this diff blank 
      $.ajax({
        url: '../kugura/po_modal.php',
        typr: 'POST',
        data: '',
        dataType: 'html'
      })
      .done(function(data){
        $('#load').html(''); // blank before load.
        $('#load').html(data);
      })
      .fail(function(){
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
        $('#modal-loader').hide();
      });
  } 
   // });
//});
</script>