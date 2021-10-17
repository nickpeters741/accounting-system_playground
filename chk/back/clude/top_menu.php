<!-- begin #top-menu -->
		<div id="top-menu" class="top-menu">
            <!-- begin top-menu nav -->
			<ul class="nav"> 
				<?php
					include('../clude/a_menu.php');
					?> 
                <li class="menu-control menu-control-left">
                    <a href="javascript:;" data-click="prev-menu"><i class="fa fa-angle-left"></i></a>
                </li>
                <li class="menu-control menu-control-right">
                    <a href="javascript:;" data-click="next-menu"><i class="fa fa-angle-right"></i></a>
                </li>
            </ul>
            <!-- end top-menu nav -->
		</div>
		<!-- end #top-menu -->
        <div  id="modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
            <div class="modal-dialog"  id="load"></div>
        </div>
        <div  id="modal2" class="modal fade bs-example-modal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
            <div class="modal-dialog"  id="load2"></div>
        </div> 