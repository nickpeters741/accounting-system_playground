<?php
$get_menu = mysqli_query($connection,"SELECT * FROM kp_menu WHERE level=1 AND parent=0") or die("Could not get the menus".mysqli_error($connection));
while ($mat = mysqli_fetch_assoc($get_menu)) {
	$name=$mat['name'];
	$menu_id=$mat['menu_id'];
	$link=$mat['link'];
	$icon=$mat['icon'];
	$sub=$mat['sub'];
	if ($sub==1) {
		$class="has-sub";
		$caret='<b class="caret"></b>';
	}else{
		$class="";
		$caret="";
	}	
       if (menu($menu_id)==1) {
?>
<!-- START LEVEL 1 -->
<li class="<?php echo $class; ?>">
    <a href="<?php echo $link; ?>">
        <?php echo $caret; ?>
        <i class="<?php echo $icon; ?>"></i>
        <span><?php echo $name; ?>  </span> <!---->
    </a>
    <?php 
        if ($sub==1) {
    ?>
    <ul class="sub-menu">
        <?php
            $get_sec = mysqli_query($connection,"SELECT * FROM kp_menu WHERE parent='$menu_id'");
    		while ($sat = mysqli_fetch_assoc($get_sec)) {
                $sname=$sat['name'];
            	$smenu_id=$sat['menu_id'];
            	$slink=$sat['link'];
            	$sicon=$sat['icon'];
            	$ssub=$sat['sub'];
                if ($ssub==1) {
                    $sclass="has-sub";
                    $scaret='<b class="caret"></b>';
                }else{
                    $sclass="";
                    $scaret="";
                }
               if (menu($smenu_id)==1) {
            ?> 
            <!-- START LEVEL 1.1 -->
        <li class="<?php echo $sclass; ?>">
            <a href="<?php echo $slink; ?>">
                <?php echo $scaret; ?>
                <?php echo $sname; ?> </a>
                <?php 
                if ($sub==1) {
                ?>
                <ul class="sub-menu">
                    <?php
                    $get_third = mysqli_query($connection,"SELECT * FROM kp_menu WHERE parent='$smenu_id'");
                    while ($tat = mysqli_fetch_assoc($get_third)) {
                    	$tname=$tat['name'];
                    	$tmenu_id=$tat['menu_id'];
                    	$tlink=$tat['link'];
                    	$ticon=$tat['icon'];
                    	$tsub=$tat['sub'];
                    	if ($tsub==1) {
                    		$tclass="has-sub";
                    		$tcaret='<b class="caret"></b>';
                    	}else{
                    		$tclass="";
                    		$tcaret="";
                    	}
                         if (menu($tmenu_id)==1) {	
                    ?>
                    <!-- START LEVEL 1.1.2 -->
                    <li class="<?php echo $tclass; ?>">
                        <a href="<?php echo $tlink; ?>">
                            <?php echo $tcaret; ?>
                            <?php echo $tname; ?> </a>
                            <ul class="sub-menu">
                                <?php
                                 $get_last = mysqli_query($connection,"SELECT * FROM kp_menu WHERE parent='$tmenu_id'");
                                 while ($lat = mysqli_fetch_assoc($get_last)) {
                                	$lname=$lat['name'];
                                	$lmenu_id=$lat['menu_id'];
                                	$llink=$lat['link'];
                                	$licon=$lat['icon'];
                                	$lsub=$lat['sub'];
                                     if (menu($lmenu_id)==1) {
                                ?>
                                  <!-- START LEVEL 1.1.3 -->
                                <li><a href="<?php echo $llink; ?>"><span><?php echo $lname; ?></span> </a></li> 
                                <?php
                                  }
                                      }
                                ?>
                            </ul>
                        </li>
                        <?php
                            }}
                        ?> 
                    </ul>
                    <?php
                      }
                    ?> 
                </li>
                <?php
                    }}
                ?> 
            </ul>
            <?php
                }
            ?>
        </li>
        <?php
            } }
        ?>