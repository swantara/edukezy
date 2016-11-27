<?php

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

$judul = $_POST['judul'];
$author = $_POST['author'];
$konten = $_POST['konten'];
include 'connection.php';
$query = mysql_query("INSERT INTO
		tb_artikel(cover, judul, author, content)
	VALUES ('$newfilename', '$judul', '$author', '$konten')");

if($query){
    echo "<script>alert('Data berhasil disimpan.');</script>";
    echo "<script>location.href='../artikel.php';</script>";
}
?>