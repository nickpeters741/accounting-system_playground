<?php 
$value=$_GET['value']; 
$item=$_GET['item'];
if ($value==1) {
	echo "<a href='#modal' data-toggle='modal' data-id='$item' id='bulk' style='color:green; font-weight:bold;'>YES(Click to Reset)</a>";;
}elseif ($value=2) {
	echo "<a href='#modal' data-toggle='modal' data-id='$item' id='bulk' style='color:red; font-weight:bold;'>NO(Click to set)</a>";
}else{
	echo "<a href='#modal' data-toggle='modal' data-id='$item' id='bulk' style='color:red; font-weight:bold;'>NO SET(Click to set)</a>";;
} 
?>