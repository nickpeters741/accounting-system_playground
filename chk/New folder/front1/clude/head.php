<?php
session_start();
include('../../inc/connection.php');
require_once('../clude/funcs.php');

$user_id=$_SESSION['user_id'];
$get_details = mysqli_query($connection,"SELECT * FROM kp_thesion WHERE user_id='$user_id'") or die("Could not get the user permissions");
$row=mysqli_fetch_assoc($get_details); 
$panel= $row['panel'];
page_restrict();
if ($panel==1) {
 header("Location:../../log_out.php");
}
?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>

	<meta charset="utf-8" />
	<title>KPOS</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== --> 
	<link href="../../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
	<link href="../../assets/plugins/bootstrap/4.0.0/css/bootstrap.css" rel="stylesheet" />
  <link href="../../assets/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" /> 
	<link href="../../assets/css/default/style.css" rel="stylesheet" />
	<link href="../../assets/css/default/style-responsive.css" rel="stylesheet" /> 
	<!-- ================== END BASE CSS STYLE ================== --> 
<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="../../assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/Buttons/css/buttons.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/AutoFill/css/autoFill.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/ColReorder/css/colReorder.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/KeyTable/css/keyTable.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/RowReorder/css/rowReorder.bootstrap.min.css" rel="stylesheet" />
	<link href="../../assets/plugins/DataTables/extensions/Select/css/select.bootstrap.min.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	<!-- ================== BEGIN DATATABLE================== --> 
	<link href="../../assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
	<!-- ================== END DATATABLE ================== -->  
	 <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="../../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->
</head>
 