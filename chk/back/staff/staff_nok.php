<?php
session_start();
include("../../inc/connection.php");
include('../../inc/gen_funcs.php');
if(isset($_REQUEST['id'])){
	$id = $_REQUEST['id'];
    $get_details = mysqli_query($connection,"SELECT * FROM kp_staff WHERE staff_id='$id'") or die("Could not get the customer details");
    $row = mysqli_fetch_assoc($get_details);
     $action="LOADED|-|-|STAFF NEXT OF KIN MODAL FOR |".$row['staff_name'];
    logs($action,"../../");
}
?>
<div class="modal-content">
   		<div class="modal-header"> 
   			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   			<h4 class="modal-title"> <i class="fa fa-stats"></i> &nbsp;&nbsp;<?php echo $row['staff_name']; ?> Next of Kin Details</h4> 
   		</div>
   		<div class="modal-body">  
   			 <table class="table table-striped table-bordered">  
                <tbody>
                    <tr>
                        <td><b>Name</b></td>
                        <td><?php echo $row['staff_kin_name']; ?></td>
                    </tr>
                    <tr>
                        <td><b>Phone</b></td>
                        <td><?php echo $row['staff_kin_phone']; ?></td>
                    </tr>
                    <tr>
                        <td><b>Address</b></td>
                        <td><?php echo $row['staff_kin_address']; ?></td>
                    </tr>  
                </tbody>     
             </table>
   		</div>
   	</div> 
 