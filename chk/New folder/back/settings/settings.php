<?php 
require("../clude/head.php");
$no=0;
 $folder="back/settings/";
  thesion_page($folder);
?>

 

<!-- begin #page-container -->

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">

 

  <?php 

    require("../clude/header.php");

  ?> 

  <!-- begin #sidebar -->

  <?php 

    require("../clude/menu.php");

  ?>

  <!-- end #sidebar -->

<style>

* {box-sizing: border-box}

body {font-family: "Lato", sans-serif;}



/* Style the tab */

.tab 

{

	float: left;

	border: 1px solid #ccc; 

	background-color: #f1f1f1;

	width: 100%;

	height: auto;

}



/* Style the buttons inside the tab */

.tab button {

  display: block;

  background-color: #fff;

  color: black;

  padding: 6px;

  width: 100%;

  border-bottom: 1px solid #ccc;

  outline: none;

  text-align: left;

  cursor: pointer;

  transition: 0.3s;

  font-size: 14px;

}



/* Change background color of buttons on hover */

.tab button:hover {

  background-color: #ddd;

}



/* Create an active/current "tab button" class */

.tab button.active {

  background-color: #ccc;

}



/* Style the tab content 

.tabcontent {

  float: left;

  padding: 0px 12px;

  border: 1px solid #ccc;

  width: 70%;

  border-left: none;

  height: 300px;

}*/

</style>

<!-- begin #content -->

<div id="content" class="content">

  <!-- begin row -->

  <div class="row">

    <!-- begin col-6 -->

    <div class="col-lg-3 col-md-3">

      <!-- begin panel -->

      <div class="panel">

        <!-- begin panel-body -->

        <div class="panel-body ">

          <h3><i class="fa fa-cog"></i> Systems settings</h3>

          <div class="tab">
            <button class="tablinks" id="gen">General Details</button>
            <button class="tablinks" id="thermal-print">Thermal Print</button>
            <button class="tablinks" id="A4-print">A4 Print</button>
            <button class="tablinks" id="sales">ID Settings</button>
            <button class="tablinks" id="dbback">DB Backup</button>
            <button class="tablinks" id="pay-method">Payment Methods</button> 
            <button class="tablinks" id="tax">Taxation</button> 
            <button class="tablinks" id="uom">Unit Of Measure</button> 
            <button class="tablinks" id="take">Stock Take</button> 
          </div> 
        </div>
        <!-- end panel-body -->
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-6 -->
    <!-- begin col-6 -->
    <div class="col-lg-9" id="set"> </div>
    <!-- end col-6 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
</div>
<!-- end page container -->
<!-- ================== BEGIN BASE JS ================== -->
<script src="../../assets/plugins/jquery/jquery-3.2.1.min.js"></script>
<script src="../../assets/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../../assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<!--[if lt IE 9]>
  <script src="../assets/crossbrowserjs/html5shiv.js"></script>
  <script src="../assets/crossbrowserjs/respond.min.js"></script>
  <script src="../assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="../../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../assets/plugins/js-cookie/js.cookie.js"></script>
<script src="../../assets/js/theme/default.min.js"></script>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../../assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
<!-- ================== END PAGE LEVEL JS ================== -->
<script type="text/javascript" src="../../assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js" charset="utf-8"></script>
<script src="../../assets/js/apps.min.js"></script>
<!-- ================== END BASE JS ================== -->
<script>
  $(document).ready(function() {
    App.init();
  });
  <?php include("settings.js");?>
</script>
</body>
</html>

 