<?php
include('../../inc/connection.php');
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);
$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);
$no=0;

$requestData = $_REQUEST;  

$query =mysqli_query($connection,"SELECT * FROM kp_po WHERE ord_date BETWEEN '$start_date' AND '$end_date' GROUP BY ord_date ORDER BY ord_date DESC")or die(mysqli_error($connection)."Mysql Error in getting : day sales");
$totalData = mysqli_num_rows($query);
$totalFiltered = $totalData;  
$data = array();
while ($row = mysqli_fetch_array($query)) {  // preparing an array
	$nestedData = array(); 
	$day = $row['day'];
   $amount = $row['amount'];
	$no=$no+1; 
    $nestedData[] = $no;
    $nestedData[] = $row['ord_date']; 
    $nestedData[] = $amount; 
    // $nestedData[] = "<a href='day_report_view.php?day=".$day."&type=1' class='btn btn-primary btn-xs hidden-print'>CASH</a>&nbsp;&nbsp;"." <a href='day_report_view.php?day=".$day."&type=2' class='btn btn-warning btn-xs pull-center'>CREDIT</a>&nbsp;&nbsp;"." <a href='day_report_view.php?day=".$day."&type=3' class='btn btn-purple btn-xs pull-center'>COMBINED</a>&nbsp;&nbsp;";
    $data[] = $nestedData;
    //." <a href='day_report_view.php?day=".$day."&type=3' class='btn btn-lime btn-xs pull-center'>CLOSE OF DAY</a>&nbsp;&nbsp;"
}   
 $json_data = array(
    "draw" => intval($requestData['draw']), 
    "recordsTotal" => intval($totalData), 
    "recordsFiltered" => intval($totalFiltered),
    "data" => $data
);
echo json_encode($json_data); 
?>