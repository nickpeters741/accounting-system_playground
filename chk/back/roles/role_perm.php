<?php
include("../../inc/connection.php");
// if(isset($_REQUEST['id']))
// {
   // $id = $_REQUEST['id'];
    $get_details = mysqli_query($connection,"SELECT * FROM users") or die("Could not get the customer details");
    $row = mysqli_fetch_assoc($get_details);
    $perm=$row['menu_id'];
     
    function  perm($perm,$menu)
    {  
		$arr = explode(',',$perm); 
		foreach($arr as $i) {
		$i; 
		if ($i==$menu) {
		 	echo "checked";
		 } else{

		 }
    	}
    }
// //}
?>
<!-- <div class="modal-content" onload="btn();">
	<div class="modal-header"> 
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp; SET <?php echo strtoupper($row['name']); ?> PERMISSIONS
		</h4> 
	</div>
	<div class="modal-body"> -->
		<div id="results"></div>
		<div class="row"> 
			<input type="hidden" name="id" value="<?php echo $id; ?>">
			<?php
			$get_menu = mysqli_query($connection,"SELECT * FROM menu WHERE level=1 AND parent=0") or die("Could not get the menus");
			while ($mat = mysqli_fetch_assoc($get_menu)) {
				$name=$mat['name'];
				$menu_id=$mat['menu_id']; 	
			?>
			<div class="col-md-4"> 
			<!-- START LEVEL 1 --> 
			<div class="checkbox checkbox-css">
				<input type="checkbox" id="<?php  echo $menu_id; ?>" name="menu[]" onclick="uncheckChildren('<?php echo $menu_id ?>',this)"  class="check" value="<?php  echo $menu_id; ?>" <?php perm($perm,$menu_id) ?> />
				<label for="<?php  echo $menu_id; ?>" style="font-weight: bold; font-size: 12px;"> <?php  echo $name; ?></label>
			</div>
			<ul class="sub-menu">
				<?php
				$get_sec = mysqli_query($connection,"SELECT * FROM menu WHERE parent='$menu_id'");
				while ($sat = mysqli_fetch_assoc($get_sec)) {
					$sname=$sat['name'];
					$smenu_id=$sat['menu_id']; 
				?>  
				<div class="checkbox checkbox-css">
					<input type="checkbox" id="<?php  echo $smenu_id; ?>"  onclick="checkParent('<?php echo $menu_id ?>',this)" name="menu[]" value="<?php  echo $smenu_id; ?>" class="<?php  echo $menu_id; ?>" <?php perm($perm,$smenu_id) ?>/>
					<label for="<?php  echo $smenu_id; ?>"><?php  echo $sname; ?></label>
				</div>
				<?php 
                    $get_third = mysqli_query($connection,"SELECT * FROM menu WHERE parent='$smenu_id'");
                    while ($tat = mysqli_fetch_assoc($get_third)) {
                    	$tname=$tat['name'];
                    	$tmenu_id=$tat['menu_id']; 
                ?>  
                <div class="checkbox checkbox-css">
                	<input type="checkbox" id="<?php  echo $tmenu_id; ?>"   onclick="checkParent('<?php echo $menu_id ?>',this)"  name="menu[]" value="<?php  echo $tmenu_id; ?>" class="<?php  echo $menu_id; ?>" <?php perm($perm,$tmenu_id) ?>/>
                	<label for="<?php  echo $tmenu_id; ?>"><?php  echo $tname; ?></label>
                </div>
                <?php 
                $get_last = mysqli_query($connection,"SELECT * FROM menu WHERE parent='$tmenu_id'");
                while ($lat = mysqli_fetch_assoc($get_last)) {
                	$lname=$lat['name'];
                	$lmenu_id=$lat['menu_id']; 
               	?>
               	<div class="checkbox checkbox-css">
               		<input type="checkbox" id="<?php  echo $lmenu_id; ?>"   onclick="checkParent('<?php echo $menu_id ?>',this)"  name="menu[]" value="<?php  echo $lmenu_id; ?>"  class="<?php  echo $menu_id; ?>" <?php perm($perm,$lmenu_id) ?>/>
               		<label for="<?php  echo $lmenu_id; ?>"><?php echo $lname; ?></label>
               	</div>  
               	<?php
                  }
              }
          }
          ?> 
		    </ul>
		    </div>
		    <?php
		  		}
		  	?>
		  	<input type="submit" name="submit"  class="form-control btn btn-lime" id="save" disabled="true"> 
	  	</form> 				
			</div>
			<div class="col-md-6">
				<!-- <fieldset>
					<legend>Personalia:</legend>
					<div class="checkbox checkbox-css">
						<input type="checkbox" id="<?php  echo $tmenu_id; ?>"   onclick="checkParent('<?php echo $menu_id ?>',this)"  name="menu[]" value="<?php  echo $tmenu_id; ?>" class="<?php  echo $menu_id; ?>" <?php perm($perm,$tmenu_id) ?>/>
						<label for="<?php  echo $tmenu_id; ?>">Create</label>
					</div>
					<div class="checkbox checkbox-css">
						<input type="checkbox" id="<?php  echo $tmenu_id; ?>"   onclick="checkParent('<?php echo $menu_id ?>',this)"  name="menu[]" value="<?php  echo $tmenu_id; ?>" class="<?php  echo $menu_id; ?>" <?php perm($perm,$tmenu_id) ?>/>
						<label for="<?php  echo $tmenu_id; ?>">Edit</label>
					</div>
	                <div class="checkbox checkbox-css">
	                	<input type="checkbox" id="<?php  echo $tmenu_id; ?>"   onclick="checkParent('<?php echo $menu_id ?>',this)"  name="menu[]" value="<?php  echo $tmenu_id; ?>" class="<?php  echo $menu_id; ?>" <?php perm($perm,$tmenu_id) ?>/>
	                	<label for="<?php  echo $tmenu_id; ?>">Delete</label>
	                </div>
				</fieldset> -->
			</div>
			
		</div>
	<!-- 	
	  </div>
	</div> -->
<script type="text/javascript">
	function btn(){
		var checked_box = $('input[name="menu[]"]:checked').length;
		if (checked_box<1) {
			 document.getElementById("save").disabled = true;
		} else {
			document.getElementById("save").disabled = false;
		} 
	}
	function checkParent(id,ele) {
		var parent = document.getElementById(id);
		parent.checked = true;
		var children = document.getElementsByClassName(id);
		var checked_boxes = $('input.'+id+':checked').length;
		
		if (checked_boxes<1) {
			parent.checked = false;
		} 
		btn();
	}

	function uncheckChildren (id,ele) {
		var children = document.getElementsByClassName(id);	
		
		if (ele.checked==true) {
			$(children).prop("checked", true);
		} else {
			$(children).prop("checked", false);
		}
		btn();
	}
</script>
 