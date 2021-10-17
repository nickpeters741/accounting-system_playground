<?php
$filename = $_REQUEST['filename'];
header('Content-type: text/plain');
header('Content-Disposition: attachment; filename='.$filename.'');

$filecontents = file_get_contents('zbackupdatabasefiles/'.$filename);

echo $filecontents;

?>