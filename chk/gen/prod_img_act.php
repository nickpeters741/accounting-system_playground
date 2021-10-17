<?php
session_start();
include('../inc/connection.php'); 
include('../inc/gen_funcs.php');
$id = mysqli_real_escape_string($connection,$_POST['id']); 
$year_dir=date('Y');
$month_dir=date('M');  
$cat_id=get_column("kp_items","cat_id","item_id='$id'");
$category=get_column("kp_category","name","cat_id='$cat_id'");
$folder='../back/prods/img/'.$category;
if (!is_dir($folder)) {
    mkdir($folder, 0777, true);
}

// if (!is_dir('impact_point/'.$year_dir."/".$month_dir)) {
//     mkdir('impact_point/'.$year_dir."/".$month_dir, 0777, true);
// }

$filename = basename($_FILES['photo']['name']); 
$tmp_name = $_FILES['photo']['tmp_name'];

$ext = strtolower(pathinfo($filename,PATHINFO_EXTENSION));

//echo "Extension is ".$ext;
$msg="";

$imagename = "image_".$id.".".$ext;

$target_path = $folder."/".$imagename;

$uploadOk = 1;
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES['photo']['tmp_name']);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_path)) {
   unlink($target_path.$path);
   $uploadOk = 1;
}
// Check file size
if ($_FILES['photo']['size'] > 500000) {
    $msg= "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($ext != "jpg" && $ext != "png" && $ext != "jpeg"
&& $ext != "gif" && $ext != "JPG" && $ext != "PNG") {
    $msg=  "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    $msg=  "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($tmp_name,$target_path)) {
     
    } else {
        $msg=  "Sorry, there was an error uploading your file.";
    }
}
if ($uploadOk==0) {
    ?> 
    <script type="text/javascript">
        var hulla = new hullabaloo();
        hulla.send('Error!!! <?php echo $msg; ?>', "danger");   
    </script>
    <?php
}else{

    $target_path='../'.$target_path;
	$set_print= "UPDATE kp_items SET img='$target_path' WHERE item_id='$id'";
	$set_print_r = mysqli_query($connection,$set_print) or die(mysqli_error($connection));  
	if (!$set_print_r) {
        ?>
        <div class="alert alert-danger">
        	<a href="#" class="close" data-dismiss="alert">&times;</a>
        	<strong>Failed</strong> Failed to insert details.
        </div>
        <?php
    }else{
    	?> 
        <script type="text/javascript">
            var hulla = new hullabaloo();
            hulla.send('Success!!! Image updated successfully', "success");  
            $('#modal').modal('toggle');
            setTimeout( location.reload(), 2000) ;
        </script>
    <?php
    }
    
}

	 
  

 
?>