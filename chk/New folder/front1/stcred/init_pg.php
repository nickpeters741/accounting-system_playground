<?php
 include("../clude/head.php"); 
$user_id = $_SESSION['user_id'];
$folder="front/dash/"; 
thesion_page($folder);
clear_thesion_ids($user_id);
$no=0;
$balance=bank_bal(3);
?>

<body> 
 
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->  
      <?php 
        require("../clude/header.php");
      ?>
      <!-- end #header -->
      <!-- begin #menu -->
		<?php include("../clude/menu.php") ?>
		<!-- end #menu -->
    <!-- begin #content -->
 <div id="content" class="content">
  <div class="form-group row">
    <!-- START COL-MD-8 -->
    <div class="col-md-4">
      <div class="panel panel-purple" data-sortable-id="index-1">
        <div id="petty-results"></div>
         <div class="panel-heading">
            <h2 class="panel-title" style="color: white;">ADD CUSTOMER'S STORE CREDIT</h2>
        </div>  
        <div class="panel-body">
          <form  enctype="multipart/form-data" id="petty_form">
            <div class="form-group col-md-12" id="staff_div"  >
              <label>Select Customer</label><br>
              <select type="text" class="selectpicker form-control  col-lg-12" name="cust_id" id="cust_id" data-size="10" data-live-search="true" style="width: 100%;">
                <option value="0">----SELECT CUSTOMER-------</option>
                 <?php
                $get_staff = mysqli_query($connection,"SELECT * FROM kp_customers ORDER BY name ASC") or die("Could not get the staff");
                  while ($type = mysqli_fetch_assoc($get_staff)) {
                ?>
                <option value="<?php echo $type['cust_id']; ?>"><?php echo strtoupper($type['name']); ?></option>
                <?php
                  }
                ?>
              </select>
            </div>  
        </form>
        </div> 
        <div class="panel-footer text-right">
          <button data-toggle="modal" data-target="#petty_modal" id="new-sc" class="btn btn-lime" disabled="true" >SUBMIT</button>
        </div>
      </div> 
    </div>
    <!-- end col-md-8-->
    <!-- start col-md-4-->
    <div class="col-lg-8"> 
      <div class="panel panel-inverse ">
        <div class="panel-heading">
          <h2 class="panel-title" style="color: white;">TODAY'S STORE CREDIT TRANSACTIONS</h2>
        </div>  
        <div class="panel-body" id="sc-today"></div>  
      </div> 
    </div>
  </div>
</div> 
</div> 
    <!-- end col-md-4-->
 <div  id="petty_modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="display: none; width: auto;">
  <div class="modal-dialog" id="load" style="padding: 10px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CONFIRM TRANSACTION</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row">
            <div class="form-group col-md-12" style="margin-bottom:0px;">
              <p style="color: red; margin-bottom:0px;">NB: Dear Supervisor the decision you make at this level binds the whole petty cash to you.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-xs" data-dismiss="modal">Close</button>
          <a class="btn btn-lime btn-xs" onclick="st_submit()">CONTINUE</a>
      </div>
    </div> 
  </div>
</div>
	<!-- end page container -->
	<?php include("../clude/foot.php") ?>
  <script type="text/javascript">
    $(document).ready(function() { 
      App.init(); 
    });
  </script>
   <script type="text/javascript">
  function scitems(){ 
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET","sctoday.php",false);
    xmlhttp.send(null);
    document.getElementById("sc-today").innerHTML = xmlhttp.responseText;
    document.getElementById("sc-today").style.visibility = "visible";
  }
  window.onload = scitems(); 
    $('#cust_id').change(function () {
    selectVal = $('#cust_id').val();
    if (selectVal == 0) {
       
     document.getElementById("new-sc").disabled =true;
       // document.getElementById('price-div').style.display = 'none';
    }
    else {
      // document.getElementById('price-div').style.display = 'block';
      // $( "#retail" ).prop( "checked", false );
      // $( "#online" ).prop( "checked", false );
     document.getElementById("new-sc").disabled =false;
    }
  })
function st_submit(){
  selectVal = $('#cust_id').val();
  window.location = '../stcred/add_st.php?id='+selectVal;
}
</script>