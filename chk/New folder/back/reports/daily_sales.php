<?php
include('../../inc/connection.php');
include('funcs.php');
$start_date = mysqli_real_escape_string($connection,$_GET['start_date']);
$end_date = mysqli_real_escape_string($connection,$_GET['end_date']);
$no=0;

$requestData = $_REQUEST;  

$query =mysqli_query($connection,"SELECT * FROM kp_sales WHERE day BETWEEN '$start_date' AND '$end_date' GROUP BY day ORDER BY day DESC")or die(mysqli_error($connection)."Mysql Error in getting : day sales");
$totalData = mysqli_num_rows($query);
$totalFiltered = $totalData;  
$data = array();
while ($row = mysqli_fetch_array($query)) {  // preparing an array
	$nestedData = array(); 
	$day = $row['day'];
	$no=$no+1;
	$cash_total = mysqli_query($connection,"SELECT SUM(total_amount) AS cash_sum FROM kp_sales WHERE type=1 AND day='$day'");
   	$css = mysqli_fetch_assoc($cash_total);
   	$cred_total = mysqli_query($connection,"SELECT SUM(total_amount) AS cred_sum FROM kp_sales WHERE type=2 AND day='$day'");
    $crs= mysqli_fetch_assoc($cred_total);
   	$cash=$css['cash_sum'];
   	$credit=$crs['cred_sum'];
    $nestedData[] = $no;
    $nestedData[] = $row['day'];
    if (empty($cash) || $cash=="NULL") {
    	$cash=0;
    }elseif (empty($credit) || $credit=="NULL") {
   		$credit=0; 
    }
    $nestedData[] = $cash;
    $nestedData[] = $credit; 
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