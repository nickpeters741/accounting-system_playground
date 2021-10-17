<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>K-POS</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/font-awesome/5.11.2/css/all.min.css" rel="stylesheet" />
    <link href="assets/plugins/animate/animate.min.css" rel="stylesheet" />
    <link href="assets/css/default/style.css" rel="stylesheet" />
    <link href="assets/css/default/style-responsive.min.css" rel="stylesheet" />
    <link href="assets/css/default/theme/purple.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->
    
    <!-- ================== BEGIN VUE JS ================== -->
   <!--  <script src="assets/js/vue/vue.js"></script> -->
    <!-- ================== END VUE JS ==================== -->

    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->

    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
</head>
<body class="pace-top">
    <!-- begin #page-loader -->
    <div id="page-loader" class="fade show"><span class="spinner"></span></div>
    <!-- end #page-loader -->
    <div id="login-results"></div>
    <div class="login-cover">
        <div class="login-cover-image" style="background-image: url(assets/img/login-bg/login-bg-13.jpg)" data-id="login-cover-image"></div>
        <div class="login-cover-bg"></div>
    </div>
    <!-- begin #page-container -->
    <div id="page-container" class="fade">
        <!-- begin login -->
        <div class="login login-v2" data-pageload-addclass="animated fadeIn">
            <!-- begin brand -->
            <div class="login-header">
                <div class="brand">
                    <span class="logo"></span> <b>K</b>-POS
                    <small>Sales Solution Partner</small>
                </div>
                <div class="icon">
                    <i class="fa fa-lock"></i>
                </div>
            </div>
            <!-- end brand -->
            <!-- begin login-content -->
            <div class="login-content">
                <!-- <form action="index.html" method="GET" class="margin-bottom-0"> -->
                    <!-- <div class="form-group m-b-20">
                        <input type="text" class="form-control form-control-lg" id="kufuri" placeholder="Username" required />
                    </div> -->
                    <div class="form-group m-b-20">
                        <input type="password" class="form-control form-control-lg" id="cabi" placeholder="Password" required />
                    </div>
                   <!--  <div class="form-group col-md-10 col-sm-10 col-xs-12" >
                        <label>SELECT SHOP</label>
                    <div>
                        <div class="radio radio-css radio-inline">
                            <input type="radio" name="shop" id="shop1" value="1" onclick="shop_change();" />
                            <label for="shop1">SHOP 1</label>
                        </div>
                        <div class="radio radio-css radio-inline">
                            <input type="radio" name="shop" id="shop2" value="2" onclick="shop_change();" />
                            <label for="shop2">SHOP 2</label>
                        </div>
                    </div>
                </div> -->
                    <div class="login-buttons">
                        <button type="button"  class="btn btn-success btn-block btn-lg" id="loko"  data-click="logins" disabled="true" >Sign me in</button>
                    </div>
                    <div class="m-t-20">
                        Not a member yet? Click <a href="javascript:;">here</a> to register.
                    </div>
                <!-- </form> -->
            </div>
            <!-- end login-content -->
        </div>
        <!-- end login -->
        
        <ul class="login-bg-list clearfix">
            <li class="active"><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-17.jpg" style="background-image: url(assets/img/login-bg/login-bg-17.jpg)"></a></li>
            <li><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-16.jpg" style="background-image: url(assets/img/login-bg/login-bg-16.jpg)"></a></li>
            <li><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-15.jpg" style="background-image: url(assets/img/login-bg/login-bg-15.jpg)"></a></li>
            <li><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-14.jpg" style="background-image: url(assets/img/login-bg/login-bg-14.jpg)"></a></li>
            <li><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-13.jpg" style="background-image: url(assets/img/login-bg/login-bg-13.jpg)"></a></li>
            <li><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-12.jpg" style="background-image: url(assets/img/login-bg/login-bg-12.jpg)"></a></li>
        </ul>
   <div  id="login-modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
  <div class="modal-dialog" id="modal-load"> 
  </div>
</div>
    </div>
    <!-- end page container -->
    
    <!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/jquery/jquery-3.2.1.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="assets/plugins/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script> 
    <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/plugins/js-cookie/js.cookie.js"></script>
    <script src="assets/js/theme/default.min.js"></script>
    <script src="assets/js/apps.min.js"></script>
    <!-- ================== END BASE JS ================== -->

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="assets/plugins/gritter/js/jquery.gritter.js"></script> 
    <script src="assets/js/demo/ui-modal-notification.demo.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="assets/plugins/Hullabaloo/js/hullabaloo.js"></script> 
    <!-- ================== END PAGE LEVEL JS ================== -->

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="assets/js/demo/login-v2.demo.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->

    <script>
  //       function shop_change(){ 
  //   document.getElementById("loko").disabled =false;
  // }
        $(document).ready(function() {
            App.init();
            LoginV2.init();
            $( "#loko" ).attr( "disabled", false); 
        });
    </script>
</body>
</html>
