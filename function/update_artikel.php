<?php
$id_param = $_POST['id'];
$judul = $_POST['judul'];
$author = $_POST['author'];
$konten = $_POST['konten'];
include 'connection.php';

if($_FILES["foto"]["size"] == 0){
	$query = mysql_query("UPDATE
			tb_artikel
		SET judul = '$judul', author = '$author', content = '$konten', updated_at = NOW()
		WHERE id=$id_param");

	if($query){
	    echo "<script>alert('Data berhasil disimpan.');</script>";
	    echo "<script>location.href='../artikel.php';</script>";
	}
}

else{
	$allowedExts = array("gif", "jpeg", "jpg", "png");
	$temp = explode(".", $_FILES["foto"]["name"]);
	$extension = end($temp);
	if ((($_FILES["foto"]["type"] == "image/gif")
	|| ($_FILES["foto"]["type"] == "image/jpeg")
	|| ($_FILES["foto"]["type"] == "image/jpg")
	|| ($_FILES["foto"]["type"] == "image/pjpeg")
	|| ($_FILES["foto"]["type"] == "image/x-png")
	|| ($_FILES["foto"]["type"] == "image/png"))
	&& in_array($extension, $allowedExts))
	{
	if ($_FILES["foto"]["error"] > 0)
	  {
	  echo "Return Code: " . $_FILES["foto"]["error"] . "<br>";
	  }
	else 
	  {

	    $fileName = $temp[0].".".$temp[1];
	    $temp[0] = rand(0, 3000); //Set to random number
	    $fileName;

	  if (file_exists("../images/article/" . $_FILES["foto"]["name"]))
	    {
	    echo $_FILES["foto"]["name"] . " already exists. ";
	    }
	  else
	    {
	    $temp = explode(".", $_FILES["foto"]["name"]);
		$newfilename = round(microtime(true)) . '.' . end($temp);
		move_uploaded_file($_FILES["foto"]["tmp_name"], "../images/article/" . $newfilename);
	    }
	  }
	}
	else
	{
		echo "Invalid file";
	}

	$query = mysql_query("UPDATE
			tb_artikel
		SET cover = '$newfilename', judul = '$judul', author = '$author', content = '$konten', updated_at = NOW()
		WHERE id=$id_param");

	if($query){
	    echo "<script>alert('Data berhasil disimpan.');</script>";
	    echo "<script>location.href='../artikel.php';</script>";
	}
}
?>