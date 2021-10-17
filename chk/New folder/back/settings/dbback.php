<?php 
 include("../../inc/connection.php");
 include("funcs.php"); 

//http://davidwalsh.name/backup-mysqli-database-php
// date_default_timezone_set('Asia/Calcutta'); 

// //Values From db_connect.php file.
// $localhost = $hostname;
// $dbusername = $hostlogin;
// $password = $hostpassword;
// $databasename = $databasename;

// backup_tables($localhost, $dbusername, $password, $databasename);

// /* backup the db OR just a table */
// function backup_tables($host,$user,$pass,$name,$tables = '*')
// {
// 	$backuptime = date('YMd_His');
// 	$backupdatabasefiletime = date('Y-m-d H:i:s');
// 	$username = $_SESSION["username"];
// 	$ipaddress = $_SERVER["REMOTE_ADDR"];
	
// 	$backupdatabasefilename = 'DB_Backup_'.$backuptime.'.sql';
// 	$backupdatabasefiletime =  $backupdatabasefiletime;
	
// 	$query1db = "insert into master_backupdatabase (backupfilename, backupfiledate, username, ipaddress) 
// 	values ('$backupdatabasefilename', '$backupdatabasefiletime', '$username', '$ipaddress')";
	
// 	$link = mysqli_connect($host,$user,$pass);
// 	mysqli_select_db($link,$name);

// 	$exec1db = mysqli_query($link,$query1db) or die ("Error in Query1db".mysqli_error($link));

// 	$return = '';
	
	
// 	//get all of the tables
// 	if($tables == '*')
// 	{
// 		$tables = array();
// 		$result = mysqli_query($link, 'SHOW TABLES');
// 		while($row = mysqli_fetch_row($result))
// 		{
// 			$tables[] = $row[0];
// 		}
// 	}
// 	else
// 	{
// 		$tables = is_array($tables) ? $tables : explode(',',$tables);
// 	}
	
// 	//cycle through
// 	foreach($tables as $table)
// 	{
// 		$result = mysqli_query($link, 'SELECT * FROM '.$table);
// 		$num_fields = mysqli_num_fields($result);
		
// 		//$return.= 'DROP TABLE '.$table.';';
// 		$row2 = mysqli_fetch_row(mysqli_query($link, 'SHOW CREATE TABLE '.$table));
// 		$return.= "\n\n".$row2[1].";\n\n";
		
// 		for ($i = 0; $i < $num_fields; $i++) 
// 		{
// 			while($row = mysqli_fetch_row($result))
// 			{
// 				$return.= 'INSERT INTO '.$table.' VALUES(';
// 				for($j=0; $j<$num_fields; $j++) 
// 				{
// 					$row[$j] = addslashes($row[$j]);
					
// 					//Slash after and before double quote is compulsory.
// 					$patterns = "/\n/";
// 					$replacements = "/\\n/";
// 					$string = $row[$j]; 
					
// 					//$row[$j] = preg_replace("\n","\\n",$row[$j]); 
// 					$row[$j] = preg_replace($patterns, $replacements, $string);
					
// 					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
// 					if ($j<($num_fields-1)) { $return.= ','; }
// 				}
// 				$return.= ");\n";
// 			}
// 		}
// 		$return.="\n\n\n";
// 	}
	
// 	//$backuptime = date('YMd_His');
// 	//$backupdatabasefiletime = date('Y-m-d H:i:s');
// 	//$username = $_SESSION["username"];
// 	//$ipaddress = $_SERVER["REMOTE_ADDR"];

// 	//save file
// 	//$handle = fopen('db-backup-'.time().'-'.(md5(implode(',',$tables))).'.sql','w+');
	
// 	$handle = fopen('zbackupdatabasefiles/DB_Backup_'.$backuptime.'.sql','w+'); //z given to list folders at the end.
// 	fwrite($handle,$return);
// 	fclose($handle);
	
// 	//$backupdatabasefilename = 'DB_Backup_'.$backuptime.'.sql';
// 	//$backupdatabasefiletime =  $backupdatabasefiletime;
	
// 	//$query1db = "insert into master_backupdatabase (backupfilename, backupfiledate, username, ipaddress) 
// 	//values ('$backupdatabasefilename', '$backupdatabasefiletime', '$username', '$ipaddress')";
// 	//$exec1db = mysqli_query($link, $query1db) or die ("Error in Query1db".mysqli_error());
	
// }


backup_tables();

?>