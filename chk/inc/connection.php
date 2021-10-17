<?php 
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "chk";

$sql_details = array(
    'user' => $dbuser,
    'pass' => $dbpass,
    'db'   => $dbname,
    'host' => $dbhost
);
$connection = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);
//Test if connection error occured

if(mysqli_connect_errno()){
	die("Database conncetion faied:" .mysqli_connect_error(). "(". mysqli_connect_errno().")" );
}

?>