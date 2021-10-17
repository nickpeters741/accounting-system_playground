<?php
include('../inc/connection.php');  
include('../inc/gen_funcs.php');
$table=$_GET['table'];
$column=$_GET['column'];
$filter=$_GET['filter'];
$fcolumn=$_GET['fcolumn'];
$cat_name= get_column($table,$column,"$fcolumn='$filter'");
echo $cat_name;

?>