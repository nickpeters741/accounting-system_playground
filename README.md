# INTRODUCTION.
![WELCOME](https://cdn.dribbble.com/users/720825/screenshots/3253310/slim-jim-_dribbble_-_800x600_.gif)

#  INFORMATION
This repo contain all the necesary file and folders for an accounting system as wel as inventory.It also contain more files related to another test system in development.
All data in the database are purely dumy data to be used for test purposes.

## Quick Overview
This guide contains screenshots of what to expect.
The site has been hosted on one of my subdomains [here](http://chk.nwhdental.com/)

### `login`
default password is : `1234`
![](https://photos.google.com/photo/AF1QipN1F8s3lQueTrXRZxtU3CsHKmZB-aSXg6Xjpcnq)

NB: `the password only works on one machine per login as set`
once loged in the picture below should appear

![](https://photos.google.com/photo/AF1QipNDshV28JSoXQqz-prlL813PQK-lXn9L7Av2r6O)
choose `sales` and it should lead you to the dashboard with the following:
 1. Make Sale -here you can generate  ;
    - receipt
    - invoice
    - pending
 2. sales manager :contain ;
    - sales
    - inventory
    - payment 
 3. input manager  :contains al purchase details;
    - Raise PO
    - Input inventory
    - Purchase orders List
    - Returns
 4. Output Manager :this where you can ad you products
    - Output Inventory 
 5. expenses Manager :this hold record of your expences
    - current Expenses
    - Paid Expenses
6. Finance :this holds all financial records of the entire business.Includes ;
    - total Expenses
    - Total SALES
    - Total Credit
    - P/l Statement
    - Store credit
 7. Reports :this hold detailed reports of company day to day business

 ![](https://photos.google.com/photo/AF1QipNEnUa0bpOlqb_XOyPMWJhDxi6B9lrmOcg3Z82q)  

 # Backend 
 this contains a pRoposed idea of what the employees could use to make sales and track business.
 ![](https://photos.google.com/photo/AF1QipNEnUa0bpOlqb_XOyPMWJhDxi6B9lrmOcg3Z82q)

 # DATABASE
 Used phpmyadmin . 
 With the databse file you can reconfigure setting on any hosting phpmyadmin server as follows;
 
 ```sql
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
```
>THis system is stil in development and therefore you might notice some error in some pages where it is not complete yet in redirecting.



