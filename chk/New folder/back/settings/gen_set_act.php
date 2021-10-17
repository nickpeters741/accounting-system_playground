<?php
session_start();
include('../../inc/connection.php'); 
$name = mysqli_real_escape_string($connection,$_POST['name']);
$tag = mysqli_real_escape_string($connection,$_POST['tag']);
$phone = mysqli_real_escape_string($connection,$_POST['phone']);
$phone2 = mysqli_real_escape_string($connection,$_POST['phone2']);
$address = mysqli_real_escape_string($connection,$_POST['address']);
$email = mysqli_real_escape_string($connection,$_POST['email']); 
$website = mysqli_real_escape_string($connection,$_POST['website']); 
$logo = mysqli_real_escape_string($connection,$_POST['logo']);  
$mpesa_no = mysqli_real_escape_string($connection,$_POST['mpesa-no']);
$mpesa = mysqli_real_escape_string($connection,$_POST['mpesa-select']);
$mpesa_account = mysqli_real_escape_string($connection,$_POST['mpesa-account']);  

 
 // $file_name = $_FILES["photos"]["name"];
$filename = basename($_FILES['photo']['name']); 
$tmp_name = $_FILES['photo']['tmp_name'];
$ext = strtolower(pathinfo($filename,PATHINFO_EXTENSION));
$imagename = $name.".".$ext;
$target_path = "../../assets/img/logo/".$imagename;
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
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($ext != "jpg" && $ext != "png" && $ext != "jpeg"
&& $ext != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($tmp_name,$target_path)) {
     
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

$check_gen =mysqli_query($connection,"SELECT * FROM kp_settings_gen");
if (mysqli_num_rows($check_gen)<1) {
	$set_print= "INSERT INTO kp_settings_gen(company_name,company_tag,address,phone1,phone2,email,website,mpesa_no,mpesa_account,image_path,mpesa) 
				 VALUES ('$name','$tag','$address','$phone','$phone2','$email','$website','$mpesa_no','$mpesa_account','$target_path','$mpesa')";
	echo $set_print;
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
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong>Success!</strong> Successfully Inserted.
		</div>
		<?php
	}

}else{
	$update_print= "UPDATE kp_settings_gen SET company_name='$name', company_tag='$tag', address='$address', phone1='$phone', phone2='$phone2', email='$email', mpesa_no='$mpesa_no', mpesa_account='$mpesa_account',image_path='$target_path',mpesa='$mpesa',website='$website'";
$update_print_r = mysqli_query($connection,$update_print) or die(mysqli_error($connection));	

if (!$update_print_r) {
?>
<div class="alert alert-danger">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Failed</strong> Failed to update.
</div>
<?php
}else{
	?>
<div class="alert alert-success">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<strong>Success!</strong> Successfully Updated.
</div>
<?php
} 
}
	 
  

 
?>